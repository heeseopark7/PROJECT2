`timescale 1ns / 1ps

module rx_fifo #(
        parameter   FIFO_DEPTH =    16      
)(
                    clk             ,
                    nRst            , 
                    i_push          ,
                    i_pop           ,
                    i_wdata         ,
                    o_rdata         ,
                    o_empty         ,
                    o_full          ,
                    o_count         
);

input               clk             ;
input               nRst            ;
input               i_push          ;
input               i_pop           ;
input       [10:0]  i_wdata         ;
output      [10:0]  o_rdata         ;
output              o_empty         ;
output              o_full          ;
output      [4:0]   o_count         ;

localparam          DATA_WIDTH  =   11                      ;
localparam          CNT_W       =   $clog2(FIFO_DEPTH) + 1  ;

endmodule