`timescale 1ns / 1ps

module tx_logic (
				clk		,
				nRst		,
				i_tick_16x	,
				i_tx_en		,
				i_brk		,
				i_fifo_empty	,
				i_pen		,
				i_fifo_rdata	,
				i_eps		,
				o_fifo_pop	,
				o_txd		,
				o_tx_busy
);

	input			clk		;
	input			nRst		;
	input			i_tick_16x	;
	input			i_tx_en		;
	input			i_brk		;
	input			i_fifo_empty	;
	input			i_pen		;
	input		[7:0]	i_fifo_rdata	;
	input			i_eps		;
	output			o_fifo_pop	;
	output			o_txd		;
	output			o_tx_busy	;

	localparam	[2:0]	IDLE	= 3'b000;
	localparam	[2:0]	START	= 3'b001;
	localparam	[2:0]	DATA	= 3'b010;
	localparam	[2:0]	PARITY	= 3'b011;
	localparam	[2:0]	STOP	= 3'b100;
	localparam	[2:0]	BREAK	= 3'b101;

	wire			w_can_start	;
	wire			w_bit_end	;

	assign	w_can_start	= i_tx_en && !i_fifo_empty && !i_brk	;
	assign	w_bit_end	= i_tick_16x && (r_tick_cnt == 4'd15)	;
	assign	w_load		= 	

endmodule
