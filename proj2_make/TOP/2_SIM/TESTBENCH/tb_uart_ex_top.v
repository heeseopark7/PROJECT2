//==============================================================================
// Testbench : tb_uart_ex_top
// DUT       : uart_ex_top (whole Extended UART)
// Method    : System level, self-checking. The testbench plays three roles:
//             - APB master      : apb_write / apb_read (SETUP then ACCESS phase)
//             - serial receiver : a decoder on UARTTXD (checks every frame:
//                                 data, parity, stop bit, and the bit time)
//             - serial sender   : drives frames on UARTRXD (with parity / framing
//                                 errors, break, glitches)
//             The unit testbenches already test each block. This one checks
//             that the blocks work together: register programming, baud rate,
//             TX path, RX path, loopback, FIFO flags, error flags and all five
//             interrupt pins.
//
//             Register map (byte offset): UARTDR 0x000, UARTFR 0x018,
//             UARTIBRD 0x024, UARTLCR_H 0x02C, UARTCR 0x030, UARTIMSC 0x038,
//             UARTRIS 0x03C, UARTMIS 0x040, UARTICR 0x044
//
// Tests     : (1)  reset values, idle pins
//             (2)  transmit : bytes on UARTTXD, FR flags, exact bit time
//             (3)  transmit with even / odd parity
//             (4)  TX FIFO : fill while disabled, TXFF, 17th byte lost, order
//             (5)  loopback : single byte, 16 bytes, RXFF, RX FIFO overrun
//             (6)  loopback with parity
//             (7)  receive from UARTRXD : good frame, FE, PE, break, glitch
//             (8)  UARTEN / TXE / RXE switches
//             (9)  break transmit (LCR_H.BRK), received as break in loopback
//             (10) baud rates : IBRD = 1, 2, 3, 9, 33
//             (11) interrupts : TX, RX, RT (512 ticks), error, combined pins
//             (12) random loopback traffic
//             (13) asynchronous reset in the middle of a frame
// Result    : prints PASS / FAIL per test and the number of errors at the end
//==============================================================================

