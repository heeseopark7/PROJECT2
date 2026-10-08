//==============================================================================
// Testbench : tb_rx_fifo
// DUT       : rx_fifo (11-bit entry: {BE, PE, FE, DATA[7:0]})
// Method    : Self-checking. A small reference model (m_mem / m_wr / m_rd /
//             m_cnt) follows the rules written in rx_fifo.v. After every clock
//             the DUT outputs (o_count, o_empty, o_full, and o_rdata while not
//             empty) are compared with the model. Directed tests also check
//             literal expected values, so a wrong model cannot hide a bug.
//
// Note      : rx_fifo only wraps tx_fifo with DATA_WIDTH = 11, so the same test
//             plan is used. Data values use the flag bits [10:8] as well.
// Tests     : (1) reset values
//             (2) fill to full, count / full flag, data order
//             (3) push when full is ignored
//             (4) full + push&pop in the same clock -> only pop is done
//             (5) drain, oldest-first order, empty flag
//             (6) pop when empty is ignored
//             (7) empty + push&pop in the same clock -> only push is done
//             (8) pointer wrap-around (push/pop alternate, and streaming)
//             (9) asynchronous reset in the middle of operation
//             (10) random push/pop (push-heavy, pop-heavy, mixed, both-heavy)
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_rx_fifo;

//------------------------------------------------------------------------------
// Parameters (same defaults as tx_fifo)
//------------------------------------------------------------------------------
localparam  DATA_WIDTH  = 11                        ;   // fixed inside rx_fifo
parameter   FIFO_DEPTH  = 16                        ;
localparam  CNT_W       = $clog2(FIFO_DEPTH)+1      ;

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg                     clk                         ;
reg                     nRst                        ;
reg                     i_push                      ;
reg                     i_pop                       ;
reg  [DATA_WIDTH-1:0]   i_wdata                     ;
wire [DATA_WIDTH-1:0]   o_rdata                     ;
wire                    o_empty                     ;
wire                    o_full                      ;
wire [CNT_W-1:0]        o_count                     ;

//------------------------------------------------------------------------------
// Reference model, error and coverage counters
//------------------------------------------------------------------------------
reg  [DATA_WIDTH-1:0]   m_mem   [0:FIFO_DEPTH-1]    ;   // model storage
integer                 m_wr                        ;   // model write index
integer                 m_rd                        ;   // model read index
integer                 m_cnt                       ;   // model entry count

integer                 err_cnt                     ;   // total failed checks
integer                 sec_err                     ;   // errors at test start

integer                 cov_full_push               ;   // push on full
integer                 cov_empty_pop               ;   // pop on empty
integer                 cov_full_both               ;   // push&pop on full
integer                 cov_empty_both              ;   // push&pop on empty
integer                 cov_mid_both                ;   // push&pop in the middle

integer                 seed                        ;
integer                 i                           ;
reg  [DATA_WIDTH-1:0]   pat     [0:FIFO_DEPTH-1]    ;   // hex test pattern

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
rx_fifo #(
                .FIFO_DEPTH (FIFO_DEPTH )
)           uut (
                .clk        (clk        )   ,
                .nRst       (nRst       )   ,
                .i_push     (i_push     )   ,
                .i_pop      (i_pop      )   ,
                .i_wdata    (i_wdata    )   ,
                .o_rdata    (o_rdata    )   ,
                .o_empty    (o_empty    )   ,
                .o_full     (o_full     )   ,
                .o_count    (o_count    )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

//------------------------------------------------------------------------------
// Tasks
//------------------------------------------------------------------------------
// Compare the DUT outputs with the model (called after every clock)
task compare;
begin
    if (o_count !== m_cnt) begin
        $display("[FAIL] %0t : o_count = %0d (model %0d)", $time, o_count, m_cnt);
        err_cnt = err_cnt + 1;
    end
    if (o_empty !== (m_cnt == 0)) begin
        $display("[FAIL] %0t : o_empty = %b (model %b)", $time, o_empty, (m_cnt == 0));
        err_cnt = err_cnt + 1;
    end
    if (o_full !== (m_cnt == FIFO_DEPTH)) begin
        $display("[FAIL] %0t : o_full = %b (model %b)", $time, o_full, (m_cnt == FIFO_DEPTH));
        err_cnt = err_cnt + 1;
    end
    if (m_cnt != 0 && o_rdata !== m_mem[m_rd]) begin
        $display("[FAIL] %0t : o_rdata = %h (model %h)", $time, o_rdata, m_mem[m_rd]);
        err_cnt = err_cnt + 1;
    end
end
endtask

// One clock with the given push / pop request.
//   Inputs change on the falling edge, the DUT samples them on the rising edge,
//   and the outputs are checked 1 ns after the rising edge.
task cycle(input push, input pop, input [DATA_WIDTH-1:0] data);
    reg do_push;
    reg do_pop;
begin
    @(negedge clk);
    i_push  = push;
    i_pop   = pop;
    i_wdata = data;

    // accepted requests, decided from the state before the clock edge
    do_push = push && (m_cnt != FIFO_DEPTH);
    do_pop  = pop  && (m_cnt != 0);

    // coverage : which corner cases did the test really reach
    if (push && !pop && m_cnt == FIFO_DEPTH)    cov_full_push  = cov_full_push  + 1;
    if (pop  && !push && m_cnt == 0)            cov_empty_pop  = cov_empty_pop  + 1;
    if (push && pop && m_cnt == FIFO_DEPTH)     cov_full_both  = cov_full_both  + 1;
    if (push && pop && m_cnt == 0)              cov_empty_both = cov_empty_both + 1;
    if (push && pop && m_cnt != 0 && m_cnt != FIFO_DEPTH)
                                                cov_mid_both   = cov_mid_both   + 1;

    @(posedge clk);
    #1;

    // update the model
    if (do_push) begin
        m_mem[m_wr] = data;
        m_wr        = (m_wr + 1) % FIFO_DEPTH;
        m_cnt       = m_cnt + 1;
    end
    if (do_pop) begin
        m_rd        = (m_rd + 1) % FIFO_DEPTH;
        m_cnt       = m_cnt - 1;
    end

    compare;
end
endtask

// Release both requests for n clocks
task idle(input integer n);
    integer k;
begin
    for (k = 0; k < n; k = k + 1) cycle(1'b0, 1'b0, {DATA_WIDTH{1'b0}});
end
endtask

// Literal expected values (not taken from the model)
task expect_flags(input integer e_cnt, input e_empty, input e_full);
begin
    if (o_count !== e_cnt || o_empty !== e_empty || o_full !== e_full) begin
        $display("[FAIL] %0t : count/empty/full = %0d/%b/%b (exp %0d/%b/%b)",
                  $time, o_count, o_empty, o_full, e_cnt, e_empty, e_full);
        err_cnt = err_cnt + 1;
    end
end
endtask

task expect_rdata(input [DATA_WIDTH-1:0] e_data);
begin
    if (o_rdata !== e_data) begin
        $display("[FAIL] %0t : o_rdata = %h (exp %h)", $time, o_rdata, e_data);
        err_cnt = err_cnt + 1;
    end
end
endtask

// Asynchronous reset : outputs must clear without waiting for a clock edge
task apply_reset;
begin
    i_push = 1'b0;
    i_pop  = 1'b0;
    #1 nRst = 1'b0;
    #2;
    expect_flags(0, 1'b1, 1'b0);
    m_wr  = 0;
    m_rd  = 0;
    m_cnt = 0;
    repeat (2) @(posedge clk);
    #1 nRst = 1'b1;
end
endtask

task begin_test;
begin
    sec_err = err_cnt;
end
endtask

task end_test(input [8*40-1:0] name);
begin
    if (err_cnt == sec_err) $display("[PASS] %0s", name);
    else                    $display("[FAIL] %0s", name);
end
endtask

// Random requests : p_push / p_pop are probabilities in percent
task random_phase(input integer p_push, input integer p_pop, input integer n);
    integer k;
    reg     push;
    reg     pop;
    reg [DATA_WIDTH-1:0] data;
begin
    for (k = 0; k < n; k = k + 1) begin
        push = ({$random(seed)} % 100) < p_push;
        pop  = ({$random(seed)} % 100) < p_pop;
        data = $random(seed);
        cycle(push, pop, data);
    end
end
endtask

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
initial begin
    err_cnt        = 0;
    cov_full_push  = 0;
    cov_empty_pop  = 0;
    cov_full_both  = 0;
    cov_empty_both = 0;
    cov_mid_both   = 0;
    seed           = 32'h1234_5678;
    m_wr = 0;  m_rd = 0;  m_cnt = 0;

    for (i = 0; i < FIFO_DEPTH; i = i + 1)
        pat[i] = 11'h5A3 + 11'h1D7 * i;     // distinct 11-bit hex values

    nRst    = 1'b1;
    i_push  = 1'b0;
    i_pop   = 1'b0;
    i_wdata = {DATA_WIDTH{1'b0}};
    #1;

    //--------------------------------------------------------------------------
    // (1) reset values
    //--------------------------------------------------------------------------
    begin_test;
    apply_reset;
    expect_flags(0, 1'b1, 1'b0);
    end_test("(1) reset values");

    //--------------------------------------------------------------------------
    // (2) fill to full
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
        cycle(1'b1, 1'b0, pat[i]);
        expect_flags(i + 1, 1'b0, (i + 1 == FIFO_DEPTH));
        expect_rdata(pat[0]);                       // oldest entry stays at the head
    end
    end_test("(2) fill to full");

    //--------------------------------------------------------------------------
    // (3) push when full is ignored (data must not be overwritten)
    //--------------------------------------------------------------------------
    begin_test;
    cycle(1'b1, 1'b0, 11'h6EE);
    cycle(1'b1, 1'b0, 11'h2EF);
    expect_flags(FIFO_DEPTH, 1'b0, 1'b1);
    expect_rdata(pat[0]);
    end_test("(3) push when full ignored");

    //--------------------------------------------------------------------------
    // (4) full + push&pop in the same clock : push dropped, pop done
    //--------------------------------------------------------------------------
    begin_test;
    cycle(1'b1, 1'b1, 11'h5DD);
    expect_flags(FIFO_DEPTH - 1, 1'b0, 1'b0);
    expect_rdata(pat[1]);
    end_test("(4) full + push&pop : pop only");

    //--------------------------------------------------------------------------
    // (5) refill one entry, then drain : oldest-first order, empty flag
    //--------------------------------------------------------------------------
    begin_test;
    cycle(1'b1, 1'b0, 11'h377);
    expect_flags(FIFO_DEPTH, 1'b0, 1'b1);
    for (i = 1; i < FIFO_DEPTH; i = i + 1) begin
        expect_rdata(pat[i]);
        cycle(1'b0, 1'b1, 11'h000);
        expect_flags(FIFO_DEPTH - i, 1'b0, 1'b0);
    end
    expect_rdata(11'h377);
    cycle(1'b0, 1'b1, 11'h000);
    expect_flags(0, 1'b1, 1'b0);
    end_test("(5) drain in order, empty flag");

    //--------------------------------------------------------------------------
    // (6) pop when empty is ignored
    //--------------------------------------------------------------------------
    begin_test;
    cycle(1'b0, 1'b1, 11'h000);
    cycle(1'b0, 1'b1, 11'h000);
    expect_flags(0, 1'b1, 1'b0);
    end_test("(6) pop when empty ignored");

    //--------------------------------------------------------------------------
    // (7) empty + push&pop in the same clock : pop ignored, push accepted
    //--------------------------------------------------------------------------
    begin_test;
    cycle(1'b1, 1'b1, 11'h73C);
    expect_flags(1, 1'b0, 1'b0);
    expect_rdata(11'h73C);
    cycle(1'b0, 1'b1, 11'h000);
    expect_flags(0, 1'b1, 1'b0);
    end_test("(7) empty + push&pop : push only");

    //--------------------------------------------------------------------------
    // (8) pointer wrap-around
    //--------------------------------------------------------------------------
    begin_test;
    // push, check, pop : more than 2 x FIFO_DEPTH times
    for (i = 0; i < 2 * FIFO_DEPTH + 8; i = i + 1) begin
        cycle(1'b1, 1'b0, 11'h410 + i[7:0]);
        expect_rdata(11'h410 + i[7:0]);
        cycle(1'b0, 1'b1, 11'h000);
        expect_flags(0, 1'b1, 1'b0);
    end
    // streaming : one entry stays inside, push&pop every clock
    cycle(1'b1, 1'b0, 11'h6C0);
    for (i = 1; i <= 2 * FIFO_DEPTH + 8; i = i + 1) begin
        expect_rdata(11'h6C0 + i[7:0] - 8'd1);        // entry pushed one clock ago
        cycle(1'b1, 1'b1, 11'h6C0 + i[7:0]);
        expect_flags(1, 1'b0, 1'b0);
    end
    cycle(1'b0, 1'b1, 11'h000);
    expect_flags(0, 1'b1, 1'b0);
    end_test("(8) pointer wrap-around");

    //--------------------------------------------------------------------------
    // (9) asynchronous reset in the middle of operation
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 5; i = i + 1) cycle(1'b1, 1'b0, pat[i]);
    expect_flags(5, 1'b0, 1'b0);
    apply_reset;
    expect_flags(0, 1'b1, 1'b0);
    cycle(1'b1, 1'b0, 11'h49A);                       // pointers must start from 0 again
    expect_flags(1, 1'b0, 1'b0);
    expect_rdata(11'h49A);
    cycle(1'b0, 1'b1, 11'h000);
    expect_flags(0, 1'b1, 1'b0);
    end_test("(9) asynchronous reset");

    //--------------------------------------------------------------------------
    // (10) random requests, checked against the model every clock
    //--------------------------------------------------------------------------
    begin_test;
    random_phase(80, 20, 400);                      // push-heavy : reaches full
    random_phase(20, 80, 400);                      // pop-heavy  : reaches empty
    random_phase(50, 50, 400);                      // mixed
    random_phase(95, 95, 300);                      // push&pop together
    end_test("(10) random push/pop");

    // coverage : did the random test really reach the corner cases
    $display("[INFO] coverage : push@full=%0d pop@empty=%0d both@full=%0d both@empty=%0d both@mid=%0d",
              cov_full_push, cov_empty_pop, cov_full_both, cov_empty_both, cov_mid_both);
    if (cov_full_push == 0 || cov_empty_pop == 0 || cov_full_both == 0 ||
        cov_empty_both == 0 || cov_mid_both == 0) begin
        $display("[FAIL] a corner case was never exercised");
        err_cnt = err_cnt + 1;
    end

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_rx_fifo : ALL PASS ===");
    else              $display("=== tb_rx_fifo : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_rx_fifo.vcd");
    $dumpvars(0, tb_rx_fifo);
end

initial begin
    #1000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule
