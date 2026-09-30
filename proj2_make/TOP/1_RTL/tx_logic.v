`timescale 1ns / 1ps

module tx_logic (
				clk				,
				nRst			,
				i_tick_16x		,
				i_tx_en			,
				i_brk			,
				i_fifo_empty	,
				i_pen			,
				i_fifo_rdata	,
				i_eps			,
				o_fifo_pop		,
				o_txd			,
				o_tx_busy
);

	input				clk				;
	input				nRst			;
	input				i_tick_16x		;
	input				i_tx_en			;
	input				i_brk			;
	input				i_fifo_empty	;
	input				i_pen			;
	input		[7:0]	i_fifo_rdata	;
	input				i_eps			;
	output				o_fifo_pop		;
	output				o_txd			;
	output				o_tx_busy		;

	localparam	[2:0]	IDLE	= 3'b000;
	localparam	[2:0]	START	= 3'b001;
	localparam	[2:0]	DATA	= 3'b010;
	localparam	[2:0]	PARITY	= 3'b011;
	localparam	[2:0]	STOP	= 3'b100;
	localparam	[2:0]	BREAK	= 3'b101;

	wire				w_can_start		;
	wire				w_bit_end		;
	wire				w_load			;
	reg 		[3:0]	r_tick_cnt		;
	reg			[2:0]	r_state			;
	reg			[2:0]	r_bit_cnt		;
	reg			[7:0]	r_shift			;
	reg					o_txd			;

	assign	w_can_start	= i_tx_en && !i_fifo_empty && !i_brk	; // new charactor start
	assign	w_bit_end	= i_tick_16x && (r_tick_cnt == 4'd15)	; // 
	assign	w_load		= ((r_state == IDLE) && i_tick_16x && w_can_start) || ((r_state == STOP) && w_bit_end && w_can_start);

always @(posedge clk or negedge nRst) begin
	if (!nRst)
		r_state <= IDLE					;
	else begin
		case (r_state)
			IDLE	: if(w_load) r_state <= START						; 
			START	: if(w_bit_end) r_state <= DATA						;
			DATA	: if(w_bit_end&&(r_bit_cnt==3'd7)) r_state <= STOP	;
			STOP	: if(w_load) r_state <= START						;
					  else if (w_bit_end) r_state <= IDLE				;
			default	: r_state <= IDLE									;

		endcase
	end
end

always @(posedge clk or negedge nRst) begin
	if (!nRst)
		r_tick_cnt <= 4'd0				;
	else if (w_bit_end)
		r_tick_cnt <= 4'd0				;
	else if (i_tick_16x && (r_state != IDLE))
		r_tick_cnt <= r_tick_cnt + 1	;
end

always @(posedge clk or negedge nRst) begin
	if (!nRst)
		r_bit_cnt	<= 3'd0				;
	else if ((r_state == DATA) && w_bit_end)
		r_bit_cnt	<= r_bit_cnt + 1	;
end

always @(posedge clk or negedge nRst) begin
	if (!nRst)
		r_shift <= 8'd0					;
	else if (w_load)
		r_shift <= i_fifo_rdata			;
	else if ((r_state == DATA) && w_bit_end)
		r_shift <= r_shift >> 1			;
end

always @(*) begin
	case (r_state)
		IDLE	: o_txd = 1				;
		START	: o_txd = 0				;
		DATA	: o_txd = r_shift[0]	;
		STOP	: o_txd = 1				;
		PARITY	: o_txd = 1				;
		BREAK	: o_txd = 1				;
		default : o_txd = 1				;
	endcase
end

assign	o_fifo_pop	= w_load						;
assign	o_tx_busy	= (r_state != IDLE)	;

endmodule