`timescale 1ns / 1ps

module tb_uart_ex_top;

//------------------------------------------------------------------------------
// Register word addresses (byte offset / 4)
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

// UARTCR values
localparam  [31:0]  CR_OFF  = 32'h0000_0300 ;   // UARTEN = 0 (RXE = TXE = 1)
localparam  [31:0]  CR_ON   = 32'h0000_0301 ;   // UARTEN + RXE + TXE
localparam  [31:0]  CR_LBE  = 32'h0000_0381 ;   // + loopback

// UARTIMSC bit positions (value written to the register)
localparam  [31:0]  M_RX    = 32'h0000_0010 ;
localparam  [31:0]  M_TX    = 32'h0000_0020 ;
localparam  [31:0]  M_RT    = 32'h0000_0040 ;
localparam  [31:0]  M_ERR   = 32'h0000_0780 ;   // FE, PE, BE, OE
localparam  [31:0]  M_ALL   = 32'h0000_07F0 ;

parameter           FIFO_DEPTH = 16         ;

//------------------------------------------------------------------------------
// DUT signals
//------------------------------------------------------------------------------
reg                 PCLK                    ;
reg                 PRESETn                 ;
reg                 PSEL                    ;
reg                 PENABLE                 ;
reg                 PWRITE                  ;
reg     [11:2]      PADDR                   ;
reg     [31:0]      PWDATA                  ;
wire    [31:0]      PRDATA                  ;
wire                PREADY                  ;
wire                PSLVERR                 ;
wire                UARTRXD                 ;
wire                UARTTXD                 ;
wire                UARTRXINTR              ;
wire                UARTTXINTR              ;
wire                UARTRTINTR              ;
wire                UARTEINTR               ;
wire                UARTINTR                ;

reg                 rxd_drv                 ;   // drives UARTRXD
assign  UARTRXD = rxd_drv;

//------------------------------------------------------------------------------
// Testbench state
//------------------------------------------------------------------------------
integer             err_cnt                 ;
integer             sec_err                 ;
integer             cyc                     ;
integer             seed                    ;
integer             i, j, k                 ;

integer             IBRD_V                  ;   // programmed divisor
integer             BITC                    ;   // clocks per bit = 16 * IBRD

reg     [31:0]      rd                      ;   // last APB read data

//------------------------------------------------------------------------------
// DUT
//------------------------------------------------------------------------------
uart_ex_top #(
                .FIFO_DEPTH (FIFO_DEPTH )
)           uut (
                .PCLK       (PCLK       )   ,
                .PRESETn    (PRESETn    )   ,
                .PSEL       (PSEL       )   ,
                .PENABLE    (PENABLE    )   ,
                .PWRITE     (PWRITE     )   ,
                .PADDR      (PADDR      )   ,
                .PWDATA     (PWDATA     )   ,
                .PRDATA     (PRDATA     )   ,
                .PREADY     (PREADY     )   ,
                .PSLVERR    (PSLVERR    )   ,
                .UARTRXD    (UARTRXD    )   ,
                .UARTTXD    (UARTTXD    )   ,
                .UARTRXINTR (UARTRXINTR )   ,
                .UARTTXINTR (UARTTXINTR )   ,
                .UARTRTINTR (UARTRTINTR )   ,
                .UARTEINTR  (UARTEINTR  )   ,
                .UARTINTR   (UARTINTR   )
);

//------------------------------------------------------------------------------
// Clock : 100 MHz, clock counter
//------------------------------------------------------------------------------
initial PCLK = 1'b0;
always  #5 PCLK = ~PCLK;

initial cyc = 0;
always @(posedge PCLK) cyc <= cyc + 1;

// APB outputs that must never change
always @(posedge PCLK) begin
    if (PREADY !== 1'b1 || PSLVERR !== 1'b0) begin
        $display("[FAIL] %0t : PREADY/PSLVERR = %b/%b", $time, PREADY, PSLVERR);
        err_cnt = err_cnt + 1;
    end
end

//------------------------------------------------------------------------------
// Serial decoder on UARTTXD : every frame is decoded in the middle of each bit
//   ext_pen / ext_eps : what the testbench has programmed in UARTLCR_H
//------------------------------------------------------------------------------
reg                 dec_en                  ;
reg                 ext_pen                 ;
reg                 ext_eps                 ;
reg     [7:0]       cap_d   [0:1023]        ;
reg                 cap_p   [0:1023]        ;   // parity cell
reg                 cap_hp  [0:1023]        ;   // frame had a parity cell
reg                 cap_s   [0:1023]        ;   // stop bit
integer             cap_n                   ;   // frames decoded
integer             cap_rd                  ;   // frames already checked

reg     [7:0]       dec_d                   ;
reg                 dec_p, dec_s, dec_hp    ;
integer             dec_b                   ;

initial begin
    dec_en = 1'b0;  cap_n = 0;  cap_rd = 0;  ext_pen = 1'b0;  ext_eps = 1'b0;
    forever begin
        @(negedge UARTTXD);
        if (dec_en) begin
            repeat (BITC / 2) @(posedge PCLK);                  // middle of the start bit
            if (UARTTXD !== 1'b0) begin
                $display("[FAIL] %0t : UARTTXD glitch, start bit is not 0 in its middle", $time);
                err_cnt = err_cnt + 1;
            end
            else begin
                for (dec_b = 0; dec_b < 8; dec_b = dec_b + 1) begin
                    repeat (BITC) @(posedge PCLK);
                    dec_d[dec_b] = UARTTXD;
                end
                dec_hp = ext_pen;
                dec_p  = 1'b0;
                if (dec_hp) begin
                    repeat (BITC) @(posedge PCLK);
                    dec_p = UARTTXD;
                end
                repeat (BITC) @(posedge PCLK);
                dec_s = UARTTXD;
                if (dec_en) begin
                    cap_d [cap_n % 1024] = dec_d;
                    cap_p [cap_n % 1024] = dec_p;
                    cap_hp[cap_n % 1024] = dec_hp;
                    cap_s [cap_n % 1024] = dec_s;
                    cap_n = cap_n + 1;
                end
                if (dec_s !== 1'b1) @(posedge UARTTXD);        // break : wait for the idle level
            end
        end
    end
end

// Check the next decoded frame (waits for it)
task expect_tx_frame(input [7:0] d, input pen, input eps);
    integer t;
    reg     par;
begin
    t = 0;
    while (cap_n <= cap_rd && t < 40 * BITC) begin
        @(posedge PCLK);
        t = t + 1;
    end
    if (cap_n <= cap_rd) begin
        $display("[FAIL] %0t : frame %h never appeared on UARTTXD", $time, d);
        err_cnt = err_cnt + 1;
    end
    else begin
        par = eps ? (^d) : ~(^d);
        if (cap_d[cap_rd % 1024] !== d || cap_s[cap_rd % 1024] !== 1'b1 ||
            cap_hp[cap_rd % 1024] !== pen || (pen && cap_p[cap_rd % 1024] !== par)) begin
            $display("[FAIL] %0t : UARTTXD frame data=%h parity=%b(has %b) stop=%b (exp data=%h parity=%b has=%b stop=1)",
                      $time, cap_d[cap_rd % 1024], cap_p[cap_rd % 1024], cap_hp[cap_rd % 1024],
                      cap_s[cap_rd % 1024], d, par, pen);
            err_cnt = err_cnt + 1;
        end
        cap_rd = cap_rd + 1;
    end
end
endtask

// No more frames than expected were sent
task expect_no_more_tx;
begin
    repeat (3 * BITC) @(posedge PCLK);
    if (cap_n != cap_rd) begin
        $display("[FAIL] %0t : %0d unexpected frame(s) on UARTTXD", $time, cap_n - cap_rd);
        err_cnt = err_cnt + (cap_n - cap_rd);
        cap_rd = cap_n;
    end
end
endtask

//------------------------------------------------------------------------------
// Serial sender on UARTRXD
//------------------------------------------------------------------------------
task rx_bit(input v);
begin
    rxd_drv = v;
    repeat (BITC) @(negedge PCLK);
end
endtask

task ext_frame(input [7:0] d, input p_en, input p_eps, input flip, input stop_val, input integer gap);
    reg     par;
    reg     pbit;
    integer b;
begin
    par  = p_eps ? (^d) : ~(^d);
    pbit = par ^ flip;
    @(negedge PCLK);
    rx_bit(1'b0);
    for (b = 0; b < 8; b = b + 1) rx_bit(d[b]);
    if (p_en) rx_bit(pbit);
    rxd_drv = stop_val;
    repeat (BITC) @(negedge PCLK);
    rxd_drv = 1'b1;
    repeat ((!stop_val && gap < 2) ? 2 : gap) @(negedge PCLK);
end
endtask

//------------------------------------------------------------------------------
// APB master (all changes on the falling edge)
//------------------------------------------------------------------------------
task apb_write(input [9:0] a, input [31:0] d);
begin
    @(negedge PCLK);
    PSEL = 1'b1;  PENABLE = 1'b0;  PWRITE = 1'b1;  PADDR = a;  PWDATA = d;
    @(negedge PCLK);
    PENABLE = 1'b1;
    @(negedge PCLK);
    PSEL = 1'b0;  PENABLE = 1'b0;  PWRITE = 1'b0;
end
endtask

task apb_read(input [9:0] a, output [31:0] d);
begin
    @(negedge PCLK);
    PSEL = 1'b1;  PENABLE = 1'b0;  PWRITE = 1'b0;  PADDR = a;
    @(negedge PCLK);
    PENABLE = 1'b1;
    #3 d = PRDATA;
    @(negedge PCLK);
    PSEL = 1'b0;  PENABLE = 1'b0;
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

// Read MIS and check that the five pins follow it
task check_pins_vs_mis;
    reg [31:0] d;
    reg [6:0]  m;
begin
    @(negedge PCLK);
    PSEL = 1'b1;  PENABLE = 1'b0;  PWRITE = 1'b0;  PADDR = A_MIS;
    @(negedge PCLK);
    PENABLE = 1'b1;
    #3;
    d = PRDATA;
    m = d[10:4];
    if (UARTRXINTR !== m[0] || UARTTXINTR !== m[1] || UARTRTINTR !== m[2] ||
        UARTEINTR !== (|m[6:3]) || UARTINTR !== (|m)) begin
        $display("[FAIL] %0t : pins rx/tx/rt/e/all=%b%b%b%b%b do not follow MIS=%b",
                  $time, UARTRXINTR, UARTTXINTR, UARTRTINTR, UARTEINTR, UARTINTR, m);
        err_cnt = err_cnt + 1;
    end
    @(negedge PCLK);
    PSEL = 1'b0;  PENABLE = 1'b0;
end
endtask

task expect_pins(input e_rx, input e_tx, input e_rt, input e_e, input e_all);
begin
    if (UARTRXINTR !== e_rx || UARTTXINTR !== e_tx || UARTRTINTR !== e_rt ||
        UARTEINTR !== e_e || UARTINTR !== e_all) begin
        $display("[FAIL] %0t : pins rx/tx/rt/e/all = %b%b%b%b%b (exp %b%b%b%b%b)", $time,
                  UARTRXINTR, UARTTXINTR, UARTRTINTR, UARTEINTR, UARTINTR,
                  e_rx, e_tx, e_rt, e_e, e_all);
        err_cnt = err_cnt + 1;
    end
end
endtask

//------------------------------------------------------------------------------
// Helpers built on the APB master
//------------------------------------------------------------------------------
// program the baud divisor
task set_baud(input integer v);
begin
    IBRD_V = v;
    BITC   = 16 * v;
    apb_write(A_IBRD, v);
end
endtask

// program UARTLCR_H (the decoder is told too)
task set_lcr(input p_en, input p_eps, input brk);
begin
    apb_write(A_LCRH, {29'b0, p_eps, p_en, brk});
    ext_pen = p_en;
    ext_eps = p_eps;
end
endtask

// wait until UARTFR.BUSY = 0
task wait_tx_done;
    integer t;
    reg [31:0] d;
begin
    t = 0;
    d = 32'h8;
    while (d[3] && t < 400 * BITC) begin
        apb_read(A_FR, d);
        t = t + 3;
    end
    if (d[3]) begin
        $display("[FAIL] %0t : transmitter stays busy", $time);
        err_cnt = err_cnt + 1;
    end
end
endtask

// wait until the RX FIFO has data (UARTFR.RXFE = 0)
task wait_rx;
    integer t;
    reg [31:0] d;
begin
    t = 0;
    d = 32'h10;
    while (d[4] && t < 40 * BITC) begin
        apb_read(A_FR, d);
        t = t + 3;
    end
    if (d[4]) begin
        $display("[FAIL] %0t : nothing was received", $time);
        err_cnt = err_cnt + 1;
    end
end
endtask

// read UARTDR : received value is {BE, PE, FE, DATA}
task read_dr_expect(input [10:0] e);
    reg [31:0] d;
begin
    apb_read(A_DR, d);
    if (d !== {21'b0, e}) begin
        $display("[FAIL] %0t : UARTDR = %h (exp %h)", $time, d, e);
        err_cnt = err_cnt + 1;
    end
end
endtask

// send n bytes (base + index) in loopback / TX mode : check the pin and, if
// rx_too = 1, the data that comes back through UARTDR
task send_burst(input integer n, input [7:0] base, input p_en, input p_eps, input rx_too);
    integer m;
begin
    for (m = 0; m < n; m = m + 1) apb_write(A_DR, base + m[7:0]);
    wait_tx_done;
    for (m = 0; m < n; m = m + 1) expect_tx_frame(base + m[7:0], p_en, p_eps);
    if (rx_too) begin
        for (m = 0; m < n; m = m + 1) read_dr_expect({3'b000, base + m[7:0]});
    end
end
endtask

task flush_rx;
    reg [31:0] d;
    integer m;
begin
    m = 0;
    apb_read(A_FR, d);
    while (!d[4] && m < 40) begin
        apb_read(A_DR, d);
        apb_read(A_FR, d);
        m = m + 1;
    end
end
endtask

task apply_reset;
begin
    @(negedge PCLK);
    PSEL = 1'b0;  PENABLE = 1'b0;  PWRITE = 1'b0;
    PRESETn = 1'b0;
    repeat (4) @(negedge PCLK);
    PRESETn = 1'b1;
    repeat (2) @(negedge PCLK);
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

// RT timing reference : push into the RX FIFO and rising edge of UARTRTINTR
integer t_push, t_rt;
always @(posedge PCLK) if (uut.w_rx_push) t_push = cyc;
always @(posedge UARTRTINTR)               t_rt   = cyc;

//------------------------------------------------------------------------------
// Main sequence
//------------------------------------------------------------------------------
integer t0, t1, width;
integer rtd;
reg [7:0]  r_d;
reg        r_pen, r_eps;
integer    r_n;

initial begin
    err_cnt = 0;
    seed    = 32'h7E57_0001;
    IBRD_V  = 217;  BITC = 16 * 217;
    t_push  = 0;  t_rt = 0;
    PRESETn = 1'b1;
    PSEL = 1'b0;  PENABLE = 1'b0;  PWRITE = 1'b0;  PADDR = 10'd0;  PWDATA = 32'd0;
    rxd_drv = 1'b1;
    #1;
    PRESETn = 1'b0;
    repeat (4) @(negedge PCLK);
    PRESETn = 1'b1;
    repeat (2) @(negedge PCLK);

    //--------------------------------------------------------------------------
    // (1) reset values, idle pins
    //--------------------------------------------------------------------------
    begin_test;
    rd_expect(A_IBRD, 32'h0000_00D9);
    rd_expect(A_LCRH, 32'h0000_0000);
    rd_expect(A_CR,   32'h0000_0300);
    rd_expect(A_IMSC, 32'h0000_0000);
    rd_expect(A_FR,   32'h0000_0090);                    // TXFE and RXFE
    rd_expect(A_RIS,  32'h0000_0020);                    // only the TX level (FIFO empty)
    rd_expect(A_MIS,  32'h0000_0000);
    rd_expect(A_DR,   32'h0000_0000);                    // empty RX FIFO reads 0
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    if (UARTTXD !== 1'b1) begin
        $display("[FAIL] UARTTXD must idle high");
        err_cnt = err_cnt + 1;
    end
    // program the working baud rate, the decoder starts to look at the pin
    set_baud(5);
    rd_expect(A_IBRD, 32'h0000_0005);
    dec_en = 1'b1;
    end_test("(1) reset values, idle pins");

    //--------------------------------------------------------------------------
    // (2) transmit : frames on UARTTXD, FR flags, exact bit time
    //--------------------------------------------------------------------------
    begin_test;
    set_lcr(1'b0, 1'b0, 1'b0);
    apb_write(A_CR, CR_ON);
    apb_write(A_DR, 32'hFFFF_FF55);                      // only the low 8 bits are sent
    apb_read(A_FR, rd);
    if (rd[3] !== 1'b1) begin                              // BUSY right after the write
        $display("[FAIL] UARTFR.BUSY = %b right after a write", rd[3]);
        err_cnt = err_cnt + 1;
    end
    wait_tx_done;
    expect_tx_frame(8'h55, 1'b0, 1'b0);
    rd_expect(A_FR, 32'h0000_0090);                      // idle again
    apb_write(A_DR, 32'h0000_00A3);  wait_tx_done;  expect_tx_frame(8'hA3, 1'b0, 1'b0);
    apb_write(A_DR, 32'h0000_00FF);  wait_tx_done;  expect_tx_frame(8'hFF, 1'b0, 1'b0);
    // exact bit time : start bit + D0 = 1 -> the low time is one bit long
    apb_write(A_DR, 32'h0000_0001);
    @(negedge UARTTXD);  t0 = $time;
    @(posedge UARTTXD);  t1 = $time;
    width = (t1 - t0) / 10;                              // in clocks
    if (width != BITC) begin
        $display("[FAIL] start bit lasts %0d clk (exp %0d = 16 x IBRD)", width, BITC);
        err_cnt = err_cnt + 1;
    end
    wait_tx_done;  expect_tx_frame(8'h01, 1'b0, 1'b0);
    // data 0 : start bit + 8 data bits are low = 9 bits
    apb_write(A_DR, 32'h0000_0000);
    @(negedge UARTTXD);  t0 = $time;
    @(posedge UARTTXD);  t1 = $time;
    width = (t1 - t0) / 10;
    if (width != 9 * BITC) begin
        $display("[FAIL] low time of data 0x00 is %0d clk (exp %0d)", width, 9 * BITC);
        err_cnt = err_cnt + 1;
    end
    wait_tx_done;  expect_tx_frame(8'h00, 1'b0, 1'b0);
    expect_no_more_tx;
    end_test("(2) transmit, FR flags, bit time");

    //--------------------------------------------------------------------------
    // (3) transmit with parity
    //--------------------------------------------------------------------------
    begin_test;
    set_lcr(1'b1, 1'b1, 1'b0);                           // even parity
    send_burst(8, 8'h01, 1'b1, 1'b1, 1'b0);
    send_burst(4, 8'hFC, 1'b1, 1'b1, 1'b0);
    set_lcr(1'b1, 1'b0, 1'b0);                           // odd parity
    send_burst(8, 8'h70, 1'b1, 1'b0, 1'b0);
    send_burst(4, 8'h00, 1'b1, 1'b0, 1'b0);
    expect_no_more_tx;
    end_test("(3) transmit, even / odd parity");

    //--------------------------------------------------------------------------
    // (4) TX FIFO : fill while the UART is disabled
    //--------------------------------------------------------------------------
    begin_test;
    set_lcr(1'b0, 1'b0, 1'b0);
    apb_write(A_CR, CR_OFF);                             // UARTEN = 0 : nothing is sent
    for (i = 0; i < FIFO_DEPTH; i = i + 1) apb_write(A_DR, 8'h10 + i[7:0]);
    rd_expect(A_FR, 32'h0000_0038);                      // TXFF + BUSY + RXFE
    rd_expect(A_RIS, 32'h0000_0000);                     // more than half full : no TX level
    apb_write(A_DR, 32'h0000_00EE);                      // FIFO full : this byte is lost
    rd_expect(A_FR, 32'h0000_0038);
    repeat (3 * BITC) @(posedge PCLK);
    if (cap_n != cap_rd) begin
        $display("[FAIL] bytes were sent although UARTEN = 0");
        err_cnt = err_cnt + 1;
        cap_rd = cap_n;
    end
    apb_write(A_CR, CR_ON);
    wait_tx_done;
    for (i = 0; i < FIFO_DEPTH; i = i + 1) expect_tx_frame(8'h10 + i[7:0], 1'b0, 1'b0);
    expect_no_more_tx;                                   // 0xEE was never sent
    rd_expect(A_FR, 32'h0000_0090);
    rd_expect(A_RIS, 32'h0000_0020);
    end_test("(4) TX FIFO fill, full flag, byte lost");

    //--------------------------------------------------------------------------
    // (5) loopback
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, CR_LBE);
    apb_write(A_DR, 32'h0000_00A5);
    wait_rx;
    read_dr_expect(11'h0A5);
    wait_tx_done;
    expect_tx_frame(8'hA5, 1'b0, 1'b0);                  // the pin shows the frame during loopback
    rd_expect(A_FR, 32'h0000_0090);
    // 16 bytes in a row : RX FIFO fills up
    for (i = 0; i < FIFO_DEPTH; i = i + 1) apb_write(A_DR, 8'h30 + i[7:0]);
    wait_tx_done;
    rd_expect(A_FR, 32'h0000_00C0);                      // TXFE + RXFF
    rd_expect(A_RIS, 32'h0000_0030);                     // TX level (bit 5) and RX level (bit 4)
    for (i = 0; i < FIFO_DEPTH; i = i + 1) expect_tx_frame(8'h30 + i[7:0], 1'b0, 1'b0);
    for (i = 0; i < FIFO_DEPTH; i = i + 1) read_dr_expect({3'b000, 8'h30 + i[7:0]});
    rd_expect(A_FR, 32'h0000_0090);
    // overrun : the RX FIFO is full, two more bytes are dropped
    for (i = 0; i < FIFO_DEPTH; i = i + 1) apb_write(A_DR, 8'h40 + i[7:0]);
    wait_tx_done;
    apb_write(A_DR, 32'h0000_0050);
    apb_write(A_DR, 32'h0000_0051);
    wait_tx_done;
    rd_expect(A_RIS, 32'h0000_0430);                     // OE + TX level + RX level
    for (i = 0; i < FIFO_DEPTH + 2; i = i + 1)
        expect_tx_frame((i < FIFO_DEPTH) ? (8'h40 + i[7:0]) : (8'h50 + i[7:0] - FIFO_DEPTH), 1'b0, 1'b0);
    for (i = 0; i < FIFO_DEPTH; i = i + 1) read_dr_expect({3'b000, 8'h40 + i[7:0]});
    rd_expect(A_FR, 32'h0000_0090);                      // the two dropped bytes are gone
    apb_write(A_ICR, 32'h0000_0400);                     // clear OE
    rd_expect(A_RIS, 32'h0000_0020);
    end_test("(5) loopback, RXFF, overrun");

    //--------------------------------------------------------------------------
    // (6) loopback with parity
    //--------------------------------------------------------------------------
    begin_test;
    set_lcr(1'b1, 1'b1, 1'b0);
    send_burst(8, 8'h5C, 1'b1, 1'b1, 1'b1);
    set_lcr(1'b1, 1'b0, 1'b0);
    send_burst(8, 8'hC1, 1'b1, 1'b0, 1'b1);
    rd_expect(A_RIS, 32'h0000_0020);                     // no PE
    set_lcr(1'b0, 1'b0, 1'b0);
    end_test("(6) loopback with parity");

    //--------------------------------------------------------------------------
    // (7) receive from UARTRXD
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, CR_ON);                              // loopback off
    set_lcr(1'b0, 1'b0, 1'b0);
    ext_frame(8'h3C, 1'b0, 1'b0, 1'b0, 1'b1, 20);
    wait_rx;  read_dr_expect(11'h03C);
    ext_frame(8'hC3, 1'b0, 1'b0, 1'b0, 1'b1, 20);
    wait_rx;  read_dr_expect(11'h0C3);
    rd_expect(A_RIS, 32'h0000_0020);
    // framing error : FE = DR[8]
    ext_frame(8'h5A, 1'b0, 1'b0, 1'b0, 1'b0, 20);
    wait_rx;  read_dr_expect(11'h15A);
    rd_expect(A_RIS, 32'h0000_0020 | 32'h0000_0080);     // FE in RIS bit 7
    apb_write(A_ICR, 32'h0000_0080);                     // ICR bit 7 = FE
    rd_expect(A_RIS, 32'h0000_0020);
    // parity error : PE = DR[9]
    set_lcr(1'b1, 1'b0, 1'b0);
    ext_frame(8'h77, 1'b1, 1'b0, 1'b1, 1'b1, 20);
    wait_rx;  read_dr_expect(11'h277);
    rd_expect(A_RIS, 32'h0000_0020 | 32'h0000_0100);     // PE in RIS bit 8
    ext_frame(8'h77, 1'b1, 1'b0, 1'b0, 1'b1, 20);       // good parity afterwards
    wait_rx;  read_dr_expect(11'h077);
    apb_write(A_ICR, 32'h0000_0100);
    rd_expect(A_RIS, 32'h0000_0020);
    // break : BE = DR[10], FE = DR[8], PE masked
    set_lcr(1'b0, 1'b0, 1'b0);
    ext_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b0, 40);
    wait_rx;  read_dr_expect(11'h500);
    rd_expect(A_RIS, 32'h0000_0020 | 32'h0000_0080 | 32'h0000_0200);   // FE + BE
    apb_write(A_ICR, 32'h0000_07C0);                     // clear all latches
    rd_expect(A_RIS, 32'h0000_0020);
    // a one-clock glitch on UARTRXD is not a character
    @(negedge PCLK);  rxd_drv = 1'b0;
    @(negedge PCLK);  rxd_drv = 1'b1;
    repeat (2 * BITC) @(negedge PCLK);
    rd_expect(A_FR, 32'h0000_0090);
    // frames with a different phase to the clock
    for (i = 0; i < 8; i = i + 1) begin
        ext_frame(8'h90 + i[7:0], 1'b0, 1'b0, 1'b0, 1'b1, 3 * i + 1);
        wait_rx;  read_dr_expect({3'b000, 8'h90 + i[7:0]});
    end
    end_test("(7) receive: good, FE, PE, break, glitch");

    //--------------------------------------------------------------------------
    // (8) UARTEN / TXE / RXE
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, 32'h0000_0201);                      // UARTEN + RXE, TXE = 0
    apb_write(A_DR, 32'h0000_0066);
    repeat (3 * BITC) @(posedge PCLK);
    if (cap_n != cap_rd) begin
        $display("[FAIL] byte was sent with TXE = 0");
        err_cnt = err_cnt + 1;
        cap_rd = cap_n;
    end
    rd_expect(A_FR, 32'h0000_0018);                      // TXFE=0, BUSY=1, RXFE=1
    apb_write(A_CR, 32'h0000_0101);                      // UARTEN + TXE, RXE = 0
    wait_tx_done;
    expect_tx_frame(8'h66, 1'b0, 1'b0);
    ext_frame(8'h12, 1'b0, 1'b0, 1'b0, 1'b1, 20);       // ignored : RXE = 0
    repeat (2 * BITC) @(posedge PCLK);
    rd_expect(A_FR, 32'h0000_0090);
    apb_write(A_CR, 32'h0000_0300);                      // UARTEN = 0 (RXE = TXE = 1)
    ext_frame(8'h34, 1'b0, 1'b0, 1'b0, 1'b1, 20);       // ignored : UARTEN = 0
    repeat (2 * BITC) @(posedge PCLK);
    rd_expect(A_FR, 32'h0000_0090);
    apb_write(A_CR, CR_ON);
    ext_frame(8'h56, 1'b0, 1'b0, 1'b0, 1'b1, 20);       // received again
    wait_rx;  read_dr_expect(11'h056);
    end_test("(8) UARTEN / TXE / RXE switches");

    //--------------------------------------------------------------------------
    // (9) break transmit
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, CR_LBE);
    set_lcr(1'b0, 1'b0, 1'b1);                           // BRK = 1
    repeat (3 * BITC) @(posedge PCLK);
    if (UARTTXD !== 1'b0) begin
        $display("[FAIL] UARTTXD must be low during break");
        err_cnt = err_cnt + 1;
    end
    rd_expect(A_FR, 32'h0000_0098);                      // TXFE + RXFE + BUSY
    wait_rx;                                             // the receiver sees one break character
    read_dr_expect(11'h500);
    repeat (15 * BITC) @(posedge PCLK);
    rd_expect(A_FR, 32'h0000_0098);                      // still one, the line is just held low
    set_lcr(1'b0, 1'b0, 1'b0);
    repeat (2 * BITC) @(posedge PCLK);
    if (UARTTXD !== 1'b1) begin
        $display("[FAIL] UARTTXD must be high after the break");
        err_cnt = err_cnt + 1;
    end
    rd_expect(A_FR, 32'h0000_0090);
    apb_write(A_ICR, 32'h0000_07C0);
    cap_rd = cap_n;                                      // the break frame is not a data frame
    end_test("(9) break transmit and receive");

    //--------------------------------------------------------------------------
    // (10) baud rates
    //--------------------------------------------------------------------------
    begin_test;
    for (i = 0; i < 5; i = i + 1) begin
        case (i)
            0: set_baud(1);
            1: set_baud(2);
            2: set_baud(3);
            3: set_baud(9);
            default: set_baud(33);
        endcase
        apb_write(A_CR, CR_LBE);
        send_burst(6, 8'hD0 + i[7:0], 1'b0, 1'b0, 1'b1);
        apb_write(A_DR, 32'h0000_0001);                   // exact bit time
        @(negedge UARTTXD);  t0 = $time;
        @(posedge UARTTXD);  t1 = $time;
        width = (t1 - t0) / 10;
        if (width != BITC) begin
            $display("[FAIL] IBRD=%0d : start bit lasts %0d clk (exp %0d)", IBRD_V, width, BITC);
            err_cnt = err_cnt + 1;
        end
        wait_tx_done;  expect_tx_frame(8'h01, 1'b0, 1'b0);
        read_dr_expect(11'h001);
        // external frames at this baud rate
        apb_write(A_CR, CR_ON);
        ext_frame(8'hB7, 1'b0, 1'b0, 1'b0, 1'b1, 5);
        wait_rx;  read_dr_expect(11'h0B7);
    end
    set_baud(5);
    end_test("(10) baud rates IBRD = 1 2 3 9 33");

    //--------------------------------------------------------------------------
    // (11) interrupts
    //--------------------------------------------------------------------------
    begin_test;
    // --- TX interrupt : level, count <= half ---
    apb_write(A_CR, CR_OFF);                             // keep the bytes in the FIFO
    apb_write(A_IMSC, M_TX);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b0, 1'b1);           // empty FIFO : TX interrupt
    for (i = 0; i < FIFO_DEPTH / 2; i = i + 1) apb_write(A_DR, 8'h60 + i[7:0]);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b0, 1'b1);           // half full : still on
    check_pins_vs_mis;
    apb_write(A_DR, 32'h0000_0068);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);           // more than half : off
    check_pins_vs_mis;
    apb_write(A_CR, CR_ON);
    repeat (2 * BITC) @(posedge PCLK);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b0, 1'b1);           // draining : on again
    wait_tx_done;
    for (i = 0; i < FIFO_DEPTH / 2 + 1; i = i + 1) expect_tx_frame(8'h60 + i[7:0], 1'b0, 1'b0);
    apb_write(A_IMSC, 32'h0);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);           // masked off
    rd_expect(A_RIS, 32'h0000_0020);                     // RIS still shows TX

    // --- RX interrupt : level, count >= half ---
    apb_write(A_CR, CR_LBE);
    apb_write(A_IMSC, M_RX);
    for (i = 0; i < FIFO_DEPTH / 2 - 1; i = i + 1) apb_write(A_DR, 8'h70 + i[7:0]);
    wait_tx_done;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);           // 7 bytes : off
    apb_write(A_DR, 32'h0000_0077);
    wait_tx_done;
    expect_pins(1'b1, 1'b0, 1'b0, 1'b0, 1'b1);           // 8 bytes : on
    check_pins_vs_mis;
    read_dr_expect(11'h070);
    repeat (2) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);           // back to 7 : off
    for (i = 1; i < FIFO_DEPTH / 2; i = i + 1) read_dr_expect({3'b000, 8'h70 + i[7:0]});
    for (i = 0; i < FIFO_DEPTH / 2; i = i + 1) expect_tx_frame(8'h70 + i[7:0], 1'b0, 1'b0);
    apb_write(A_IMSC, 32'h0);

    // --- RT interrupt : 512 ticks after the last character ---
    apb_write(A_IMSC, M_RT);
    apb_write(A_DR, 32'h0000_0099);
    wait_rx;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    wait_tx_done;
    expect_tx_frame(8'h99, 1'b0, 1'b0);
    while (UARTRTINTR !== 1'b1 && cyc < t_push + 2 * 512 * IBRD_V) @(posedge PCLK);
    #1;
    rtd = t_rt - t_push;
    if (UARTRTINTR !== 1'b1 || rtd < 512 * IBRD_V - 2 || rtd > 512 * IBRD_V + 2 * IBRD_V + 6) begin
        $display("[FAIL] RT interrupt after %0d clk (exp about %0d = 512 x IBRD)", rtd, 512 * IBRD_V);
        err_cnt = err_cnt + 1;
    end
    expect_pins(1'b0, 1'b0, 1'b1, 1'b0, 1'b1);
    check_pins_vs_mis;
    apb_write(A_ICR, 32'h0000_0040);                     // clear RT
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    repeat (1200 * IBRD_V) @(posedge PCLK);              // not set again without a new character
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    read_dr_expect(11'h099);                             // reading the character empties the FIFO
    // a new character, RT is set again, reading it clears RT
    apb_write(A_DR, 32'h0000_009A);
    wait_rx;  wait_tx_done;  expect_tx_frame(8'h9A, 1'b0, 1'b0);
    repeat (520 * IBRD_V) @(posedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b1, 1'b0, 1'b1);
    read_dr_expect(11'h09A);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);           // FIFO empty clears RT
    apb_write(A_IMSC, 32'h0);

    // --- error interrupts and the combined pin ---
    apb_write(A_CR, CR_ON);
    apb_write(A_IMSC, M_ERR);
    ext_frame(8'h2B, 1'b0, 1'b0, 1'b0, 1'b0, 20);       // framing error
    wait_rx;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);
    check_pins_vs_mis;
    apb_write(A_IMSC, M_RX);                             // error masked : pins off, RIS still shows FE
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    rd_expect(A_RIS, 32'h0000_0020 | 32'h0000_0080);
    apb_write(A_IMSC, M_ERR | M_TX);                     // combined pin : TX + error
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b1, 1'b1);
    check_pins_vs_mis;
    apb_write(A_ICR, 32'h0000_0080);                     // clear FE
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b1, 1'b0, 1'b0, 1'b1);           // only TX is left
    apb_write(A_IMSC, M_ERR);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    flush_rx;
    // PE and BE each give the error pin
    set_lcr(1'b1, 1'b1, 1'b0);
    ext_frame(8'h6D, 1'b1, 1'b1, 1'b1, 1'b1, 20);       // parity error
    wait_rx;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);
    apb_write(A_ICR, 32'h0000_0100);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    set_lcr(1'b0, 1'b0, 1'b0);
    flush_rx;
    ext_frame(8'h00, 1'b0, 1'b0, 1'b0, 1'b0, 40);       // break
    wait_rx;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);
    apb_write(A_ICR, 32'h0000_0200);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);           // FE of the break frame is still set
    apb_write(A_ICR, 32'h0000_0080);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    flush_rx;
    // overrun gives the error pin
    apb_write(A_CR, CR_LBE);
    for (i = 0; i < FIFO_DEPTH; i = i + 1) apb_write(A_DR, 8'hA0 + i[7:0]);
    wait_tx_done;
    apb_write(A_DR, 32'h0000_00BB);
    wait_tx_done;
    expect_pins(1'b0, 1'b0, 1'b0, 1'b1, 1'b1);
    apb_write(A_ICR, 32'h0000_0400);
    repeat (3) @(negedge PCLK);
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    for (i = 0; i < FIFO_DEPTH + 1; i = i + 1)
        expect_tx_frame((i < FIFO_DEPTH) ? (8'hA0 + i[7:0]) : 8'hBB, 1'b0, 1'b0);
    flush_rx;
    apb_write(A_IMSC, 32'h0);
    apb_write(A_ICR, 32'h0000_07C0);
    end_test("(11) interrupts TX RX RT error combined");

    //--------------------------------------------------------------------------
    // (12) random loopback traffic
    //--------------------------------------------------------------------------
    begin_test;
    apb_write(A_CR, CR_LBE);
    for (i = 0; i < 40; i = i + 1) begin
        r_pen = $random(seed);
        r_eps = $random(seed);
        r_n   = 1 + ({$random(seed)} % 12);
        r_d   = $random(seed);
        set_lcr(r_pen, r_eps, 1'b0);
        send_burst(r_n, r_d, r_pen, r_eps, 1'b1);
        repeat ({$random(seed)} % 50) @(posedge PCLK);
    end
    rd_expect(A_FR, 32'h0000_0090);
    rd_expect(A_RIS, 32'h0000_0020);
    expect_no_more_tx;
    end_test("(12) random loopback traffic");

    //--------------------------------------------------------------------------
    // (13) asynchronous reset in the middle of a frame
    //--------------------------------------------------------------------------
    begin_test;
    set_lcr(1'b0, 1'b0, 1'b0);
    apb_write(A_IMSC, M_ALL);
    apb_write(A_DR, 32'h0000_00F1);
    apb_write(A_DR, 32'h0000_00F2);
    repeat (3 * BITC) @(posedge PCLK);                   // the frame is running
    dec_en = 1'b0;                                       // the cut frame is not a data frame
    #1 PRESETn = 1'b0;                                   // no clock edge needed
    #2;
    if (UARTTXD !== 1'b1) begin
        $display("[FAIL] UARTTXD must go high at once with the reset");
        err_cnt = err_cnt + 1;
    end
    expect_pins(1'b0, 1'b0, 1'b0, 1'b0, 1'b0);
    repeat (3) @(negedge PCLK);
    PRESETn = 1'b1;
    repeat (2) @(negedge PCLK);
    rd_expect(A_IBRD, 32'h0000_00D9);                    // registers are back to their reset values
    rd_expect(A_CR,   32'h0000_0300);
    rd_expect(A_IMSC, 32'h0000_0000);
    rd_expect(A_FR,   32'h0000_0090);                    // FIFOs are empty, not busy
    repeat (3 * BITC) @(posedge PCLK);
    if (UARTTXD !== 1'b1) begin
        $display("[FAIL] UARTTXD is not idle after the reset");
        err_cnt = err_cnt + 1;
    end
    end_test("(13) asynchronous reset in a frame");

    //--------------------------------------------------------------------------
    if (err_cnt == 0) $display("=== tb_uart_ex_top : ALL PASS ===");
    else              $display("=== tb_uart_ex_top : FAIL (%0d errors) ===", err_cnt);
    $finish;
end

//------------------------------------------------------------------------------
// Waveform dump + watchdog
//------------------------------------------------------------------------------
initial begin
    $dumpfile("./DUMP/tb_uart_ex_top.vcd");
    $dumpvars(0, tb_uart_ex_top);
end

initial begin
    #20000000;
    $display("[FAIL] timeout");
    $finish;
end

endmodule
