`timescale 1ns / 1ps

module rx_logic (
            clk             ,
            nRst            ,
            i_rxd           ,
            i_tick_16x      ,
            i_rx_en         ,
            i_pen           ,
            i_eps           ,
            i_fifo_full     ,
            o_fifo_push     ,
            o_fifo_wdata    ,
            o_overrun   
);

input                   clk             ;
input                   nRst            ;
input                   i_rxd           ;
input                   i_tick_16x      ;
input                   i_rx_en         ;
input                   i_pen           ;
input                   i_eps           ;
input                   i_fifo_full     ;
output                  o_fifo_push     ;
output      [11:0]      o_fifo_wdata    ;
output                  o_overrun       ;

localparam  [2:0]       IDLE    = 3'b000;
localparam  [2:0]       START   = 3'b001;
localparam  [2:0]       DATA    = 3'b010;
localparam  [2:0]       PARITY  = 3'b011;
localparam  [2:0]       STOP    = 3'b100;



endmodule