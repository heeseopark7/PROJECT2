//==============================================================================
// Testbench : tb_tx_logic
// DUT       : tx_logic
// Method    : Self-checking. The TX FIFO is replaced by a small model inside
//             this testbench (i_fifo_empty / i_fifo_rdata / o_fifo_pop). The
//             baud tick is made here too: one pulse every TICK_DIV clocks, so
//             one bit = 16 ticks = BIT clocks.
//             o_txd is checked on EVERY clock of a frame (expect_frame), so a
//             wrong bit value, a wrong bit length, a missing parity bit or a
//             wrong stop length is caught. The expected frame is built here
//             from the pushed byte, independent of the DUT.
//
// Tests     : (1)  idle line, no activity without data
//             (2)  8N1 frames (start, 8 data bits LSB first, stop)
//             (3)  even / odd parity frames
//             (4)  back-to-back frames (next start right after the stop bit)
//             (5)  i_tx_en : off -> no start, dropped in the middle -> frame
//                  is finished but the next one does not start
//             (6)  break : enter, hold, leave (stop bit follows), break request
//                  in the middle of a frame, break with i_tx_en = 0
//             (7)  tick gating : nothing moves without i_tick_16x
//             (8)  asynchronous reset in the middle of a frame
//             (9)  parity sweep : all 256 byte values, even and odd parity
//             (10) random bursts with random parity settings
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_tx_logic;

//------------------------------------------------------------------------------
// Timing : one tick every TICK_DIV clocks, one bit = 16 ticks
//------------------------------------------------------------------------------
localparam  TICK_DIV    = 3                         ;
localparam  BIT         = 16 * TICK_DIV             ;   // clocks per bit

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg                     clk                         ;
reg                     nRst                        ;
reg                     i_tick_16x                  ;
reg                     i_tx_en                     ;
reg                     i_brk                       ;
reg                     i_pen                       ;
reg                     i_eps                       ;
wire                    i_fifo_empty                ;
wire    [7:0]           i_fifo_rdata                ;
wire                    o_fifo_pop                  ;
wire                    o_txd                       ;
wire                    o_tx_busy                   ;

//------------------------------------------------------------------------------
// Testbench state
//------------------------------------------------------------------------------
integer                 err_cnt                     ;
integer                 sec_err                     ;
integer                 cyc                         ;   // clock counter
integer                 seed                        ;
integer                 i, j, k                     ;

reg                     tick_en                     ;   // 0 = stop the baud ticks
integer                 tcnt                        ;

// TX FIFO model
reg     [7:0]           q_mem   [0:255]             ;
reg     [7:0]           q_wr                        ;   // push index (testbench side)
reg     [7:0]           q_head                      ;   // pop index  (DUT side)
integer                 q_cnt                       ;   // entries stored
integer                 pop_cnt                     ;   // total pops seen
reg                     pop_d                       ;   // pop of the previous clock

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
tx_logic    uut (
                .clk            (clk            )   ,
                .nRst           (nRst           )   ,
                .i_tick_16x     (i_tick_16x     )   ,
                .i_tx_en        (i_tx_en        )   ,
                .i_brk          (i_brk          )   ,
                .i_fifo_empty   (i_fifo_empty   )   ,
                .i_pen          (i_pen          )   ,
                .i_fifo_rdata   (i_fifo_rdata   )   ,
                .i_eps          (i_eps          )   ,
                .o_fifo_pop     (o_fifo_pop     )   ,
                .o_txd          (o_txd          )   ,
                .o_tx_busy      (o_tx_busy      )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz, clock counter
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

initial cyc = 0;
always @(posedge clk) cyc <= cyc + 1;

//------------------------------------------------------------------------------
// Baud tick : 1-clock pulse every TICK_DIV clocks (while tick_en = 1)
//------------------------------------------------------------------------------
always @(posedge clk or negedge nRst) begin
    if (!nRst) begin
        tcnt        <= 0;
        i_tick_16x  <= 1'b0;
    end
    else if (tcnt == TICK_DIV - 1) begin
        tcnt        <= 0;
        i_tick_16x  <= tick_en;
    end
    else begin
        tcnt        <= tcnt + 1;
        i_tick_16x  <= 1'b0;
    end
end

//------------------------------------------------------------------------------
// TX FIFO model
//   - empty flag and head byte are combinational, like the real FIFO
//   - a pop moves the head on the clock edge (non-blocking), so the DUT still
//     sees the old head on the edge where it takes the byte
//------------------------------------------------------------------------------
assign  i_fifo_empty = (q_cnt == 0);
assign  i_fifo_rdata = q_mem[q_head];

always @(posedge clk) begin
    if (nRst) begin
        if (o_fifo_pop) begin
            if (q_cnt == 0) begin
                $display("[FAIL] %0t : o_fifo_pop while the FIFO is empty", $time);
                err_cnt = err_cnt + 1;
            end
            if (pop_d) begin
                $display("[FAIL] %0t : o_fifo_pop is wider than 1 clock", $time);
                err_cnt = err_cnt + 1;
            end
            q_head  <= q_head + 1;
            q_cnt   <= q_cnt - 1;
            pop_cnt <= pop_cnt + 1;
        end
        pop_d <= o_fifo_pop;
    end
end

//------------------------------------------------------------------------------
// Tasks
//------------------------------------------------------------------------------
task push_byte(input [7:0] d);
begin
    @(negedge clk);
    q_mem[q_wr] = d;
    q_wr        = q_wr + 1;
    q_cnt       = q_cnt + 1;
end
endtask

task wait_clk(input integer n);
begin
    repeat (n) @(posedge clk);
    #1;
end
endtask

// Several bytes are pushed one clock apart. If the ticks kept running, the first
// frame could already be on the line before the checker starts to look at it,
// so the ticks are held while pushing and released right before checking.
task ticks_off;
begin
    @(negedge clk) tick_en = 1'b0;
    wait_clk(TICK_DIV + 1);                     // let a tick that is already running pass
end
endtask

task ticks_on;
begin
    @(negedge clk) tick_en = 1'b1;
end
endtask

// Line must stay idle (txd = 1, busy = 0, no pop) for n clocks
task expect_idle(input integer n);
    integer c;
    integer pops;
begin
    pops = pop_cnt;
    for (c = 0; c < n; c = c + 1) begin
        wait_clk(1);
        if (o_txd !== 1'b1 || o_tx_busy !== 1'b0) begin
            $display("[FAIL] %0t : line not idle (txd=%b busy=%b)", $time, o_txd, o_tx_busy);
            err_cnt = err_cnt + 1;
            c = n;
        end
    end
    if (pop_cnt != pops) begin
        $display("[FAIL] %0t : a byte was taken while the line must be idle", $time);
        err_cnt = err_cnt + 1;
    end
end
endtask

// Check one frame on every clock.
//   d, p_en, p_eps : byte and parity setting that were used
//   chain          : 1 = another frame follows, the sample right after the stop
//                    bit must already be its start bit (or break level);
//                    0 = the line must be idle (txd = 1, busy = 0) right after
//   already        : 1 = the current sample is already the first sample of the
//                    start bit (use it after chain = 1 or after a break)
task expect_frame(input [7:0] d, input p_en, input p_eps, input chain, input already);
    integer nb;
    integer b;
    integer c;
    integer t;
    reg     par;
    reg     exp_bit;
begin
    nb  = p_en ? 11 : 10;                       // start + 8 data + [parity] + stop
    par = p_eps ? (^d) : ~(^d);

    if (!already) begin
        t = 0;
        wait_clk(1);
        while (o_txd !== 1'b0 && t < 40 * BIT) begin
            wait_clk(1);
            t = t + 1;
        end
    end
    if (o_txd !== 1'b0) begin
        $display("[FAIL] %0t : frame %h never started", $time, d);
        err_cnt = err_cnt + 1;
    end
    else begin
        for (b = 0; b < nb; b = b + 1) begin
            if (b == 0)                     exp_bit = 1'b0;
            else if (b <= 8)                exp_bit = d[b - 1];
            else if (p_en && b == 9)        exp_bit = par;
            else                            exp_bit = 1'b1;          // stop
            for (c = 0; c < BIT; c = c + 1) begin
                if (!(b == 0 && c == 0)) wait_clk(1);   // first sample is already taken
                if (o_txd !== exp_bit || o_tx_busy !== 1'b1) begin
                    $display("[FAIL] %0t : frame %h bit %0d clk %0d : txd=%b busy=%b (exp txd=%b busy=1)",
                              $time, d, b, c, o_txd, o_tx_busy, exp_bit);
                    err_cnt = err_cnt + 1;
                    c = BIT; b = nb;            // stop checking this frame
                end
            end
        end
        // sample right after the stop bit
        wait_clk(1);
        if (chain) begin
            if (o_txd !== 1'b0 || o_tx_busy !== 1'b1) begin
                $display("[FAIL] %0t : next frame did not follow the stop bit (txd=%b busy=%b)",
                          $time, o_txd, o_tx_busy);
                err_cnt = err_cnt + 1;
            end
        end
        else if (o_txd !== 1'b1 || o_tx_busy !== 1'b0) begin
            $display("[FAIL] %0t : line not idle after the stop bit (txd=%b busy=%b)",
                      $time, o_txd, o_tx_busy);
            err_cnt = err_cnt + 1;
        end
    end
end
endtask

task begin_test;
begin
    sec_err = err_cnt;
end
endtask

task end_test(input [8*44-1:0] name);
begin
    if (err_cnt == sec_err) $display("[PASS] %0s", name);
    else                    $display("[FAIL] %0s", name);
end
endtask

// Set parity mode on the falling edge (only while the line is idle)
task set_parity(input p_en, input p_eps);
begin
    @(negedge clk);
    i_pen = p_en;
    i_eps = p_eps;
end
endtask

// Push n bytes (data = base + index), then check n chained frames
task burst(input integer n, input [7:0] base, input p_en, input p_eps);
    integer m;
begin
    ticks_off;
    for (m = 0; m < n; m = m + 1) push_byte(base + m[7:0]);
    ticks_on;
    for (m = 0; m < n; m = m + 1)
        expect_frame(base + m[7:0], p_en, p_eps, (m != n - 1), (m != 0));
end
endtask

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer n_high;
integer pops_before;
reg     keep_txd;
reg     keep_busy;
reg [7:0] rnd_d;
integer   rnd_n;
reg       rnd_pen;
reg       rnd_eps;

initial begin
    err_cnt = 0;
    seed    = 32'h0BAD_CAFE;
    tick_en = 1'b1;
    nRst    = 1'b1;
    i_tx_en = 1'b1;
    i_brk   = 1'b0;
    i_pen   = 1'b0;
    i_eps   = 1'b0;
    q_wr    = 0;  q_head = 0;  q_cnt = 0;  pop_cnt = 0;  pop_d = 1'b0;
    #1;
    nRst    = 1'b0;                              // initial reset
    wait_clk(3);
    nRst    = 1'b1;

    //--------------------------------------------------------------------------
    // (1) idle line
    //--------------------------------------------------------------------------
    begin_test;
    expect_idle(100);
    end_test("(1) idle line, no activity without data");

    //--------------------------------------------------------------------------
    // (2) 8N1 frames
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b0, 1'b0);
    push_byte(8'h55);  expect_frame(8'h55, 1'b0, 1'b0, 1'b0, 1'b0);
    push_byte(8'hA3);  expect_frame(8'hA3, 1'b0, 1'b0, 1'b0, 1'b0);
    push_byte(8'h00);  expect_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b0);
    push_byte(8'hFF);  expect_frame(8'hFF, 1'b0, 1'b0, 1'b0, 1'b0);
    push_byte(8'h01);  expect_frame(8'h01, 1'b0, 1'b0, 1'b0, 1'b0);
    push_byte(8'h80);  expect_frame(8'h80, 1'b0, 1'b0, 1'b0, 1'b0);
    expect_idle(60);
    end_test("(2) 8N1 frames");

    //--------------------------------------------------------------------------
    // (3) parity frames
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b1, 1'b1);                      // even parity
    push_byte(8'h01);  expect_frame(8'h01, 1'b1, 1'b1, 1'b0, 1'b0);   // parity 1
    push_byte(8'h03);  expect_frame(8'h03, 1'b1, 1'b1, 1'b0, 1'b0);   // parity 0
    push_byte(8'h00);  expect_frame(8'h00, 1'b1, 1'b1, 1'b0, 1'b0);   // parity 0
    push_byte(8'hFF);  expect_frame(8'hFF, 1'b1, 1'b1, 1'b0, 1'b0);   // parity 0
    set_parity(1'b1, 1'b0);                      // odd parity
    push_byte(8'h01);  expect_frame(8'h01, 1'b1, 1'b0, 1'b0, 1'b0);   // parity 0
    push_byte(8'h00);  expect_frame(8'h00, 1'b1, 1'b0, 1'b0, 1'b0);   // parity 1
    push_byte(8'h7F);  expect_frame(8'h7F, 1'b1, 1'b0, 1'b0, 1'b0);   // parity 0
    push_byte(8'hFF);  expect_frame(8'hFF, 1'b1, 1'b0, 1'b0, 1'b0);   // parity 1
    expect_idle(60);
    end_test("(3) even / odd parity frames");

    //--------------------------------------------------------------------------
    // (4) back-to-back frames
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b0, 1'b0);
    burst(4, 8'h31, 1'b0, 1'b0);
    expect_idle(40);
    set_parity(1'b1, 1'b1);
    burst(3, 8'hC8, 1'b1, 1'b1);
    expect_idle(40);
    end_test("(4) back-to-back frames");

    //--------------------------------------------------------------------------
    // (5) i_tx_en
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b0, 1'b0);
    @(negedge clk) i_tx_en = 1'b0;
    push_byte(8'h6B);
    expect_idle(6 * BIT);                        // data waits, nothing starts
    @(negedge clk) i_tx_en = 1'b1;
    expect_frame(8'h6B, 1'b0, 1'b0, 1'b0, 1'b0);
    // dropped in the middle of a frame : frame is finished, next one waits
    ticks_off;
    push_byte(8'h2C);
    push_byte(8'hD5);
    ticks_on;
    fork
        expect_frame(8'h2C, 1'b0, 1'b0, 1'b0, 1'b0);
        begin
            repeat (3 * BIT) @(posedge clk);
            @(negedge clk) i_tx_en = 1'b0;
        end
    join
    if (q_cnt != 1) begin
        $display("[FAIL] second byte must still be in the FIFO (q_cnt=%0d)", q_cnt);
        err_cnt = err_cnt + 1;
    end
    expect_idle(4 * BIT);
    @(negedge clk) i_tx_en = 1'b1;
    expect_frame(8'hD5, 1'b0, 1'b0, 1'b0, 1'b0);
    end_test("(5) i_tx_en off / dropped in the middle");

    //--------------------------------------------------------------------------
    // (6) break
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b0, 1'b0);
    // (6a) break from idle, a byte is waiting, it must not start during break
    pops_before = pop_cnt;
    @(negedge clk) i_brk = 1'b1;
    push_byte(8'h4E);
    wait_clk(3 * TICK_DIV);
    for (k = 0; k < 6 * BIT; k = k + 1) begin
        wait_clk(1);
        if (o_txd !== 1'b0 || o_tx_busy !== 1'b1) begin
            $display("[FAIL] %0t : break level / busy wrong (txd=%b busy=%b)", $time, o_txd, o_tx_busy);
            err_cnt = err_cnt + 1;
            k = 6 * BIT;
        end
    end
    if (pop_cnt != pops_before) begin
        $display("[FAIL] a byte was taken during break");
        err_cnt = err_cnt + 1;
    end
    // leave break : the line goes high for exactly one stop bit, then the
    // waiting byte starts right away
    @(negedge clk) i_brk = 1'b0;
    k = 0;
    while (o_txd !== 1'b1 && k < 4 * TICK_DIV) begin wait_clk(1); k = k + 1; end
    n_high = 0;
    while (o_txd === 1'b1 && n_high < 3 * BIT) begin
        if (o_tx_busy !== 1'b1) begin
            $display("[FAIL] %0t : busy dropped inside the stop bit after break", $time);
            err_cnt = err_cnt + 1;
        end
        n_high = n_high + 1;
        wait_clk(1);
    end
    if (n_high != BIT) begin
        $display("[FAIL] stop bit after break lasts %0d clk (exp %0d)", n_high, BIT);
        err_cnt = err_cnt + 1;
    end
    expect_frame(8'h4E, 1'b0, 1'b0, 1'b0, 1'b1);

    // (6b) break request in the middle of a frame : frame is finished, then break
    push_byte(8'h9D);
    fork
        expect_frame(8'h9D, 1'b0, 1'b0, 1'b1, 1'b0);   // chain=1 : break level follows
        begin
            repeat (3 * BIT) @(posedge clk);
            @(negedge clk) i_brk = 1'b1;
        end
    join
    for (k = 0; k < 3 * BIT; k = k + 1) begin
        wait_clk(1);
        if (o_txd !== 1'b0 || o_tx_busy !== 1'b1) begin
            $display("[FAIL] %0t : break after the frame is wrong (txd=%b busy=%b)", $time, o_txd, o_tx_busy);
            err_cnt = err_cnt + 1;
            k = 3 * BIT;
        end
    end
    @(negedge clk) i_brk = 1'b0;
    k = 0;
    while (o_txd !== 1'b1 && k < 4 * TICK_DIV) begin wait_clk(1); k = k + 1; end
    n_high = 0;
    while (o_tx_busy === 1'b1 && n_high < 3 * BIT) begin
        if (o_txd !== 1'b1) begin
            $display("[FAIL] %0t : line must be 1 in the stop bit after break", $time);
            err_cnt = err_cnt + 1;
        end
        n_high = n_high + 1;
        wait_clk(1);
    end
    if (n_high != BIT) begin
        $display("[FAIL] stop bit after break lasts %0d clk (exp %0d)", n_high, BIT);
        err_cnt = err_cnt + 1;
    end
    expect_idle(2 * BIT);

    // (6c) break request with i_tx_en = 0 is ignored
    @(negedge clk) i_tx_en = 1'b0;
    @(negedge clk) i_brk   = 1'b1;
    expect_idle(5 * BIT);
    @(negedge clk) i_brk   = 1'b0;
    @(negedge clk) i_tx_en = 1'b1;
    expect_idle(2 * BIT);
    end_test("(6) break enter / hold / leave");

    //--------------------------------------------------------------------------
    // (7) tick gating
    //--------------------------------------------------------------------------
    begin_test;
    @(negedge clk) tick_en = 1'b0;
    wait_clk(2 * TICK_DIV);
    push_byte(8'hE1);
    expect_idle(10 * BIT);                       // without ticks nothing starts
    @(negedge clk) tick_en = 1'b1;
    expect_frame(8'hE1, 1'b0, 1'b0, 1'b0, 1'b0);
    // stop the ticks in the middle of a frame : txd and busy must hold
    push_byte(8'hB2);
    wait_clk(5 * BIT);
    @(negedge clk) tick_en = 1'b0;
    wait_clk(2 * TICK_DIV + 2);
    keep_txd  = o_txd;
    keep_busy = o_tx_busy;
    for (k = 0; k < 400; k = k + 1) begin
        wait_clk(1);
        if (o_txd !== keep_txd || o_tx_busy !== keep_busy) begin
            $display("[FAIL] %0t : output changed without ticks", $time);
            err_cnt = err_cnt + 1;
            k = 400;
        end
    end
    pops_before = pop_cnt;
    @(negedge clk) tick_en = 1'b1;
    k = 0;
    while (o_tx_busy !== 1'b0 && k < 20 * BIT) begin wait_clk(1); k = k + 1; end
    if (o_tx_busy !== 1'b0 || o_txd !== 1'b1 || q_cnt != 0) begin
        $display("[FAIL] frame did not finish after the ticks came back");
        err_cnt = err_cnt + 1;
    end
    end_test("(7) tick gating");

    //--------------------------------------------------------------------------
    // (8) asynchronous reset in the middle of a frame
    //--------------------------------------------------------------------------
    begin_test;
    push_byte(8'hA7);
    wait_clk(4 * BIT);
    if (o_tx_busy !== 1'b1) begin
        $display("[FAIL] frame should be running before the reset");
        err_cnt = err_cnt + 1;
    end
    #1 nRst = 1'b0;
    #2;
    if (o_txd !== 1'b1 || o_tx_busy !== 1'b0) begin   // no clock edge needed
        $display("[FAIL] %0t : reset did not clear the output (txd=%b busy=%b)", $time, o_txd, o_tx_busy);
        err_cnt = err_cnt + 1;
    end
    wait_clk(3);
    nRst   = 1'b1;
    q_head = q_wr;  q_cnt = 0;                    // the FIFO model is emptied too
    expect_idle(2 * BIT);
    push_byte(8'h5C);                             // a new frame must start cleanly
    expect_frame(8'h5C, 1'b0, 1'b0, 1'b0, 1'b0);
    end_test("(8) asynchronous reset in a frame");

    //--------------------------------------------------------------------------
    // (9) parity sweep : all 256 values, even and odd
    //--------------------------------------------------------------------------
    begin_test;
    set_parity(1'b1, 1'b1);
    for (i = 0; i < 32; i = i + 1) burst(8, i[4:0] * 8, 1'b1, 1'b1);
    set_parity(1'b1, 1'b0);
    for (i = 0; i < 32; i = i + 1) burst(8, i[4:0] * 8, 1'b1, 1'b0);
    expect_idle(40);
    end_test("(9) parity sweep, all 256 bytes x even/odd");

    //--------------------------------------------------------------------------
    // (10) random bursts, random parity
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 60; i = i + 1) begin
        rnd_pen = $random(seed);
        rnd_eps = $random(seed);
        rnd_n   = 1 + ({$random(seed)} % 4);
        rnd_d   = $random(seed);
        set_parity(rnd_pen, rnd_eps);
        burst(rnd_n, rnd_d, rnd_pen, rnd_eps);
        expect_idle({$random(seed)} % 40);
    end
    end_test("(10) random bursts / parity settings");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_tx_logic : ALL PASS ===");
    else              $display("=== tb_tx_logic : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_tx_logic.vcd");
    $dumpvars(0, tb_tx_logic);
end

initial begin
    #200000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule