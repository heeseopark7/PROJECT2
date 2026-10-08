//==============================================================================
// Testbench : tb_interrupt_logic
// DUT       : interrupt_logic
// Method    : Self-checking, two layers:
//             - directed tests with literal expected values (RIS bits, mask,
//               the 5 interrupt pins, the exact 512th tick of the RT timer ...)
//             - a reference model that follows the rules written in
//               interrupt_logic.v. It runs during ALL tests and its RIS / MIS /
//               pins are compared with the DUT 1 ns before every rising clock
//               edge, so the random test and every directed test are checked
//               clock by clock.
//
//             Vector order (RIS, MIS, IMSC, ICR) : [6]=OE [5]=BE [4]=PE [3]=FE
//                                                   [2]=RT [1]=TX [0]=RX
//             i_rx_err = {BE, PE, FE}
//
// Tests     : (1)  reset values
//             (2)  RX level (count >= half), TX level (count <= half)
//             (3)  mask : MIS = RIS & IMSC, all 128 mask values
//             (4)  error latches FE / PE / BE / OE : set, hold, ICR clear,
//                  no set without a push, ICR[1:0] has no effect, set wins
//                  over a clear in the same clock
//             (5)  RT timer : exactly the 512th tick, slow ticks, stops (no
//                  second set), push restarts, FIFO empty clears, ICR clears
//             (6)  all 7 sources set : mask sweep and each interrupt pin
//             (7)  asynchronous reset
//             (8)  random inputs, 50000 clocks, compared with the model
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_interrupt_logic;

//------------------------------------------------------------------------------
// Parameters (same defaults as interrupt_logic)
//------------------------------------------------------------------------------
parameter   FIFO_DEPTH  = 16                        ;
localparam  CNT_W       = $clog2(FIFO_DEPTH)+1      ;
localparam  HALF        = FIFO_DEPTH / 2            ;
localparam  RT_CNT      = 512                       ;   // RT limit in ticks (fixed by the spec)

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg                     clk                         ;
reg                     nRst                        ;
reg     [CNT_W-1:0]     i_tx_count                  ;
reg     [CNT_W-1:0]     i_rx_count                  ;
reg                     i_rx_empty                  ;
reg                     i_rx_push                   ;
reg     [2:0]           i_rx_err                    ;
reg                     i_overrun                   ;
reg                     i_tick_16x                  ;
reg     [6:0]           i_imsc                      ;
reg     [6:0]           i_icr                       ;
wire    [6:0]           o_ris                       ;
wire    [6:0]           o_mis                       ;
wire                    o_rxintr                    ;
wire                    o_txintr                    ;
wire                    o_rtintr                    ;
wire                    o_eintr                     ;
wire                    o_intr                      ;

//------------------------------------------------------------------------------
// Testbench state
//------------------------------------------------------------------------------
integer                 err_cnt                     ;
integer                 sec_err                     ;
integer                 seed                        ;
integer                 i, k                        ;
reg                     model_en                    ;   // enable the clock-by-clock model compare
reg                     cov_en                      ;   // count coverage (random test only)
integer                 cov_rt_set                  ;   // RT set events
integer                 cov_rt_clr_icr              ;   // RT cleared by ICR[2]
integer                 cov_rt_clr_empty            ;   // RT cleared by an empty FIFO
integer                 cov_rt_push_blk             ;   // 512th tick blocked by a push
integer                 cov_err_set                 ;   // FE/PE/BE/OE set events
integer                 cov_err_both                ;   // set and ICR clear in the same clock
integer                 cov_err_clr                 ;   // latch cleared by ICR

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
interrupt_logic #(
                .FIFO_DEPTH (FIFO_DEPTH )
)           uut (
                .clk            (clk            )   ,
                .nRst           (nRst           )   ,
                .i_tx_count     (i_tx_count     )   ,
                .i_rx_count     (i_rx_count     )   ,
                .i_rx_empty     (i_rx_empty     )   ,
                .i_rx_push      (i_rx_push      )   ,
                .i_rx_err       (i_rx_err       )   ,
                .i_overrun      (i_overrun      )   ,
                .i_tick_16x     (i_tick_16x     )   ,
                .i_imsc         (i_imsc         )   ,
                .i_icr          (i_icr          )   ,
                .o_ris          (o_ris          )   ,
                .o_mis          (o_mis          )   ,
                .o_rxintr       (o_rxintr       )   ,
                .o_txintr       (o_txintr       )   ,
                .o_rtintr       (o_rtintr       )   ,
                .o_eintr        (o_eintr        )   ,
                .o_intr         (o_intr         )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

//------------------------------------------------------------------------------
// Reference model (rules taken from the comments of interrupt_logic.v)
//------------------------------------------------------------------------------
reg                     m_fe, m_pe, m_be, m_oe, m_rt    ;
integer                 m_cnt                           ;   // RT timer
reg                     m_rt_set                        ;
wire    [6:0]           m_ris   = {m_oe, m_be, m_pe, m_fe, m_rt,
                                   (i_tx_count <= HALF), (i_rx_count >= HALF)};
wire    [6:0]           m_mis   = m_ris & i_imsc        ;

always @(posedge clk or negedge nRst) begin
    if (!nRst) begin
        m_fe = 1'b0;  m_pe = 1'b0;  m_be = 1'b0;  m_oe = 1'b0;  m_rt = 1'b0;
        m_cnt = 0;
    end
    else begin
        // RT set event : the timer moves from 511 to 512 in this clock
        m_rt_set = i_tick_16x && (m_cnt == RT_CNT - 1) && !i_rx_empty && !i_rx_push;
        if (cov_en) begin
            if (m_rt_set)                                           cov_rt_set       = cov_rt_set + 1;
            if (!m_rt_set && m_rt && i_icr[2])                      cov_rt_clr_icr   = cov_rt_clr_icr + 1;
            if (!m_rt_set && m_rt && i_rx_empty && !i_icr[2])       cov_rt_clr_empty = cov_rt_clr_empty + 1;
            if (i_tick_16x && m_cnt == RT_CNT - 1 && !i_rx_empty && i_rx_push)
                                                                    cov_rt_push_blk  = cov_rt_push_blk + 1;
            if ((i_rx_push && i_rx_err[0] && !m_fe) || (i_rx_push && i_rx_err[1] && !m_pe) ||
                (i_rx_push && i_rx_err[2] && !m_be) || (i_overrun && !m_oe))
                                                                    cov_err_set      = cov_err_set + 1;
            if ((i_rx_push && i_rx_err[0] && i_icr[3]) || (i_rx_push && i_rx_err[1] && i_icr[4]) ||
                (i_rx_push && i_rx_err[2] && i_icr[5]) || (i_overrun && i_icr[6]))
                                                                    cov_err_both     = cov_err_both + 1;
            if ((m_fe && i_icr[3] && !(i_rx_push && i_rx_err[0])) || (m_pe && i_icr[4] && !(i_rx_push && i_rx_err[1])) ||
                (m_be && i_icr[5] && !(i_rx_push && i_rx_err[2])) || (m_oe && i_icr[6] && !i_overrun))
                                                                    cov_err_clr      = cov_err_clr + 1;
        end
        // latches : set event beats ICR clear
        if (i_rx_push && i_rx_err[0]) m_fe = 1'b1;  else if (i_icr[3]) m_fe = 1'b0;
        if (i_rx_push && i_rx_err[1]) m_pe = 1'b1;  else if (i_icr[4]) m_pe = 1'b0;
        if (i_rx_push && i_rx_err[2]) m_be = 1'b1;  else if (i_icr[5]) m_be = 1'b0;
        if (i_overrun)                m_oe = 1'b1;  else if (i_icr[6]) m_oe = 1'b0;
        if (m_rt_set)                          m_rt = 1'b1;
        else if (i_icr[2] || i_rx_empty)       m_rt = 1'b0;
        // timer : push restarts, empty holds 0, tick counts up to 512 and stops
        if (i_rx_push)                         m_cnt = 0;
        else if (i_rx_empty)                   m_cnt = 0;
        else if (i_tick_16x && m_cnt != RT_CNT) m_cnt = m_cnt + 1;
    end
end

// compare 1 ns before every rising edge (inputs were changed on the falling edge)
always @(negedge clk) begin
    #4;
    if (model_en) begin
        if (o_ris !== m_ris || o_mis !== m_mis ||
            o_rxintr !== m_mis[0] || o_txintr !== m_mis[1] || o_rtintr !== m_mis[2] ||
            o_eintr !== (|m_mis[6:3]) || o_intr !== (|m_mis)) begin
            $display("[FAIL] %0t : model compare ris=%b/%b mis=%b/%b pins=%b%b%b%b%b",
                      $time, o_ris, m_ris, o_mis, m_mis, o_rxintr, o_txintr, o_rtintr, o_eintr, o_intr);
            err_cnt = err_cnt + 1;
        end
    end
end

//------------------------------------------------------------------------------
// Tasks (all input changes on the falling edge)
//------------------------------------------------------------------------------
// Literal check of RIS, MIS and the 5 pins (the mask is the current i_imsc)
task expect_all(input [6:0] e_ris);
    reg [6:0] m;
begin
    m = e_ris & i_imsc;
    if (o_ris !== e_ris || o_mis !== m ||
        o_rxintr !== m[0] || o_txintr !== m[1] || o_rtintr !== m[2] ||
        o_eintr !== (|m[6:3]) || o_intr !== (|m)) begin
        $display("[FAIL] %0t : ris=%b (exp %b) mis=%b (exp %b) pins rx/tx/rt/e/all=%b%b%b%b%b",
                  $time, o_ris, e_ris, o_mis, m, o_rxintr, o_txintr, o_rtintr, o_eintr, o_intr);
        err_cnt = err_cnt + 1;
    end
end
endtask

task expect_pins(input e_rx, input e_tx, input e_rt, input e_e, input e_all);
begin
    if (o_rxintr !== e_rx || o_txintr !== e_tx || o_rtintr !== e_rt ||
        o_eintr !== e_e || o_intr !== e_all) begin
        $display("[FAIL] %0t : pins rx/tx/rt/e/all = %b%b%b%b%b (exp %b%b%b%b%b) imsc=%b",
                  $time, o_rxintr, o_txintr, o_rtintr, o_eintr, o_intr,
                  e_rx, e_tx, e_rt, e_e, e_all, i_imsc);
        err_cnt = err_cnt + 1;
    end
end
endtask

task expect_bit(input integer idx, input e);
begin
    if (o_ris[idx] !== e) begin
        $display("[FAIL] %0t : ris[%0d] = %b (exp %b)", $time, idx, o_ris[idx], e);
        err_cnt = err_cnt + 1;
    end
end
endtask

task step;
begin
    @(negedge clk);
end
endtask

// 1-clock pulses
task pulse_push(input [2:0] err);
begin
    i_rx_push = 1'b1;  i_rx_err = err;
    @(negedge clk);
    i_rx_push = 1'b0;  i_rx_err = 3'b000;
end
endtask

task pulse_ovr;
begin
    i_overrun = 1'b1;
    @(negedge clk);
    i_overrun = 1'b0;
end
endtask

task pulse_icr(input [6:0] bits);
begin
    i_icr = bits;
    @(negedge clk);
    i_icr = 7'b0;
end
endtask

// FIFO empty for 2 clocks : RT latch and timer are cleared, then non-empty
task rt_restart;
begin
    i_tick_16x = 1'b0;
    i_rx_empty = 1'b1;
    step;  step;
    expect_bit(2, 1'b0);
    i_rx_empty = 1'b0;
end
endtask

// n clocks with a tick on every clock; RT must stay 0 the whole time
task ticks_no_rt(input integer n);
    integer c;
begin
    i_tick_16x = 1'b1;
    for (c = 0; c < n; c = c + 1) begin
        step;
        if (o_ris[2] !== 1'b0) begin
            $display("[FAIL] %0t : RT set early after %0d ticks", $time, c + 1);
            err_cnt = err_cnt + 1;
            c = n;
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

task apply_reset;
begin
    @(negedge clk);
    i_rx_push = 1'b0;  i_overrun = 1'b0;  i_icr = 7'd0;  i_tick_16x = 1'b0;
    nRst = 1'b0;
    repeat (2) @(negedge clk);
    nRst = 1'b1;
end
endtask

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer p_push, p_tick, p_icr, p_err, p_goempty, p_unempty, phase;
reg [CNT_W-1:0] r_rx, r_tx;

initial begin
    err_cnt = 0;
    seed    = 32'h1A2B_3C4D;
    model_en = 1'b0;
    cov_en = 1'b0;
    cov_rt_set = 0;  cov_rt_clr_icr = 0;  cov_rt_clr_empty = 0;  cov_rt_push_blk = 0;
    cov_err_set = 0;  cov_err_both = 0;  cov_err_clr = 0;
    nRst = 1'b1;
    i_tx_count = 0;  i_rx_count = 0;  i_rx_empty = 1'b1;  i_rx_push = 1'b0;
    i_rx_err = 3'b000;  i_overrun = 1'b0;  i_tick_16x = 1'b0;  i_imsc = 7'd0;  i_icr = 7'd0;
    #1;
    nRst = 1'b0;
    repeat (2) @(negedge clk);
    nRst = 1'b1;
    model_en = 1'b1;
    step;

    //--------------------------------------------------------------------------
    // (1) reset values : nothing latched, TX level is 1 (count 0 <= half)
    //--------------------------------------------------------------------------
    begin_test;
    expect_all(7'b0000010);
    i_imsc = 7'h7F;                                      // mask open : only TX shows
    step;
    expect_all(7'b0000010);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b0, 1'b1);
    i_imsc = 7'h00;
    step;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    end_test("(1) reset values");

    //--------------------------------------------------------------------------
    // (2) FIFO level interrupts
    //--------------------------------------------------------------------------
    begin_test;
    i_tx_count = 0;
    for (i = 0; i <= FIFO_DEPTH; i = i + 1) begin       // RX : count >= half
        i_rx_count = i;
        step;
        expect_all({5'b00000, 1'b1, (i >= HALF)});
    end
    i_rx_count = 0;
    for (i = 0; i <= FIFO_DEPTH; i = i + 1) begin       // TX : count <= half
        i_tx_count = i;
        step;
        expect_all({5'b00000, (i <= HALF), 1'b0});
    end
    i_tx_count = 0;
    end_test("(2) RX / TX level interrupts");

    //--------------------------------------------------------------------------
    // (3) mask : MIS = RIS & IMSC, pins follow MIS
    //--------------------------------------------------------------------------
    begin_test;
    i_rx_count = HALF;  i_tx_count = 0;                  // RIS = RX and TX
    for (i = 0; i < 128; i = i + 1) begin
        i_imsc = i[6:0];
        step;
        expect_all(7'b0000011);
    end
    i_imsc = 7'h00;  i_rx_count = 0;
    step;
    end_test("(3) mask sweep, MIS = RIS & IMSC");

    //--------------------------------------------------------------------------
    // (4) error latches
    //--------------------------------------------------------------------------
    begin_test;
    i_rx_empty = 1'b0;                                   // characters are in the FIFO
    step;
    expect_all(7'b0000010);
    // FE : set by a push, held, visible through the mask, cleared by ICR[3]
    pulse_push(3'b001);
    expect_all(7'b0001010);
    repeat (40) step;
    expect_all(7'b0001010);
    i_imsc = 7'b0001000;  step;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);
    pulse_icr(7'b0001000);
    expect_all(7'b0000010);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    // PE : push err[1], ICR[4]
    pulse_push(3'b010);
    expect_all(7'b0010010);
    pulse_icr(7'b0010000);
    expect_all(7'b0000010);
    // BE : push err[2], ICR[5]
    pulse_push(3'b100);
    expect_all(7'b0100010);
    pulse_icr(7'b0100000);
    expect_all(7'b0000010);
    // OE : overrun pulse, ICR[6]; a push with error flags is not needed
    pulse_ovr;
    expect_all(7'b1000010);
    pulse_icr(7'b1000000);
    expect_all(7'b0000010);
    // error flags without a push are ignored
    i_rx_err = 3'b111;
    repeat (5) step;
    i_rx_err = 3'b000;
    expect_all(7'b0000010);
    // one character with all three flags, then an overrun
    pulse_push(3'b111);
    expect_all(7'b0111010);
    pulse_ovr;
    expect_all(7'b1111010);
    // ICR clears only its own bit
    pulse_icr(7'b0010000);  expect_all(7'b1101010);      // PE
    pulse_icr(7'b1000000);  expect_all(7'b0101010);      // OE
    pulse_icr(7'b0001000);  expect_all(7'b0100010);      // FE
    // ICR[1:0] (RX / TX) has no effect, ICR[2] (RT) does not clear errors
    pulse_icr(7'b0000011);  expect_all(7'b0100010);
    pulse_icr(7'b0000100);  expect_all(7'b0100010);
    pulse_icr(7'b0100000);  expect_all(7'b0000010);      // BE
    // ICR on a bit that is not set does nothing
    pulse_icr(7'b1111100);
    expect_all(7'b0000010);
    // set wins over clear in the same clock
    pulse_push(3'b001);                                  // FE is set
    i_rx_push = 1'b1;  i_rx_err = 3'b001;  i_icr = 7'b0001000;
    step;
    i_rx_push = 1'b0;  i_rx_err = 3'b000;  i_icr = 7'b0000000;
    expect_all(7'b0001010);                              // FE stays
    pulse_icr(7'b0001000);                               // FE cleared
    expect_all(7'b0000010);
    i_rx_push = 1'b1;  i_rx_err = 3'b001;  i_icr = 7'b0001000;   // FE not set yet
    step;
    i_rx_push = 1'b0;  i_rx_err = 3'b000;  i_icr = 7'b0000000;
    expect_all(7'b0001010);                              // set wins
    i_overrun = 1'b1;  i_icr = 7'b1000000;
    step;
    i_overrun = 1'b0;  i_icr = 7'b0000000;
    expect_all(7'b1001010);                              // OE : set wins as well
    pulse_icr(7'b1111100);
    expect_all(7'b0000010);
    i_imsc = 7'h00;
    end_test("(4) error latches FE / PE / BE / OE");

    //--------------------------------------------------------------------------
    // (5) RT timer
    //--------------------------------------------------------------------------
    begin_test;
    // (5a) set exactly by the 512th tick
    rt_restart;
    ticks_no_rt(RT_CNT - 1);                             // 511 ticks : still 0
    step;                                                // 512th tick
    expect_bit(2, 1'b1);
    // (5b) the timer stops : RT stays 1, no wrap-around
    repeat (RT_CNT + 100) step;
    expect_bit(2, 1'b1);
    // ICR[2] clears it, and it is not set again without a new character
    pulse_icr(7'b0000100);
    expect_bit(2, 1'b0);
    repeat (2 * RT_CNT) begin
        step;
        if (o_ris[2] !== 1'b0) begin
            $display("[FAIL] %0t : RT set again after ICR without a new character", $time);
            err_cnt = err_cnt + 1;
        end
    end
    i_tick_16x = 1'b0;
    // (5c) ticks that are not every clock : only ticks count
    rt_restart;
    for (k = 0; k < RT_CNT - 1; k = k + 1) begin
        i_tick_16x = 1'b1;  step;
        i_tick_16x = 1'b0;  step;  step;
        if (o_ris[2] !== 1'b0) begin
            $display("[FAIL] %0t : RT set early after %0d slow ticks", $time, k + 1);
            err_cnt = err_cnt + 1;
            k = RT_CNT;
        end
    end
    i_tick_16x = 1'b1;  step;                            // 512th tick
    i_tick_16x = 1'b0;
    expect_bit(2, 1'b1);
    // (5d) FIFO empty clears the latch and restarts the timer
    i_rx_empty = 1'b1;
    step;
    expect_bit(2, 1'b0);
    i_rx_empty = 1'b0;
    ticks_no_rt(RT_CNT - 1);
    step;
    expect_bit(2, 1'b1);
    i_tick_16x = 1'b0;
    // (5e) a new character restarts the timer (tick in the same clock as the push)
    rt_restart;
    ticks_no_rt(300);
    i_rx_push = 1'b1;  step;                             // push + tick : timer back to 0
    i_rx_push = 1'b0;
    ticks_no_rt(RT_CNT - 1);
    step;
    expect_bit(2, 1'b1);
    i_tick_16x = 1'b0;
    // (5f) a push in the clock of the 512th tick : no set, timer restarts
    rt_restart;
    ticks_no_rt(RT_CNT - 1);
    i_rx_push = 1'b1;  step;
    i_rx_push = 1'b0;
    expect_bit(2, 1'b0);
    ticks_no_rt(RT_CNT - 1);
    step;
    expect_bit(2, 1'b1);
    i_tick_16x = 1'b0;
    // (5g) set wins over an ICR clear in the clock of the 512th tick
    rt_restart;
    ticks_no_rt(RT_CNT - 1);
    i_icr = 7'b0000100;  step;
    i_icr = 7'b0000000;
    expect_bit(2, 1'b1);
    i_tick_16x = 1'b0;
    // (5h) the FIFO becomes empty in the clock of the 512th tick : no set
    rt_restart;
    ticks_no_rt(RT_CNT - 1);
    i_rx_empty = 1'b1;  step;
    expect_bit(2, 1'b0);
    step;
    expect_bit(2, 1'b0);
    i_tick_16x = 1'b0;
    i_rx_empty = 1'b0;
    // (5i) nothing is counted while the FIFO is empty
    i_rx_empty = 1'b1;
    pulse_icr(7'b0000100);
    i_tick_16x = 1'b1;
    for (k = 0; k < RT_CNT + 200; k = k + 1) begin
        step;
        if (o_ris[2] !== 1'b0) begin
            $display("[FAIL] %0t : RT set while the FIFO is empty", $time);
            err_cnt = err_cnt + 1;
            k = RT_CNT + 200;
        end
    end
    i_tick_16x = 1'b0;
    // (5j) RT is in RIS even when masked; the pin follows the mask
    rt_restart;
    i_imsc = 7'h00;
    ticks_no_rt(RT_CNT - 1);
    step;
    i_tick_16x = 1'b0;
    expect_all(7'b0000110);                              // RT and TX in RIS, nothing in MIS
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    i_imsc = 7'b0000100;
    step;
    expect_pins(1'b0, 1'b0, 1'b1, 1'b0, 1'b1);
    i_imsc = 7'h00;
    i_rx_empty = 1'b1;
    step;  step;
    end_test("(5) RT timer, 512th tick, restart, clear");

    //--------------------------------------------------------------------------
    // (6) all 7 sources set : mask sweep and each pin
    //--------------------------------------------------------------------------
    begin_test;
    i_rx_count = FIFO_DEPTH;  i_tx_count = 0;            // RX and TX level
    rt_restart;
    ticks_no_rt(RT_CNT - 1);
    step;
    i_tick_16x = 1'b0;
    pulse_push(3'b111);
    pulse_ovr;
    expect_all(7'b1111111);
    for (i = 0; i < 128; i = i + 1) begin
        i_imsc = i[6:0];
        step;
        expect_all(7'b1111111);
    end
    for (i = 0; i < 7; i = i + 1) begin                  // one mask bit at a time
        i_imsc = 7'b1 << i;
        step;
        expect_pins((i == 0), (i == 1), (i == 2), (i >= 3), 1'b1);
    end
    i_imsc = 7'h00;
    step;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    end_test("(6) all sources set, mask and pins");

    //--------------------------------------------------------------------------
    // (7) asynchronous reset
    //--------------------------------------------------------------------------
    begin_test;
    i_rx_count = 0;  i_tx_count = 0;  i_imsc = 7'h7F;
    step;
    expect_all(7'b1111110);                              // latches are still set, RX level is gone
    #1 nRst = 1'b0;                                      // no clock edge needed
    #2;
    expect_all(7'b0000010);
    @(negedge clk);
    nRst = 1'b1;
    step;
    expect_all(7'b0000010);
    i_imsc = 7'h00;
    i_rx_empty = 1'b1;
    step;
    end_test("(7) asynchronous reset");

    //--------------------------------------------------------------------------
    // (8) random inputs, compared with the model on every clock
    //--------------------------------------------------------------------------
    begin_test;
    i_imsc = 7'h7F;
    cov_en = 1'b1;
    i_rx_empty = 1'b0;
    for (phase = 0; phase < 50; phase = phase + 1) begin
        // each phase has its own probabilities
        //   p_push, p_tick, p_icr, p_err : percent per clock
        //   p_goempty, p_unempty         : per mille per clock (FIFO becomes empty / non-empty)
        case (phase % 5)
            0: begin p_push = 30; p_tick = 50;  p_icr = 10; p_err = 30; p_goempty = 50; p_unempty = 300; end
            1: begin p_push = 1;  p_tick = 95;  p_icr = 1;  p_err = 30; p_goempty = 0;  p_unempty = 300; end   // RT likely
            2: begin p_push = 0;  p_tick = 100; p_icr = 1;  p_err = 30; p_goempty = 1;  p_unempty = 300; end   // RT certain
            3: begin p_push = 60; p_tick = 30;  p_icr = 30; p_err = 60; p_goempty = 20; p_unempty = 300; end
            default: begin p_push = 5; p_tick = 70; p_icr = 3; p_err = 20; p_goempty = 5; p_unempty = 100; end
        endcase
        for (k = 0; k < 1000; k = k + 1) begin
            @(negedge clk);
            i_rx_push  = ({$random(seed)} % 100) < p_push;
            i_rx_err   = (({$random(seed)} % 100) < p_err) ? $random(seed) : 3'b000;
            i_overrun  = ({$random(seed)} % 100) < 3;
            i_tick_16x = ({$random(seed)} % 100) < p_tick;
            i_icr      = (({$random(seed)} % 100) < p_icr) ? $random(seed) : 7'b0;
            i_icr[1:0] = 2'b00;                          // ICR[1:0] are always 0 in the design
            // FIFO empty flag : stays in a state for a while
            if (i_rx_empty) begin
                if (({$random(seed)} % 1000) < p_unempty) i_rx_empty = 1'b0;
            end
            else if (({$random(seed)} % 1000) < p_goempty) i_rx_empty = 1'b1;
            // once RT is set, the FIFO is sometimes emptied (clears RT)
            if (m_rt && ({$random(seed)} % 100) < 2) i_rx_empty = 1'b1;
            // corner hunter : at the 512th tick, sometimes push in the same clock
            if (m_cnt == RT_CNT - 1 && !i_rx_empty) begin
                i_tick_16x = 1'b1;
                i_rx_push  = ({$random(seed)} % 100) < 30;
                if (!i_rx_push && ({$random(seed)} % 100) < 30) i_rx_empty = 1'b1;   // empties in the same clock
            end
            if (({$random(seed)} % 100) < 10) begin      // counts change less often
                r_rx = {$random(seed)} % (FIFO_DEPTH + 1);
                r_tx = {$random(seed)} % (FIFO_DEPTH + 1);
                i_rx_count = r_rx;
                i_tx_count = r_tx;
            end
            if (({$random(seed)} % 1000) < 5) i_imsc = $random(seed);
        end
    end
    @(negedge clk);
    i_rx_push = 1'b0;  i_overrun = 1'b0;  i_icr = 7'd0;  i_tick_16x = 1'b0;
    @(negedge clk);
    cov_en = 1'b0;
    // coverage : did the random test really reach the interesting cases
    $display("[INFO] coverage : RT set=%0d RT clr(ICR)=%0d RT clr(empty)=%0d 512th-tick push=%0d err set=%0d set&clear=%0d err clr=%0d",
              cov_rt_set, cov_rt_clr_icr, cov_rt_clr_empty, cov_rt_push_blk, cov_err_set, cov_err_both, cov_err_clr);
    if (cov_rt_set == 0 || cov_rt_clr_icr == 0 || cov_rt_clr_empty == 0 || cov_rt_push_blk == 0 ||
        cov_err_set == 0 || cov_err_both == 0 || cov_err_clr == 0) begin
        $display("[FAIL] a case was never exercised by the random test");
        err_cnt = err_cnt + 1;
    end
    end_test("(8) random inputs vs reference model");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_interrupt_logic : ALL PASS ===");
    else              $display("=== tb_interrupt_logic : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_interrupt_logic.vcd");
    $dumpvars(0, tb_interrupt_logic);
end

initial begin
    #100000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule
