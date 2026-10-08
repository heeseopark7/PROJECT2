//==============================================================================
// Testbench : tb_rx_logic
// DUT       : rx_logic
// Method    : Self-checking. The testbench is the transmitter: it drives a
//             serial frame on i_rxd (send_frame) and, at the same time, writes
//             the expected {BE, PE, FE, DATA[7:0]} into an expectation queue.
//             The expectation is built here from the frame that is sent
//             (independent of the DUT). A monitor compares every o_fifo_push
//             with the queue, so a missing, extra, wrong or too wide push is
//             caught. o_overrun is counted separately.
//             The baud tick is made here: one pulse every TICK_DIV clocks, so
//             one bit = 16 ticks = BIT clocks.
//
// Tests     : (1)  idle line, nothing is pushed
//             (2)  8N1 frames, push timing (middle of the stop bit)
//             (3)  parity : good parity -> PE = 0, wrong parity -> PE = 1
//             (4)  framing error (stop bit = 0), alone and with PE
//             (5)  break : BE = FE = 1 and PE = 0, long break gives one push
//             (6)  start-bit glitch is rejected, next frame still works
//             (7)  i_rx_en : off -> frame ignored, dropped in the middle ->
//                  frame is still received
//             (8)  overrun : FIFO full -> o_overrun, no push
//             (9)  back-to-back frames, fast stop bit (next start comes early)
//             (10) bit time tolerance (+-1 clock per bit)
//             (11) asynchronous reset in the middle of a frame
//             (12) random frames (data, parity, errors, gaps, alignment)
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_rx_logic;

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
reg                     i_rxd                       ;
reg                     i_tick_16x                  ;
reg                     i_rx_en                     ;
reg                     i_pen                       ;
reg                     i_eps                       ;
reg                     i_fifo_full                 ;
wire                    o_fifo_push                 ;
wire    [10:0]          o_fifo_wdata                ;
wire                    o_overrun                   ;

//------------------------------------------------------------------------------
// Testbench state
//------------------------------------------------------------------------------
integer                 err_cnt                     ;
integer                 sec_err                     ;
integer                 cyc                         ;   // clock counter
integer                 seed                        ;
integer                 i                           ;

integer                 tcnt                        ;

// transmit side settings
integer                 bit_clks                    ;   // length of one bit on i_rxd
integer                 stop_len                    ;   // length of the stop bit on i_rxd
integer                 start_cyc                   ;   // clock count at the start edge

