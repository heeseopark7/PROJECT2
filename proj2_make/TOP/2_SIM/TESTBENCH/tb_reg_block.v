//==============================================================================
// Testbench : tb_reg_block
// DUT       : reg_block (APB slave + register block)
// Method    : Self-checking. The testbench is an APB master (apb_write /
//             apb_read, SETUP phase then ACCESS phase) and also drives the
//             status inputs (FIFO flags, RIS/MIS ...) that the inner modules
//             would normally provide. The register map is written here as byte
//             offsets (offset / 4 = value on PADDR[11:2]).
//
//               0x000 UARTDR    0x018 UARTFR    0x024 UARTIBRD  0x02C UARTLCR_H
//               0x030 UARTCR    0x038 UARTIMSC  0x03C UARTRIS   0x040 UARTMIS
//               0x044 UARTICR
//
//             A monitor counts the 1-clock pulses (o_tx_push, o_rx_pop, o_icr)
//             on every clock, so a pulse that is missing, repeated, or in the
//             wrong APB phase is caught. A small model of the stored registers
//             is used for the random test.
//
// Tests     : (1)  reset values and constant outputs (PREADY = 1, PSLVERR = 0)
//             (2)  UARTIBRD write / read back, unused upper bits
//             (3)  UARTLCR_H bits and outputs
//             (4)  UARTCR bits, o_tx_en / o_rx_en = UARTEN & TXE / RXE
//             (5)  UARTIMSC bits
//             (6)  UARTFR flag layout (all 32 input combinations)
//             (7)  UARTDR write -> o_tx_push + data, read -> o_rx_pop + data,
//                  empty RX FIFO reads 0
//             (8)  UARTRIS / UARTMIS read layout (all 128 values)
//             (9)  UARTICR -> o_icr pulse, bit mapping, bits [1:0] stay 0
//             (10) APB protocol : SETUP phase only / PSEL = 0 / read cycle
//                  never writes
//             (11) reserved addresses, read-only registers, write ignored
//             (12) asynchronous reset in the middle
//             (13) random APB traffic against the register model
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_reg_block;

//------------------------------------------------------------------------------
// Register offsets (byte offset / 4)
//------------------------------------------------------------------------------
localparam  [9:0]   A_DR    = 10'h000 >> 2  ;
localparam  [9:0]   A_FR    = 10'h018 >> 2  ;
localparam  [9:0]   A_IBRD  = 10'h024 >> 2  ;
localparam  [9:0]   A_LCRH  = 10'h02C >> 2  ;
localparam  [9:0]   A_CR    = 10'h030 >> 2  ;
localparam  [9:0]   A_IMSC  = 10'h038 >> 2  ;
localparam  [9:0]   A_RIS   = 10'h03C >> 2  ;
localparam  [9:0]   A_MIS   = 10'h040 >> 2  ;
localparam  [9:0]   A_ICR   = 10'h044 >> 2  ;

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg                 clk                     ;
reg                 nRst                    ;
reg                 i_psel                  ;
reg                 i_penable               ;
reg                 i_pwrite                ;
reg     [9:0]       i_paddr                 ;
reg     [31:0]      i_pwdata                ;
reg                 i_tx_full               ;
reg                 i_tx_empty              ;
reg     [10:0]      i_rx_rdata              ;
reg                 i_rx_empty              ;
reg                 i_rx_full               ;
reg                 i_tx_busy               ;
reg     [6:0]       i_ris                   ;
reg     [6:0]       i_mis                   ;
wire    [31:0]      o_prdata                ;
wire                o_pready                ;
wire                o_pslverr               ;
wire                o_tx_push               ;
wire    [7:0]       o_tx_wdata              ;
wire                o_rx_pop                ;
wire                o_tx_en                 ;
wire                o_brk                   ;
wire                o_rx_en                 ;
wire                o_pen                   ;
wire                o_eps                   ;
wire    [15:0]      o_ibrd                  ;
wire                o_lbe                   ;
wire    [6:0]       o_imsc                  ;
wire    [6:0]       o_icr                   ;

//------------------------------------------------------------------------------
// Testbench state
//------------------------------------------------------------------------------
integer             err_cnt                 ;
integer             sec_err                 ;
integer             seed                    ;
integer             i, j                    ;

// pulse monitor
integer             push_cnt                ;
integer             pop_cnt                 ;
integer             icr_cnt                 ;   // clocks with o_icr != 0
reg     [7:0]       last_wdata              ;   // o_tx_wdata at the last push
reg     [6:0]       last_icr                ;   // o_icr at the last non-zero clock

// model of the stored registers (random test)
reg     [15:0]      m_ibrd                  ;
reg                 m_eps, m_pen, m_brk     ;
reg                 m_rxe, m_txe, m_lbe, m_uarten ;
reg     [6:0]       m_imsc                  ;

reg     [31:0]      rdata                   ;

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
reg_block   uut (
                .clk            (clk            )   ,
                .nRst           (nRst           )   ,
                .i_psel         (i_psel         )   ,
                .i_penable      (i_penable      )   ,
                .i_pwrite       (i_pwrite       )   ,
                .i_paddr        (i_paddr        )   ,
                .i_pwdata       (i_pwdata       )   ,
                .i_tx_full      (i_tx_full      )   ,
                .i_tx_empty     (i_tx_empty     )   ,
                .i_rx_rdata     (i_rx_rdata     )   ,
                .i_rx_empty     (i_rx_empty     )   ,
                .i_rx_full      (i_rx_full      )   ,
                .i_tx_busy      (i_tx_busy      )   ,
                .i_ris          (i_ris          )   ,
                .i_mis          (i_mis          )   ,
                .o_prdata       (o_prdata       )   ,
                .o_pready       (o_pready       )   ,
                .o_pslverr      (o_pslverr      )   ,
                .o_tx_push      (o_tx_push      )   ,
                .o_tx_wdata     (o_tx_wdata     )   ,
                .o_rx_pop       (o_rx_pop       )   ,
                .o_tx_en        (o_tx_en        )   ,
                .o_brk          (o_brk          )   ,
                .o_rx_en        (o_rx_en        )   ,
                .o_pen          (o_pen          )   ,
                .o_eps          (o_eps          )   ,
                .o_ibrd         (o_ibrd         )   ,
                .o_lbe          (o_lbe          )   ,
                .o_imsc         (o_imsc         )   ,
                .o_icr          (o_icr          )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz
//------------------------------------------------------------------------------
initial clk = 1'b0;
always  #5 clk = ~clk;

//------------------------------------------------------------------------------
// Monitor : pulse counters, constant outputs
//------------------------------------------------------------------------------
always @(posedge clk) begin
    if (o_tx_push) begin
        push_cnt   = push_cnt + 1;
        last_wdata = o_tx_wdata;
    end
    if (o_rx_pop) pop_cnt = pop_cnt + 1;
    if (o_icr != 7'b0) begin
        icr_cnt  = icr_cnt + 1;
        last_icr = o_icr;
    end
    if (o_pready !== 1'b1 || o_pslverr !== 1'b0) begin
        $display("[FAIL] %0t : PREADY/PSLVERR = %b/%b (must be 1/0)", $time, o_pready, o_pslverr);
        err_cnt = err_cnt + 1;
    end
    if (o_icr[1:0] !== 2'b00) begin
        $display("[FAIL] %0t : o_icr[1:0] = %b (must stay 0)", $time, o_icr[1:0]);
        err_cnt = err_cnt + 1;
    end
end

//------------------------------------------------------------------------------
// APB master tasks (all signal changes on the falling edge)
//   SETUP  phase : PSEL = 1, PENABLE = 0          (1 clock)
//   ACCESS phase : PSEL = 1, PENABLE = 1          (1 clock, PREADY is always 1)
//------------------------------------------------------------------------------
task apb_write(input [9:0] a, input [31:0] d);
begin
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b1;  i_paddr = a;  i_pwdata = d;
    @(negedge clk);
    i_penable = 1'b1;
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b0;  i_pwrite = 1'b0;
end
endtask

task apb_read(input [9:0] a, output [31:0] d);
begin
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b0;  i_paddr = a;
    i_pwdata = 32'hFFFF_FFFF;                   // junk on the write bus during a read
    @(negedge clk);
    i_penable = 1'b1;
    #3 d = o_prdata;                            // read data is valid in the ACCESS phase
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b0;
end
endtask

task rd_expect(input [9:0] a, input [31:0] e);
    reg [31:0] d;
begin
    apb_read(a, d);
    if (d !== e) begin
        $display("[FAIL] %0t : read 0x%03h = %h (exp %h)", $time, a << 2, d, e);
        err_cnt = err_cnt + 1;
    end
end
endtask

task expect_out(input [15:0] e_ibrd, input e_eps, input e_pen, input e_brk,
                input e_rx_en, input e_tx_en, input e_lbe, input [6:0] e_imsc);
begin
    if (o_ibrd !== e_ibrd || o_eps !== e_eps || o_pen !== e_pen || o_brk !== e_brk ||
        o_rx_en !== e_rx_en || o_tx_en !== e_tx_en || o_lbe !== e_lbe || o_imsc !== e_imsc) begin
        $display("[FAIL] %0t : outputs ibrd=%h eps=%b pen=%b brk=%b rx_en=%b tx_en=%b lbe=%b imsc=%h",
                  $time, o_ibrd, o_eps, o_pen, o_brk, o_rx_en, o_tx_en, o_lbe, o_imsc);
        $display("                         expected ibrd=%h eps=%b pen=%b brk=%b rx_en=%b tx_en=%b lbe=%b imsc=%h",
                  e_ibrd, e_eps, e_pen, e_brk, e_rx_en, e_tx_en, e_lbe, e_imsc);
        err_cnt = err_cnt + 1;
    end
end
endtask

// pulse counts since a start point : push, pop, icr must each have this value
task expect_pulses(input integer p0, input integer q0, input integer c0,
                   input integer e_push, input integer e_pop, input integer e_icr);
begin
    if (push_cnt - p0 != e_push || pop_cnt - q0 != e_pop || icr_cnt - c0 != e_icr) begin
        $display("[FAIL] %0t : pulses push/pop/icr = %0d/%0d/%0d (exp %0d/%0d/%0d)", $time,
                  push_cnt - p0, pop_cnt - q0, icr_cnt - c0, e_push, e_pop, e_icr);
        err_cnt = err_cnt + 1;
    end
end
endtask

task apply_reset;
begin
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b0;  i_pwrite = 1'b0;
    nRst = 1'b0;
    repeat (2) @(negedge clk);
    nRst = 1'b1;
end
endtask

task model_reset;
begin
    m_ibrd = 16'h00D9;
    m_eps = 1'b0;  m_pen = 1'b0;  m_brk = 1'b0;
    m_rxe = 1'b1;  m_txe = 1'b1;  m_lbe = 1'b0;  m_uarten = 1'b0;
    m_imsc = 7'd0;
end
endtask

task model_write(input [9:0] a, input [31:0] d);
begin
    if      (a == A_IBRD) m_ibrd = d[15:0];
    else if (a == A_LCRH) begin m_eps = d[2]; m_pen = d[1]; m_brk = d[0]; end
    else if (a == A_CR)   begin m_rxe = d[9]; m_txe = d[8]; m_lbe = d[7]; m_uarten = d[0]; end
    else if (a == A_IMSC) m_imsc = d[10:4];
end
endtask

task check_model_outputs;
begin
    expect_out(m_ibrd, m_eps, m_pen, m_brk, m_uarten && m_rxe, m_uarten && m_txe, m_lbe, m_imsc);
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

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer p0, q0, c0;
integer n_op;
reg [9:0]  r_addr;
reg [31:0] r_data;
reg [31:0] e_fr;
reg        e_busy;
reg        wr;

initial begin
    err_cnt  = 0;
    seed     = 32'h00C0_FFEE;
    push_cnt = 0;  pop_cnt = 0;  icr_cnt = 0;
    last_wdata = 8'h00;  last_icr = 7'd0;
    nRst = 1'b1;
    i_psel = 1'b0;  i_penable = 1'b0;  i_pwrite = 1'b0;  i_paddr = 10'd0;  i_pwdata = 32'd0;
    i_tx_full = 1'b0;  i_tx_empty = 1'b1;  i_rx_rdata = 11'd0;  i_rx_empty = 1'b1;
    i_rx_full = 1'b0;  i_tx_busy = 1'b0;  i_ris = 7'd0;  i_mis = 7'd0;
    model_reset;
    #1;
    nRst = 1'b0;
    repeat (2) @(negedge clk);
    nRst = 1'b1;

    //--------------------------------------------------------------------------
    // (1) reset values
    //--------------------------------------------------------------------------
    begin_test;
    expect_out(16'h00D9, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    rd_expect(A_IBRD, 32'h0000_00D9);
    rd_expect(A_LCRH, 32'h0000_0000);
    rd_expect(A_CR,   32'h0000_0300);                    // RXE = TXE = 1, UARTEN = 0
    rd_expect(A_IMSC, 32'h0000_0000);
    end_test("(1) reset values, PREADY=1 PSLVERR=0");

    //--------------------------------------------------------------------------
    // (2) UARTIBRD
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_IBRD, 32'h1234_ABCD);                    // only [15:0] is stored
    rd_expect(A_IBRD, 32'h0000_ABCD);
    expect_out(16'hABCD, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_IBRD, 32'h0000_0001);
    rd_expect(A_IBRD, 32'h0000_0001);
    apb_write(A_IBRD, 32'hFFFF_FFFF);
    rd_expect(A_IBRD, 32'h0000_FFFF);
    apb_write(A_IBRD, 32'h0000_0000);
    rd_expect(A_IBRD, 32'h0000_0000);
    apb_write(A_IBRD, 32'h0000_00A3);
    rd_expect(A_IBRD, 32'h0000_00A3);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    end_test("(2) UARTIBRD write / read back");

    //--------------------------------------------------------------------------
    // (3) UARTLCR_H : [2] = EPS, [1] = PEN, [0] = BRK
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_LCRH, 32'h0000_0001);
    rd_expect(A_LCRH, 32'h0000_0001);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_LCRH, 32'h0000_0002);
    rd_expect(A_LCRH, 32'h0000_0002);
    expect_out(16'h00A3, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_LCRH, 32'h0000_0004);
    rd_expect(A_LCRH, 32'h0000_0004);
    expect_out(16'h00A3, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_LCRH, 32'hFFFF_FFFF);                    // other bits are not stored
    rd_expect(A_LCRH, 32'h0000_0007);
    expect_out(16'h00A3, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_LCRH, 32'hFFFF_FFF8);
    rd_expect(A_LCRH, 32'h0000_0000);
    end_test("(3) UARTLCR_H bits and outputs");

    //--------------------------------------------------------------------------
    // (4) UARTCR : [9] = RXE, [8] = TXE, [7] = LBE, [0] = UARTEN
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, 32'h0000_0001);                      // UARTEN only : RXE = TXE = 0
    rd_expect(A_CR, 32'h0000_0001);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_CR, 32'h0000_0101);                      // UARTEN + TXE
    rd_expect(A_CR, 32'h0000_0101);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 7'h00);
    apb_write(A_CR, 32'h0000_0201);                      // UARTEN + RXE
    rd_expect(A_CR, 32'h0000_0201);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 7'h00);
    apb_write(A_CR, 32'h0000_0300);                      // RXE + TXE but UARTEN = 0
    rd_expect(A_CR, 32'h0000_0300);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    apb_write(A_CR, 32'h0000_0080);                      // loopback only
    rd_expect(A_CR, 32'h0000_0080);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 7'h00);
    apb_write(A_CR, 32'hFFFF_FFFF);                      // all stored bits set
    rd_expect(A_CR, 32'h0000_0381);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 7'h00);
    apb_write(A_CR, 32'h0000_0301);                      // normal operation
    rd_expect(A_CR, 32'h0000_0301);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 7'h00);
    end_test("(4) UARTCR bits, o_tx_en / o_rx_en");

    //--------------------------------------------------------------------------
    // (5) UARTIMSC : [10:4] = mask of OE, BE, PE, FE, RT, TX, RX
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 7; i = i + 1) begin
        apb_write(A_IMSC, 32'h1 << (i + 4));
        rd_expect(A_IMSC, 32'h1 << (i + 4));
        expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 7'h1 << i);
    end
    apb_write(A_IMSC, 32'hFFFF_FFFF);
    rd_expect(A_IMSC, 32'h0000_07F0);
    expect_out(16'h00A3, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 7'h7F);
    apb_write(A_IMSC, 32'hFFFF_F80F);                    // bits [10:4] = 0, other bits ignored
    rd_expect(A_IMSC, 32'h0000_0000);
    end_test("(5) UARTIMSC bits");

    //--------------------------------------------------------------------------
    // (6) UARTFR : [7]=TXFE [6]=RXFF [5]=TXFF [4]=RXFE [3]=BUSY
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 32; i = i + 1) begin
        i_tx_empty = i[4];  i_rx_full = i[3];  i_tx_full = i[2];  i_rx_empty = i[1];  i_tx_busy = i[0];
        e_busy = (!i[4]) || i[0];                        // FIFO not empty OR tx_logic working
        e_fr   = (i[4] << 7) | (i[3] << 6) | (i[2] << 5) | (i[1] << 4) | (e_busy << 3);
        rd_expect(A_FR, e_fr);
    end
    i_tx_empty = 1'b1;  i_rx_full = 1'b0;  i_tx_full = 1'b0;  i_rx_empty = 1'b1;  i_tx_busy = 1'b0;
    rd_expect(A_FR, 32'h0000_0090);                      // idle : TXFE and RXFE
    end_test("(6) UARTFR flag layout, 32 combinations");

    //--------------------------------------------------------------------------
    // (7) UARTDR
    //--------------------------------------------------------------------------
    begin_test;
    // write : one o_tx_push pulse, data = PWDATA[7:0]
    p0 = push_cnt;  q0 = pop_cnt;  c0 = icr_cnt;
    apb_write(A_DR, 32'hFFFF_FF5A);
    expect_pulses(p0, q0, c0, 1, 0, 0);
    if (last_wdata !== 8'h5A) begin
        $display("[FAIL] o_tx_wdata = %h (exp 5A)", last_wdata);
        err_cnt = err_cnt + 1;
    end
    p0 = push_cnt;
    apb_write(A_DR, 32'h0000_00C3);
    expect_pulses(p0, q0, c0, 1, 0, 0);
    if (last_wdata !== 8'hC3) begin
        $display("[FAIL] o_tx_wdata = %h (exp C3)", last_wdata);
        err_cnt = err_cnt + 1;
    end
    // read with an empty RX FIFO : data is 0, the pop pulse is still given
    i_rx_empty = 1'b1;  i_rx_rdata = 11'h7FF;
    p0 = push_cnt;  q0 = pop_cnt;
    rd_expect(A_DR, 32'h0000_0000);
    expect_pulses(p0, q0, c0, 0, 1, 0);
    // read with data : {BE, PE, FE, DATA} in bits [10:0]
    i_rx_empty = 1'b0;
    i_rx_rdata = 11'h7FF;  q0 = pop_cnt;  rd_expect(A_DR, 32'h0000_07FF);  expect_pulses(p0, q0, c0, 0, 1, 0);
    i_rx_rdata = 11'h5A3;  q0 = pop_cnt;  rd_expect(A_DR, 32'h0000_05A3);  expect_pulses(p0, q0, c0, 0, 1, 0);
    i_rx_rdata = 11'h400;  q0 = pop_cnt;  rd_expect(A_DR, 32'h0000_0400);  expect_pulses(p0, q0, c0, 0, 1, 0);
    i_rx_rdata = 11'h0A5;  q0 = pop_cnt;  rd_expect(A_DR, 32'h0000_00A5);  expect_pulses(p0, q0, c0, 0, 1, 0);
    // other registers never give a push / pop
    q0 = pop_cnt;  p0 = push_cnt;
    rd_expect(A_FR, 32'h0000_0080);                      // TX FIFO empty (TXFE), RX FIFO has data
    rd_expect(A_IBRD, 32'h0000_00A3);
    apb_write(A_IBRD, 32'h0000_00A3);
    expect_pulses(p0, q0, c0, 0, 0, 0);
    i_rx_empty = 1'b1;
    end_test("(7) UARTDR write -> push, read -> pop");

    //--------------------------------------------------------------------------
    // (8) UARTRIS / UARTMIS : value in bits [10:4]
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 128; i = i + 1) begin
        i_ris = i[6:0];
        i_mis = ~i[6:0];                                 // 7-bit wide, so ~ stays 7 bits
        rd_expect(A_RIS, {21'b0, i_ris, 4'b0});
        rd_expect(A_MIS, {21'b0, i_mis, 4'b0});
    end
    i_ris = 7'd0;  i_mis = 7'd0;
    end_test("(8) UARTRIS / UARTMIS layout, 128 values");

    //--------------------------------------------------------------------------
    // (9) UARTICR : PWDATA[10:6] -> o_icr[6:2] for one clock, o_icr[1:0] = 0
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 6; i <= 10; i = i + 1) begin
        c0 = icr_cnt;  p0 = push_cnt;  q0 = pop_cnt;
        apb_write(A_ICR, 32'h1 << i);
        expect_pulses(p0, q0, c0, 0, 0, 1);
        if (last_icr !== (7'h1 << (i - 4))) begin
            $display("[FAIL] ICR write bit %0d -> o_icr = %b (exp %b)", i, last_icr, 7'h1 << (i - 4));
            err_cnt = err_cnt + 1;
        end
    end
    c0 = icr_cnt;
    apb_write(A_ICR, 32'hFFFF_FFFF);                     // all clear bits at once
    expect_pulses(p0, q0, c0, 0, 0, 1);
    if (last_icr !== 7'b1111100) begin
        $display("[FAIL] ICR 0xFFFFFFFF -> o_icr = %b (exp 1111100)", last_icr);
        err_cnt = err_cnt + 1;
    end
    c0 = icr_cnt;                                        // bits [5:0] of PWDATA give no pulse
    apb_write(A_ICR, 32'h0000_003F);
    expect_pulses(p0, q0, c0, 0, 0, 0);
    rd_expect(A_ICR, 32'h0000_0000);                     // ICR is write-only
    expect_pulses(p0, q0, c0, 0, 0, 0);
    end_test("(9) UARTICR pulse and bit mapping");

    //--------------------------------------------------------------------------
    // (10) APB protocol : only a confirmed ACCESS phase of a WRITE has an effect
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_IBRD, 32'h0000_0055);
    c0 = icr_cnt;  p0 = push_cnt;  q0 = pop_cnt;
    // SETUP phase only (PENABLE = 0), then the master goes away
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b1;  i_paddr = A_IBRD;  i_pwdata = 32'h0000_AAAA;
    @(negedge clk);
    i_psel = 1'b0;
    // PSEL = 0 with PENABLE = 1
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b1;  i_pwrite = 1'b1;  i_paddr = A_IBRD;  i_pwdata = 32'h0000_BBBB;
    @(negedge clk);
    i_penable = 1'b0;
    // read cycle with write data on the bus
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b0;  i_paddr = A_IBRD;  i_pwdata = 32'h0000_CCCC;
    @(negedge clk);
    i_penable = 1'b1;
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b0;
    rd_expect(A_IBRD, 32'h0000_0055);                    // nothing was written
    // the same no-effect rules for the pulse registers
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b1;  i_paddr = A_DR;   i_pwdata = 32'h0000_0011;
    @(negedge clk);
    i_paddr = A_ICR;  i_pwdata = 32'hFFFF_FFFF;
    @(negedge clk);
    i_psel = 1'b0;  i_pwrite = 1'b0;
    @(negedge clk);
    i_psel = 1'b0;  i_penable = 1'b1;  i_pwrite = 1'b1;  i_paddr = A_DR;   i_pwdata = 32'h0000_0022;
    @(negedge clk);
    i_penable = 1'b0;  i_pwrite = 1'b0;
    @(negedge clk);
    i_psel = 1'b1;  i_penable = 1'b0;  i_pwrite = 1'b0;  i_paddr = A_DR;
    @(negedge clk);
    i_psel = 1'b0;                                       // read SETUP phase only : no pop
    expect_pulses(p0, q0, c0, 0, 0, 0);
    end_test("(10) APB protocol (SETUP/PSEL/read cycle)");

    //--------------------------------------------------------------------------
    // (11) reserved addresses and read-only registers
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_LCRH, 32'h0000_0006);
    apb_write(A_CR,   32'h0000_0301);
    apb_write(A_IMSC, 32'h0000_0450);
    apb_write(A_IBRD, 32'h0000_0123);
    i_tx_empty = 1'b1;  i_rx_empty = 1'b1;
    // writes to read-only registers have no effect
    apb_write(A_FR,  32'hFFFF_FFFF);
    apb_write(A_RIS, 32'hFFFF_FFFF);
    apb_write(A_MIS, 32'hFFFF_FFFF);
    rd_expect(A_FR,  32'h0000_0090);
    // reserved addresses : read as 0, write is ignored
    p0 = push_cnt;  q0 = pop_cnt;  c0 = icr_cnt;
    for (i = 0; i < 1024; i = i + 1) begin
        if (i != A_DR && i != A_FR && i != A_IBRD && i != A_LCRH && i != A_CR &&
            i != A_IMSC && i != A_RIS && i != A_MIS && i != A_ICR) begin
            apb_write(i[9:0], 32'hFFFF_FFFF);
            if (i % 16 == 3) rd_expect(i[9:0], 32'h0000_0000);   // read a sample of them
        end
    end
    rd_expect(10'd1,    32'h0);
    rd_expect(10'd18,   32'h0);
    rd_expect(10'd1023, 32'h0);
    expect_pulses(p0, q0, c0, 0, 0, 0);
    rd_expect(A_IBRD, 32'h0000_0123);                    // stored values are unchanged
    rd_expect(A_LCRH, 32'h0000_0006);
    rd_expect(A_CR,   32'h0000_0301);
    rd_expect(A_IMSC, 32'h0000_0450);
    end_test("(11) reserved addresses, read-only registers");

    //--------------------------------------------------------------------------
    // (12) asynchronous reset in the middle
    //--------------------------------------------------------------------------
    begin_test;
    #1 nRst = 1'b0;                                      // no clock edge needed
    #2;
    expect_out(16'h00D9, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 7'h00);
    @(negedge clk);
    nRst = 1'b1;
    rd_expect(A_IBRD, 32'h0000_00D9);
    rd_expect(A_LCRH, 32'h0000_0000);
    rd_expect(A_CR,   32'h0000_0300);
    rd_expect(A_IMSC, 32'h0000_0000);
    end_test("(12) asynchronous reset");

    //--------------------------------------------------------------------------
    // (13) random APB traffic against the register model
    //--------------------------------------------------------------------------
    begin_test;
    model_reset;
    for (n_op = 0; n_op < 1500; n_op = n_op + 1) begin
        case ({$random(seed)} % 10)
            0: r_addr = A_IBRD;
            1: r_addr = A_LCRH;
            2: r_addr = A_CR;
            3: r_addr = A_IMSC;
            4: r_addr = A_DR;
            5: r_addr = A_ICR;
            6: r_addr = A_FR;
            7: r_addr = A_RIS;
            8: r_addr = A_MIS;
            default: r_addr = $random(seed);
        endcase
        r_data = $random(seed);
        wr     = $random(seed);
        i_ris  = $random(seed);  i_mis = $random(seed);
        i_tx_empty = $random(seed);  i_tx_full = $random(seed);  i_rx_empty = $random(seed);
        i_rx_full  = $random(seed);  i_tx_busy = $random(seed);  i_rx_rdata = $random(seed);
        if (wr) begin
            apb_write(r_addr, r_data);
            model_write(r_addr, r_data);
        end
        else begin
            apb_read(r_addr, rdata);
            if      (r_addr == A_IBRD) e_fr = {16'b0, m_ibrd};
            else if (r_addr == A_LCRH) e_fr = {29'b0, m_eps, m_pen, m_brk};
            else if (r_addr == A_CR)   e_fr = (m_rxe << 9) | (m_txe << 8) | (m_lbe << 7) | m_uarten;
            else if (r_addr == A_IMSC) e_fr = m_imsc << 4;
            else if (r_addr == A_RIS)  e_fr = i_ris << 4;
            else if (r_addr == A_MIS)  e_fr = i_mis << 4;
            else if (r_addr == A_FR)   e_fr = (i_tx_empty << 7) | (i_rx_full << 6) | (i_tx_full << 5) |
                                               (i_rx_empty << 4) | (((!i_tx_empty) || i_tx_busy) << 3);
            else if (r_addr == A_DR)   e_fr = i_rx_empty ? 32'd0 : {21'b0, i_rx_rdata};
            else                       e_fr = 32'd0;
            if (rdata !== e_fr) begin
                $display("[FAIL] %0t : random read 0x%03h = %h (exp %h)", $time, r_addr << 2, rdata, e_fr);
                err_cnt = err_cnt + 1;
            end
        end
        check_model_outputs;
    end
    end_test("(13) random APB traffic vs register model");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_reg_block : ALL PASS ===");
    else              $display("=== tb_reg_block : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_reg_block.vcd");
    $dumpvars(0, tb_reg_block);
end

initial begin
    #50000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule
