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
output      [10:0]      o_fifo_wdata    ;
output                  o_overrun       ;

localparam  [2:0]       IDLE    = 3'b000;
localparam  [2:0]       START   = 3'b001;
localparam  [2:0]       DATA    = 3'b010;
localparam  [2:0]       PARITY  = 3'b011;
localparam  [2:0]       STOP    = 3'b100;

reg                     r_rxd_d         ;
wire                    w_start_edge    ;
reg         [3:0]       r_tick_cnt      ;
wire                    w_half          ;
wire                    w_bit_end       ;
reg         [2:0]       r_bit_cnt       ;
wire                    w_last_bit      ;
reg         [2:0]       r_state         ;
wire                    w_shift_en      ;
wire                    w_par_end       ;
wire                    w_stop_end      ;
wire                    w_fe            ;
wire                    w_exp_par       ;
reg         [7:0]       r_shift         ;
wire                    w_pe_raw        ;
reg                     r_pbit          ;
wire                    w_be            ;
wire                    w_pe            ;

always @(posedge clk or negedge nRst) begin
    if  (!nRst)
        r_rxd_d <= 1'b1                 ;
    else
        r_rxd_d <= i_rxd                ;
end

assign  w_start_edge    = r_rxd_d && (!i_rxd)                   ;
assign  w_half          = i_tick_16x && (r_tick_cnt == 4'd7)    ;
assign  w_bit_end       = i_tick_16x && (r_tick_cnt == 4'd15)   ;
assign  w_last_bit      = (r_bit_cnt == 3'd7)                   ;
assign  w_shift_en      = (r_state == DATA) && (w_bit_end)      ;
assign  w_par_end       = (r_state == PARITY) && (w_bit_end)    ;
assign  w_stop_end      = (r_state == STOP) && (w_bit_end)      ;
assign  w_fe            = (r_state == STOP) && (!i_rxd)         ;
assign  w_exp_par       = i_eps ? (^r_shift) : !(^r_shift)      ; 
assign  w_pe_raw        = (i_pen) && (w_exp_par != r_pbit)      ;
assign  w_be            = (w_fe) && (r_shift == 8'h00) && (!i_pen || !r_pbit);
assign  w_pe            = (w_pe_raw) && (!w_be)                 ;

always @(posedge clk or negedge nRst) begin
    if (!nRst)
        r_tick_cnt  <= 4'd0             ;
    else if ((r_state == START)&&w_half)
        r_tick_cnt  <= 4'd0             ;
    else if (w_shift_en||w_stop_end||((r_state == PARITY)&&(w_bit_end)))
        r_tick_cnt  <= 4'd0             ;
    else if ((r_state == START)&&(!w_half)&&(i_tick_16x))
        r_tick_cnt  <= r_tick_cnt + 1   ;
    else if (((r_state == DATA)||(r_state == PARITY)||(r_state == STOP))&&(i_tick_16x))
        r_tick_cnt  <= r_tick_cnt + 1   ;
    else if (r_state == IDLE)
        r_tick_cnt  <= r_tick_cnt       ;
end

alwyas @(posedge clk or negedge nRst) begin
    if (!nRst)
        r_state <= IDLE
    else begin
        case (r_state)
            IDLE    :   if (w_start_edge)   r_state <= 
            START   :
            DATA    :
            STOP    :
            PARITY  :
            
        endcase
    end
end

endmodule