// expectation queue and monitor
reg     [10:0]          exp_mem [0:2047]            ;
integer                 exp_wr                      ;
integer                 exp_rd                      ;
integer                 push_cnt                    ;
integer                 ovr_cnt                     ;
integer                 last_push_cyc               ;
reg                     push_d                      ;
reg                     ovr_d                       ;

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
rx_logic    uut (
                .clk            (clk            )   ,
                .nRst           (nRst           )   ,
                .i_rxd          (i_rxd          )   ,
                .i_tick_16x     (i_tick_16x     )   ,
                .i_rx_en        (i_rx_en        )   ,
                .i_pen          (i_pen          )   ,
                .i_eps          (i_eps          )   ,
                .i_fifo_full    (i_fifo_full    )   ,
                .o_fifo_push    (o_fifo_push    )   ,
                .o_fifo_wdata   (o_fifo_wdata   )   ,
                .o_overrun      (o_overrun      )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz, clock counter
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

initial cyc = 0;
always @(posedge clk) cyc <= cyc + 1;

//------------------------------------------------------------------------------
// Baud tick : 1-clock pulse every TICK_DIV clocks
//------------------------------------------------------------------------------
always @(posedge clk or negedge nRst) begin
    if (!nRst) begin
        tcnt        <= 0;
        i_tick_16x  <= 1'b0;
    end
    else if (tcnt == TICK_DIV - 1) begin
        tcnt        <= 0;
        i_tick_16x  <= 1'b1;
    end
    else begin
        tcnt        <= tcnt + 1;
        i_tick_16x  <= 1'b0;
    end
end

//------------------------------------------------------------------------------
// Monitor : every push must match the next expected character
//------------------------------------------------------------------------------
always @(posedge clk) begin
    if (nRst) begin
        if (o_fifo_push) begin
            push_cnt      = push_cnt + 1;
            last_push_cyc = cyc;
            if (exp_rd == exp_wr) begin
                $display("[FAIL] %0t : unexpected push %b", $time, o_fifo_wdata);
                err_cnt = err_cnt + 1;
            end
            else begin
                if (o_fifo_wdata !== exp_mem[exp_rd]) begin
                    $display("[FAIL] %0t : push {BE,PE,FE,DATA} = %b_%b_%b_%h (exp %b_%b_%b_%h)", $time,
                              o_fifo_wdata[10], o_fifo_wdata[9], o_fifo_wdata[8], o_fifo_wdata[7:0],
                              exp_mem[exp_rd][10], exp_mem[exp_rd][9], exp_mem[exp_rd][8], exp_mem[exp_rd][7:0]);
                    err_cnt = err_cnt + 1;
                end
                exp_rd = exp_rd + 1;
            end
            if (push_d) begin
                $display("[FAIL] %0t : o_fifo_push is wider than 1 clock", $time);
                err_cnt = err_cnt + 1;
            end
        end
        if (o_overrun) begin
            ovr_cnt = ovr_cnt + 1;
            if (ovr_d) begin
                $display("[FAIL] %0t : o_overrun is wider than 1 clock", $time);
                err_cnt = err_cnt + 1;
            end
        end
        if (o_fifo_push && o_overrun) begin
            $display("[FAIL] %0t : push and overrun in the same clock", $time);
            err_cnt = err_cnt + 1;
        end
        push_d = o_fifo_push;
        ovr_d  = o_overrun;
    end
end

//------------------------------------------------------------------------------
// Tasks (all time steps are on the falling edge of clk)
//------------------------------------------------------------------------------
task wait_clk(input integer n);
begin
    repeat (n) @(negedge clk);
end
endtask

task drive_bit(input v);
begin
    i_rxd = v;
    repeat (bit_clks) @(negedge clk);
end
endtask

// Send one frame and queue the expected result.
//   flip       : 1 = send the opposite of the correct parity bit
//   stop_val   : value of the stop bit (0 = framing error)
//   gap        : idle clocks after the frame (0 = next start right after stop)
//   extra_low  : line stays low this many clocks after a stop bit of 0
//   exp_push   : 1 = the DUT must push this character
task send_frame(input [7:0] d, input p_en, input p_eps, input flip, input stop_val,
                input integer gap, input integer extra_low, input exp_push);
    reg     par;
    reg     pbit;
    reg     brk;
    integer b;
    integer gapx;
begin
    par  = p_eps ? (^d) : ~(^d);
    pbit = p_en ? (par ^ flip) : 1'b0;
    brk  = (!stop_val) && (d == 8'h00) && (!p_en || !pbit);

    if (exp_push) begin
        exp_mem[exp_wr] = brk ? 11'b101_0000_0000
                              : {1'b0, (p_en && flip), !stop_val, d};
        exp_wr = exp_wr + 1;
    end

    i_pen     = p_en;
    i_eps     = p_eps;
    start_cyc = cyc;
    drive_bit(1'b0);                            // start
    for (b = 0; b < 8; b = b + 1) drive_bit(d[b]);
    if (p_en) drive_bit(pbit);                  // parity
    i_rxd = stop_val;                           // stop
    repeat (stop_len) @(negedge clk);
    if (!stop_val && extra_low > 0) repeat (extra_low) @(negedge clk);
    i_rxd = 1'b1;
    gapx  = (!stop_val && gap < 2) ? 2 : gap;   // a falling edge is needed for the next start
    repeat (gapx) @(negedge clk);
end
endtask

// All queued characters must have been pushed
task check_all_received;
begin
    wait_clk(4);
    if (exp_rd != exp_wr) begin
        $display("[FAIL] %0t : %0d expected character(s) were never pushed", $time, exp_wr - exp_rd);
        err_cnt = err_cnt + (exp_wr - exp_rd);
        exp_rd  = exp_wr;
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
    check_all_received;
    if (err_cnt == sec_err) $display("[PASS] %0s", name);
    else                    $display("[FAIL] %0s", name);
end
endtask

// Short low pulse on the line (not a real start bit)
task glitch(input integer n_clks);
begin
    i_rxd = 1'b0;
    repeat (n_clks) @(negedge clk);
    i_rxd = 1'b1;
    repeat (BIT) @(negedge clk);
end
endtask

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer pushes_before;
integer ovr_before;
integer nominal;
integer delta;
reg [7:0] r_d;
reg       r_pen, r_eps, r_flip, r_stop;
integer   r_gap, r_sel;

initial begin
    err_cnt  = 0;
    seed     = 32'h5EED_1234;
    exp_wr   = 0;  exp_rd = 0;
    push_cnt = 0;  ovr_cnt = 0;  last_push_cyc = 0;
    push_d   = 1'b0;  ovr_d = 1'b0;
    bit_clks = BIT;
    stop_len = BIT;
    nRst        = 1'b1;
    i_rxd       = 1'b1;
    i_rx_en     = 1'b1;
    i_pen       = 1'b0;
    i_eps       = 1'b0;
    i_fifo_full = 1'b0;
    #1;
    nRst = 1'b0;                                 // initial reset
    @(negedge clk);
    @(negedge clk);
    nRst = 1'b1;

    //--------------------------------------------------------------------------
    // (1) idle line
    //--------------------------------------------------------------------------
    begin_test;
    wait_clk(3 * BIT);
    if (push_cnt != 0 || ovr_cnt != 0) begin
        $display("[FAIL] activity on an idle line");
        err_cnt = err_cnt + 1;
    end
    end_test("(1) idle line, nothing is pushed");

    //--------------------------------------------------------------------------
    // (2) 8N1 frames and push timing
    //--------------------------------------------------------------------------
    begin_test;
    send_frame(8'h55, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    // the character is complete in the middle of the stop bit : 9.5 bit times
    nominal = start_cyc + 9 * BIT + BIT / 2;
    delta   = last_push_cyc - nominal;
    if (delta > TICK_DIV + 4 || delta < -(TICK_DIV + 4)) begin
        $display("[FAIL] push comes %0d clk from the middle of the stop bit", delta);
        err_cnt = err_cnt + 1;
    end
    send_frame(8'hA3, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'hFF, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'h01, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'h80, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    end_test("(2) 8N1 frames, push timing");

    //--------------------------------------------------------------------------
    // (3) parity
    //--------------------------------------------------------------------------
    begin_test;
    send_frame(8'h01, 1'b1, 1'b1, 1'b0, 1'b1, 20, 0, 1'b1);     // even, good
    send_frame(8'h03, 1'b1, 1'b1, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'hFF, 1'b1, 1'b1, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'h01, 1'b1, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // odd, good
    send_frame(8'h7F, 1'b1, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'h00, 1'b1, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    send_frame(8'hA5, 1'b1, 1'b1, 1'b1, 1'b1, 20, 0, 1'b1);     // even, wrong -> PE
    send_frame(8'h5A, 1'b1, 1'b0, 1'b1, 1'b1, 20, 0, 1'b1);     // odd,  wrong -> PE
    send_frame(8'hC3, 1'b0, 1'b1, 1'b1, 1'b1, 20, 0, 1'b1);     // parity off : flip is ignored
    end_test("(3) good / wrong parity");

    //--------------------------------------------------------------------------
    // (4) framing error
    //--------------------------------------------------------------------------
    begin_test;
    send_frame(8'h5A, 1'b0, 1'b0, 1'b0, 1'b0, 20, 0, 1'b1);     // FE only
    send_frame(8'hE7, 1'b0, 1'b0, 1'b0, 1'b0, 20, 0, 1'b1);
    send_frame(8'h5A, 1'b1, 1'b1, 1'b0, 1'b0, 20, 0, 1'b1);     // FE, parity good
    send_frame(8'h5A, 1'b1, 1'b1, 1'b1, 1'b0, 20, 0, 1'b1);     // FE + PE
    send_frame(8'h00, 1'b1, 1'b1, 1'b1, 1'b0, 20, 0, 1'b1);     // data 0 but parity cell = 1 : not a break
    send_frame(8'h3C, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // good frame after the errors
    end_test("(4) framing error");

    //--------------------------------------------------------------------------
    // (5) break
    //--------------------------------------------------------------------------
    begin_test;
    send_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b0, 20, 0, 1'b1);     // no parity
    send_frame(8'h00, 1'b1, 1'b1, 1'b0, 1'b0, 20, 0, 1'b1);     // even parity : parity cell 0
    send_frame(8'h00, 1'b1, 1'b0, 1'b1, 1'b0, 20, 0, 1'b1);     // odd parity : parity cell 0 (PE must stay 0)
    // long break : the line stays low for 3 more frame times, one push only
    pushes_before = push_cnt;
    send_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b0, 20, 30 * BIT, 1'b1);
    wait_clk(2 * BIT);
    if (push_cnt != pushes_before + 1) begin
        $display("[FAIL] long break pushed %0d characters (exp 1)", push_cnt - pushes_before);
        err_cnt = err_cnt + 1;
    end
    send_frame(8'h96, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // receiver recovers
    end_test("(5) break, long break");

    //--------------------------------------------------------------------------
    // (6) start-bit glitch
    //--------------------------------------------------------------------------
    begin_test;
    glitch(1);
    glitch(5);
    glitch(12);
    glitch(20);                                  // ends before the middle of a start cell
    send_frame(8'hB4, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    glitch(20);
    send_frame(8'h4B, 1'b1, 1'b1, 1'b0, 1'b1, 20, 0, 1'b1);     // glitch right before a frame
    end_test("(6) start-bit glitch is rejected");

    //--------------------------------------------------------------------------
    // (7) i_rx_en
    //--------------------------------------------------------------------------
    begin_test;
    @(negedge clk) i_rx_en = 1'b0;
    send_frame(8'h6E, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b0);     // ignored
    send_frame(8'hD1, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b0);     // ignored
    @(negedge clk) i_rx_en = 1'b1;
    send_frame(8'h6E, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // received again
    // dropped in the middle of a frame : the frame is still received
    fork
        send_frame(8'h2D, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
        begin
            repeat (4 * BIT) @(negedge clk);
            i_rx_en = 1'b0;
        end
    join
    // while off, the next frame is ignored
    send_frame(8'hF0, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b0);
    @(negedge clk) i_rx_en = 1'b1;
    send_frame(8'h0F, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);
    end_test("(7) i_rx_en off / dropped in the middle");

    //--------------------------------------------------------------------------
    // (8) overrun
    //--------------------------------------------------------------------------
    begin_test;
    ovr_before    = ovr_cnt;
    pushes_before = push_cnt;
    @(negedge clk) i_fifo_full = 1'b1;
    send_frame(8'h12, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b0);
    send_frame(8'h34, 1'b1, 1'b0, 1'b0, 1'b1, 20, 0, 1'b0);
    send_frame(8'h56, 1'b0, 1'b0, 1'b0, 1'b0, 20, 0, 1'b0);     // overrun with a framing error
    if (ovr_cnt != ovr_before + 3 || push_cnt != pushes_before) begin
        $display("[FAIL] overrun count %0d (exp 3), pushes %0d (exp 0)",
                  ovr_cnt - ovr_before, push_cnt - pushes_before);
        err_cnt = err_cnt + 1;
    end
    @(negedge clk) i_fifo_full = 1'b0;
    send_frame(8'h78, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // room again
    end_test("(8) overrun when the FIFO is full");

    //--------------------------------------------------------------------------
    // (9) back-to-back frames, fast stop bit
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 8; i = i + 1)
        send_frame(8'h20 + i[7:0], 1'b0, 1'b0, 1'b0, 1'b1, 0, 0, 1'b1);
    for (i = 0; i < 8; i = i + 1)
        send_frame(8'hC0 + i[7:0], 1'b1, i[0], 1'b0, 1'b1, 0, 0, 1'b1);
    send_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b1, 40, 0, 1'b1);
    // the stop bit is only 2/3 of a bit long : the receiver leaves STOP in the
    // middle of the stop bit, so the next start edge must not be missed
    stop_len = 2 * BIT / 3;
    for (i = 0; i < 6; i = i + 1)
        send_frame(8'h90 + i[7:0], 1'b0, 1'b0, 1'b0, 1'b1, 0, 0, 1'b1);
    stop_len = BIT;
    send_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b1, 40, 0, 1'b1);
    end_test("(9) back-to-back, fast stop bit");

    //--------------------------------------------------------------------------
    // (10) bit time tolerance : +-1 clock per bit (about 10 clock drift in a frame)
    //--------------------------------------------------------------------------
    begin_test;
    bit_clks = BIT - 1;  stop_len = BIT - 1;
    for (i = 0; i < 4; i = i + 1)
        send_frame(8'h69 + i[7:0], 1'b1, 1'b1, 1'b0, 1'b1, 7 * i, 0, 1'b1);
    bit_clks = BIT + 1;  stop_len = BIT + 1;
    for (i = 0; i < 4; i = i + 1)
        send_frame(8'h96 + i[7:0], 1'b1, 1'b0, 1'b0, 1'b1, 7 * i, 0, 1'b1);
    bit_clks = BIT;  stop_len = BIT;
    end_test("(10) bit time +-1 clock");

    //--------------------------------------------------------------------------
    // (11) asynchronous reset in the middle of a frame
    //--------------------------------------------------------------------------
    begin_test;
    i_pen = 1'b0;
    drive_bit(1'b0);                             // start
    drive_bit(1'b1);
    drive_bit(1'b0);
    drive_bit(1'b1);
    nRst  = 1'b0;                                // reset in the middle, the line goes idle
    i_rxd = 1'b1;
    #2;
    wait_clk(3);
    nRst  = 1'b1;
    wait_clk(3 * BIT);
    send_frame(8'hE5, 1'b0, 1'b0, 1'b0, 1'b1, 20, 0, 1'b1);     // clean start after the reset
    end_test("(11) asynchronous reset in a frame");

    //--------------------------------------------------------------------------
    // (12) random frames
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 200; i = i + 1) begin
        r_d    = $random(seed);
        r_pen  = $random(seed);
        r_eps  = $random(seed);
        r_flip = ({$random(seed)} % 100) < 15;
        r_stop = ({$random(seed)} % 100) >= 12;
        r_gap  = {$random(seed)} % 70;
        r_sel  = {$random(seed)} % 20;
        if (r_sel == 0) r_d = 8'h00;             // some break candidates
        send_frame(r_d, r_pen, r_eps, r_flip, r_stop, r_gap, 0, 1'b1);
    end
    end_test("(12) random frames");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_rx_logic : ALL PASS ===");
    else              $display("=== tb_rx_logic : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_rx_logic.vcd");
    $dumpvars(0, tb_rx_logic);
end

initial begin
    #200000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule
