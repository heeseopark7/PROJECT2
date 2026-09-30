`timescale 1ns / 1ps

module tx_fifo #(
	parameter DATA_WIDTH = 8		,
	parameter FIFO_DEPTH = 16		,
	parameter PTR_W      = $clog2(FIFO_DEPTH),
	parameter CNT_W      = PTR_W+1
)(
				clk		,
				nRst		,
				i_push		,
				i_pop		,
				i_wdata		,
				o_rdata		,
				o_empty		,
				o_full		,
				o_count
);

	input			clk		;
	input			nRst		;
	input			i_push		;
	input			i_pop		;
	input	[DATA_WIDTH-1:0]i_wdata		;
	output	[DATA_WIDTH-1:0]o_rdata		;
	output			o_empty		;
	output			o_full		;
	output	[CNT_W-1:0]	o_count		;

	wire			do_push		;
	wire			do_pop		;
	reg	[CNT_W-1:0]	r_count		;

assign do_push	= i_push && !(o_full)		;
assign do_pop	= i_pop  && !(o_empty)		;

always @(posedge clk or negedge nRst)begin
	if (!nRst)
		r_count <= {CNT_W{1'b0}}	;
	else if (do_push&&!do_pop)
		r_count <= r_count + 1		;
	else if (!do_push&&do_pop)
		r_count <= r_count - 1		;	
end

assign o_empty = (r_count == {CNT_W{1'b0}})	;
assign o_full  = (r_count == FIFO_DEPTH)	;
assign o_count = r_count			;

endmodule

