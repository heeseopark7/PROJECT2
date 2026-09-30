`timescale 1ns / 1ps

module tx_fifo #(
	parameter DATA_WIDTH = 8			,
	parameter FIFO_DEPTH = 16			,
	parameter PTR_W      = $clog2(FIFO_DEPTH)	, // 4
	parameter CNT_W      = PTR_W+1		  	  // 5
)(
				clk			,
				nRst			,
				i_push			,
				i_pop			,
				i_wdata			,
				o_rdata			,
				o_empty			,
				o_full			,
				o_count
);

	input			clk			;
	input			nRst			;
	input			i_push			;
	input			i_pop			;
	input	[DATA_WIDTH-1:0]i_wdata			;
	output	[DATA_WIDTH-1:0]o_rdata			;
	output			o_empty			;
	output			o_full			;
	output	[CNT_W-1:0]	o_count			;

	wire			w_do_push		;
	wire			w_do_pop		;
	reg	[CNT_W-1:0]	r_count			;
	reg	[PTR_W-1:0]	r_wptr			;
	reg	[PTR_W-1:0]	r_rptr			;
	reg	[DATA_WIDTH-1:0]r_mem	[0:FIFO_DEPTH-1];

assign w_do_push	= i_push && !(o_full)		;
assign w_do_pop	= i_pop  && !(o_empty)			;

always @(posedge clk or negedge nRst)begin
	if (!nRst)
		r_count <= {CNT_W{1'b0}}		;
	else if (w_do_push&&!w_do_pop)
		r_count <= r_count + 1			;
	else if (!w_do_push&&w_do_pop)
		r_count <= r_count - 1			;	
end

assign o_empty = (r_count == {CNT_W{1'b0}})		;
assign o_full  = (r_count == FIFO_DEPTH)		;
assign o_count = r_count				;

always @(posedge clk or negedge nRst)begin
	if(!nRst)
		r_wptr <= {PTR_W{1'b0}}			;
	else if	(w_do_push)
		r_wptr <= r_wptr + 1			;
end

always @(posedge clk or negedge nRst)begin
	if(!nRst)
		r_rptr <= {PTR_W{1'b0}}			;
	else if (w_do_pop)
		r_rptr <= r_rptr +1			;
end

always @(posedge clk)begin
	if(w_do_push)
		r_mem[r_wptr] <= i_wdata		;

end

assign o_rdata = r_mem[r_rptr]				;

endmodule

