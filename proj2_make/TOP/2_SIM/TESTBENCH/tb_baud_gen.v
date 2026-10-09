//==============================================================================
// Testbench : tb_baud_gen
// DUT       : baud_gen
// Checks    : (0) reset            -> tick is 0 while nRst is low
//             (1) IBRD = 0         -> no tick
//             (2) IBRD = N         -> N ticks per (N * M) clocks
//             (3) IBRD = N         -> tick spacing is N clocks, 1 clock wide
//             (4) reset in middle  -> counter restarts from 0
//             (5) IBRD change      -> new period is used, counter does not hang
//             (6) IBRD -> 0        -> tick stops
// Result    : prints PASS / FAIL per item and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_baud_gen;

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg             clk         ;
reg             nRst        ;
reg     [15:0]  i_ibrd      ;
wire            o_tick_16x  ;

integer         err_cnt     ;   // number of failed checks
integer         r_cyc       ;   // free-running clock counter (to measure spacing)

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
baud_gen    uut (
                .clk        (clk        )   ,
                .nRst       (nRst       )   ,
                .i_ibrd     (i_ibrd     )   ,
                .o_tick_16x (o_tick_16x )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

initial r_cyc = 0;
always @(posedge clk) r_cyc <= r_cyc + 1;

//------------------------------------------------------------------------------
// Tasks
//------------------------------------------------------------------------------
// Hold reset for 3 clocks, release just after a clock edge
task do_reset;
begin
    nRst = 1'b0;
    repeat (3) @(posedge clk);
    #1 nRst = 1'b1;
end
endtask

// Wait n clock edges. The sample point is 1 ns after the edge, so the DUT
// outputs are stable and there is no race with the clock.
task wait_clk(input integer n);
begin
    repeat (n) @(posedge clk);
    #1;
end
endtask

// Count the ticks in a window of clocks and compare with the expected number
task check_tick_count(input [15:0] ibrd, input integer window, input integer expected);
    integer k;
    integer ticks;
begin
    i_ibrd = ibrd;
    do_reset;
    ticks = 0;
    for (k = 0; k < window; k = k + 1) begin
        wait_clk(1);
        if (o_tick_16x === 1'b1) ticks = ticks + 1;
    end
    if (ticks !== expected) begin
        $display("[FAIL] IBRD=%0d : %0d ticks in %0d clk (exp %0d)",
                  ibrd, ticks, window, expected);
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] IBRD=%0d : %0d ticks in %0d clk", ibrd, ticks, window);
end
endtask

// Check n_ticks consecutive ticks:
//   - spacing between two ticks is exactly IBRD clocks
//   - the tick is high for 1 clock only (IBRD = 1 : high on every clock)
task check_period(input [15:0] ibrd, input integer n_ticks);
    integer k;
    integer last;
    integer errs_before;
begin
    errs_before = err_cnt;
    i_ibrd = ibrd;
    do_reset;
    last = -1;
    k    = 0;
    while (k < n_ticks) begin
        wait_clk(1);
        if (o_tick_16x === 1'b1) begin
            if (last >= 0 && (r_cyc - last) != ibrd) begin
                $display("[FAIL] IBRD=%0d : tick spacing %0d clk (exp %0d)",
                          ibrd, r_cyc - last, ibrd);
                err_cnt = err_cnt + 1;
            end
            last = r_cyc;
            k    = k + 1;
            if (ibrd != 16'd1) begin
                wait_clk(1);
                if (o_tick_16x !== 1'b0) begin
                    $display("[FAIL] IBRD=%0d : tick wider than 1 clock", ibrd);
                    err_cnt = err_cnt + 1;
                end
            end
        end
        else if (last >= 0 && (r_cyc - last) > ibrd) begin
            $display("[FAIL] IBRD=%0d : tick missing", ibrd);
            err_cnt = err_cnt + 1;
            k = n_ticks;
        end
    end
    if (err_cnt == errs_before)
        $display("[PASS] IBRD=%0d : %0d ticks, spacing and width ok", ibrd, n_ticks);
end
endtask

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer k;
integer t;

initial begin
    err_cnt = 0;
    nRst    = 1'b0;
    i_ibrd  = 16'd0;
    #1;

    // (0) tick must be 0 while reset is asserted
    wait_clk(3);
    if (o_tick_16x !== 1'b0) begin
        $display("[FAIL] tick must be 0 during reset");
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] tick is 0 during reset");

    // (1) IBRD = 0 : divider disabled
    nRst = 1'b1;
    wait_clk(50);
    if (o_tick_16x !== 1'b0) begin
        $display("[FAIL] IBRD=0 : tick must stay 0");
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] IBRD=0 : no tick");

    // (2) number of ticks in a fixed window
    check_tick_count(16'd1,  100, 100);     // every clock
    check_tick_count(16'd2,  100,  50);
    check_tick_count(16'd10, 100,  10);
    check_tick_count(16'd27, 270,  10);     // odd value

    // (3) tick spacing and pulse width
    check_period(16'd2,   5);
    check_period(16'd5,   5);
    check_period(16'd16,  5);
    check_period(16'd163, 3);               // 50 MHz / (16 * 19200) style value

    // (4) reset in the middle of a count : restart from 0
    i_ibrd = 16'd20;
    do_reset;
    wait_clk(10);                           // counter is in the middle
    nRst = 1'b0;
    wait_clk(2);
    if (o_tick_16x !== 1'b0) begin
        $display("[FAIL] tick must be 0 while reset is asserted");
        err_cnt = err_cnt + 1;
    end
    #1 nRst = 1'b1;
    // first tick comes (IBRD-1) clocks after release (count 0 -> IBRD-1)
    for (k = 1; k < 19; k = k + 1) begin
        wait_clk(1);
        if (o_tick_16x === 1'b1) begin
            $display("[FAIL] early tick after reset (clk %0d)", k);
            err_cnt = err_cnt + 1;
        end
    end
    wait_clk(1);
    if (o_tick_16x !== 1'b1) begin
        $display("[FAIL] tick missing 19 clk after reset");
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] reset restarts the counter");

    // (5) IBRD changed on the fly (large -> small) : counter must not hang
    i_ibrd = 16'd50;
    do_reset;
    wait_clk(30);                           // counter is above the new IBRD-1
    i_ibrd = 16'd5;
    wait_clk(7);                            // a tick shows up within IBRD clocks
    t = 0;
    for (k = 0; k < 20; k = k + 1) begin
        wait_clk(1);
        if (o_tick_16x === 1'b1) t = t + 1;
    end
    if (t !== 4) begin
        $display("[FAIL] IBRD 50->5 : %0d ticks in 20 clk (exp 4)", t);
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] IBRD changed on the fly");

    // (6) IBRD -> 0 while running : tick stops
    i_ibrd = 16'd0;
    wait_clk(2);
    t = 0;
    for (k = 0; k < 30; k = k + 1) begin
        wait_clk(1);
        if (o_tick_16x !== 1'b0) t = t + 1;
    end
    if (t != 0) begin
        $display("[FAIL] IBRD=0 : %0d ticks after IBRD set to 0", t);
        err_cnt = err_cnt + 1;
    end
    else
        $display("[PASS] IBRD set to 0 : tick stops");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_baud_gen : ALL PASS ===");
    else              $display("=== tb_baud_gen : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_baud_gen.vcd");
    $dumpvars(0, tb_baud_gen);
end

initial begin
    #200000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule