module uart_ex_top #(
    parameter       FIFO_DEPTH  = 16                    ,
    parameter       CNT_W       = $clog2(FIFO_DEPTH)+1 
)(                  PCLK                                ,
                    PRESETn                             ,
                    PSEL                                ,
                    PENABLE                             ,
                    PWRITE                              ,
                    PADDR                               ,
                    PWDATA                              ,
                    PRDATA                              ,
                    PREADY                              ,
                    PSLVERR                             ,
                    UARTRXD                             ,
                    UARTTXD                             ,
                    UARTRXINTR                          ,
                    UARTTXINTR                          ,
                    UARTRTINTR                          ,
                    UARTEINTR                           ,
                    UARTINTR                            
);

input               PCLK                                ;
input               PRESETn                             ;
input               PSEL                                ;
input               PENABLE                             ;
input               PWRITE                              ;
input   [11:2]      PADDR                               ;
input   [31:0]      PWDATA                              ;
output  [31:0]      PRDATA                              ;
output              PREADY                              ;
output              PSLVERR                             ;
input               UARTRXD                             ;
output              UARTTXD                             ;
output              UARTRXINTR                          ;
output              UARTTXINTR                          ;
output              UARTRTINTR                          ;
output              UARTEINTR                           ;
output              UARTINTR                            ;

reg                 r_rxd_s1                            ;
reg                 r_rxd_s2                            ;

wire                w_rxd                               ;
wire                w_txd                               ;
wire                w_lbe                               ;
wire    [15:0]      w_ibrd                              ;
wire                w_tick                              ;
wire                w_tx_push                           ;
wire                w_tx_pop                            ;
wire    [7:0]       w_tx_wdata                          ;
wire    [7:0]       w_tx_rdata                          ;
wire                w_tx_empty                          ;
wire                w_tx_full                           ;
wire    [CNT_W-1:0] w_tx_count                          ;
wire                w_rx_push                           ;
wire                w_rx_pop                            ;
wire    [10:0]      w_rx_wdata                          ;
wire    [10:0]      w_rx_rdata                          ;
wire                w_rx_empty                          ;
wire                w_rx_full                           ;
wire    [CNT_W-1:0] w_rx_count                          ;
wire                w_tx_en                             ;
wire                w_brk                               ;
wire                w_pen                               ;
wire                w_eps                               ;
wire                w_tx_busy                           ;

always @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn)   begin
        r_rxd_s1    <=  1'b1            ;
        r_rxd_s2    <=  1'b1            ;
    end
    else    begin
        r_rxd_s1    <=  UARTRXD         ;
        r_rxd_s2    <=  r_rxd_s1        ;
    end
end

assign  w_rxd   = w_lbe ? w_txd : r_rxd_s2  ; 

baud_gen    uut1    (
                .clk        (PCLK       )   ,
                .nRst       (PRESETn    )   ,
                .i_ibrd     (w_ibrd     )   ,
                .o_tick_16x (w_tick     )
);

tx_fifo     #(
                .FIFO_DEPTH (FIFO_DEPTH )   
)           uut2
(               .clk	    (PCLK       )	,
				.nRst		(PRESETn    )	,
				.i_push		(w_tx_push  )	,
				.i_pop		(w_tx_pop   )	,
				.i_wdata	(w_tx_wdata )	,
				.o_rdata	(w_tx_rdata )	,
				.o_empty	(w_tx_empty )	,
				.o_full		(w_tx_full  )	,
				.o_count    (w_tx_count )   
);

rx_fifo     #(
                .FIFO_DEPTH (FIFO_DEPTH )
)           uut3
(               .clk        (PCLK       )   ,
                .nRst       (PRESETn    )   , 
                .i_push     (w_rx_push  )   ,
                .i_pop      (w_rx_pop   )   ,
                .i_wdata    (w_rx_wdata )   ,
                .o_rdata    (w_rx_rdata )   ,
                .o_empty    (w_rx_empty )   ,
                .o_full     (w_rx_full  )   ,
                .o_count    (w_rx_count )
);

tx_logic    uut4    (
                .clk        (PCLK       )	,
				nRst		(PRESETn    )   ,
				i_tick_16x	(w_tick     )   ,
				i_tx_en		(w_tx_en    )   ,
				i_brk		(w_brk      )   ,
				i_fifo_empty(w_tx_empty )   ,
				i_pen		(w_pen      )   ,
				i_fifo_rdata(w_tx_rdata )   ,
				i_eps		(w_eps      )   ,
				o_fifo_pop	(w_tx_pop   )   ,
				o_txd		(w_txd      )   ,
				o_tx_busy   (w_tx_busy  )
);

endmodule