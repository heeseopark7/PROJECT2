`timescale 1ns / 1ps

module interrupt_logic #(
parameter           FIFO_DEPTH  = 16    ,
parameter           CNT_W       = $clog2(FIFO_DEPTH)+1  
)(
                    clk                 ,
                    nRst                ,
                    i_tx_count          ,
                    i_rx_count          ,
                    i_rx_empty          ,
                    i_rx_push           ,
                    i_rx_err            ,
                    i_overrun           ,
                    i_tick_16x          ,
                    i_imsc              ,   
                    i_icr               ,
                    o_ris               ,
                    o_mis               ,
                    o_rxintr            ,
                    o_txintr            ,
                    o_rtintr            ,
                    o_eintr             ,
                    o_intr
);

input                   clk             ;
input                   nRst            ;
input   [CNT_W-1:0]     i_tx_count      ;
input   [CNT_W-1:0]     i_rx_count      ;
input                   i_rx_empty      ;
input                   i_rx_push       ;
input   [2:0]           i_rx_err        ;
input                   i_overrun       ;
input                   i_tick_16x      ;
input   [6:0]           i_imsc          ;
input   [6:0]           i_icr           ;
output  [6:0]           o_ris           ;
output  [6:0]           o_mis           ;
output                  o_rxintr        ;
output                  o_txintr        ;
output                  o_rtintr        ;
output                  o_eintr         ;
output                  o_intr          ;

wire                    w_rx_lvl        ;
wire                    w_tx_lvl        ;
wire                    w_fe_set        ;
wire                    w_pe_set        ;
wire                    w_be_set        ;
wire                    w_oe_set        ;

assign  w_rx_lvl    = (i_rx_count >= FIFO_DEPTH/2)  ;
assign  w_tx_lvl    = (i_tx_count <= FIFO_DEPTH/2)  ;
assign  w_fe_set    = i_rx_push && i_rx_err[0]      ;
assign  w_pe_set    = i_rx_push && i_rx_err[1]      ;
assign  w_be_set    = i_rx_push && i_rx_err[2]      ;
assign  w_oe_set    = i_overrun                     ;

endmodule