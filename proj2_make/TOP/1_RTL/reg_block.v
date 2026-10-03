`timescale 1ns / 1ps

module reg_block (
                        clk             ,
                        nRst            ,
                        i_psel          ,
                        i_penable       ,
                        i_pwrite        ,
                        i_paddr         ,
                        i_pwdata        ,
                        i_tx_full       ,
                        i_tx_empty      ,
                        i_rx_rdata      ,
                        i_rx_empty      ,
                        i_rx_full       ,
                        i_tx_busy       ,
                        i_ris           ,
                        i_mis           ,
                        o_prdata        ,
                        o_pready        ,
                        o_pslverr       ,
                        o_tx_push       ,
                        o_tx_wdata      ,
                        o_rx_pop        ,
                        o_tx_en         ,
                        o_brk           ,
                        o_rx_en         ,
                        o_pen           ,
                        o_eps           ,
                        o_ibrd          ,
                        o_lbe           ,
                        o_imsc          ,
                        o_icr
);
input                   clk             ;
input                   nRst            ;
input                   i_psel          ;
input                   i_penable       ;
input                   i_pwrite        ;
input       [9:0]       i_paddr         ;
input       [31:0]      i_pwdata        ;
input                   i_tx_full       ;
input                   i_tx_empty      ;
input       [10:0]      i_rx_rdata      ;
input                   i_rx_empty      ;
input                   i_rx_full       ;
input                   i_tx_busy       ;
input       [6:0]       i_ris           ;
input       [6:0]       i_mis           ;
output      [31:0]      o_prdata        ;
output                  o_pready        ;
output                  o_pslverr       ;
output                  o_tx_push       ;
output      [7:0]       o_tx_wdata      ;
output                  o_rx_pop        ;
output                  o_tx_en         ;
output                  o_brk           ;
output                  o_rx_en         ;
output                  o_pen           ;
output                  o_eps           ;
output      [15:0]      o_ibrd          ;
output                  o_lbe           ;
output      [6:0]       o_imsc          ;
output      [6:0]       o_icr           ;

localparam  [9:0]       UARTDR      = 10'd0     ;
localparam  [9:0]       UARTFR      = 10'd6     ;
localparam  [9:0]       UARTIBRD    = 10'd9     ;
localparam  [9:0]       UARTLCR_H   = 10'd11    ;
localparam  [9:0]       UARTCR      = 10'd12    ;
localparam  [9:0]       UARTIMSC    = 10'd14    ;
localparam  [9:0]       UARTRIS     = 10'd15    ;
localparam  [9:0]       UARTMIS     = 10'd16    ;
localparam  [9:0]       UARTICR     = 10'd17    ;    

wire                    w_wr_en         ;
wire                    w_rd_en         ;
wire                    w_sel_dr        ;
wire                    w_sel_fr        ;
wire                    w_sel_ibrd      ;
wire                    w_sel_lcr_h     ;
wire                    w_sel_cr        ;
wire                    w_sel_imsc      ;
wire                    w_sel_ris       ;
wire                    w_sel_mis       ;
wire                    w_sel_icr       ;
wire                    w_busy          ;
wire        [31:0]      w_fr            ;
wire        [31:0]      w_dr_rdata      ;
wire        [31:0]      w_rdata         ;

assign  w_wr_en     = i_psel && i_penable && i_pwrite       ;
assign  w_rd_en     = i_psel && i_penable && (!i_pwrite)    ;
assign  w_sel_dr    = (UARTDR == i_paddr)                   ;
assign  w_sel_fr    = (UARTFR == i_paddr)                   ;
assign  w_sel_ibrd  = (UARTIBRD == i_paddr)                 ;
assign  w_sel_lcr_h = (UARTLCR_H == i_paddr)                ;
assign  w_sel_cr    = (UARTCR == i_paddr)                   ;
assign  w_sel_imsc  = (UARTIMSC == i_paddr)                 ;
assign  w_sel_ris   = (UARTRIS == i_paddr)                  ;
assign  w_sel_mis   = (UARTMIS == i_paddr)                  ;
assign  w_sel_icr   = (UARTICR == i_paddr)                  ;
assign  w_busy      = (!i_tx_empty) || i_tx_busy            ;
assign  w_fr        = {24'b0, i_tx_empty, i_rx_full, i_tx_full, i_rx_empty, w_busy, 3'b0};
assign  w_dr_rdata  = i_rx_empty ? 32'b0 : {21'b0, i_rx_rdata}  ;
assign  w_rdata     = w_sel_dr  ?   w_dr_rdata  :   
                      w_sel_fr  ?   w_fr        :   
                      w_sel_ibrd?   {16'b0,r_ibrd}  :   32'b0   ;   

reg         [15:0]      r_ibrd                              ;
reg                     r_eps                               ;
reg                     r_pen                               ;
reg                     r_brk                               ;
reg                     r_rxe                               ;
reg                     r_txe                               ;
reg                     r_lbe                               ;
reg                     r_uarten                            ;
reg         [6:0]       r_imsc                              ;
always @(posedge clk or negedge nRst) begin
    if (!nRst)
        r_ibrd  <= 16'hD9               ;
    else if (w_wr_en && w_sel_ibrd)
        r_ibrd  <= i_pwdata[15:0]       ;
end

always @(posedge clk or negedge nRst) begin
    if(!nRst) begin
        r_eps   <= 1'b0                 ;
        r_pen   <= 1'b0                 ;
        r_brk   <= 1'b0                 ;
    end
    else if (w_wr_en && w_sel_lcr_h) begin
        r_eps   <= i_pwdata[2]          ;
        r_pen   <= i_pwdata[1]          ;
        r_brk   <= i_pwdata[0]          ;
    end
end

always @(posedge clk or negedge nRst) begin
    if (!nRst) begin    
        r_rxe       <= 1'b1             ;
        r_txe       <= 1'b1             ;
        r_lbe       <= 1'b0             ;
        r_uarten    <= 1'b0             ;
    end
    else if (w_wr_en && w_sel_cr) begin
        r_rxe       <= i_pwdata[9]      ;
        r_txe       <= i_pwdata[8]      ;
        r_lbe       <= i_pwdata[7]      ;
        r_uarten    <= i_pwdata[0]      ;
    end
end

always @(posedge clk or negedge nRst) begin
    if (!nRst)
        r_imsc      <= 7'd0             ;
    else if (w_wr_en && w_sel_imsc)
        r_imsc      <= i_pwdata[10:4]   ;
end

assign  o_ibrd      = r_ibrd            ;
assign  o_pen       = r_pen             ;
assign  o_eps       = r_eps             ;
assign  o_brk       = r_brk             ;
assign  o_lbe       = r_lbe             ;
assign  o_imsc      = r_imsc            ;
assign  o_pready    = 1'b1              ;
assign  o_pslverr   = 1'b0              ;
assign  o_tx_en     = r_uarten && r_txe ;
assign  o_rx_en     = r_uarten && r_rxe ;
assign  o_tx_push   = w_wr_en && w_sel_dr   ;
assign  o_tx_wdata  = i_pwdata[7:0]     ;
assign  o_rx_pop    = w_rd_en && w_sel_dr   ;

endmodule