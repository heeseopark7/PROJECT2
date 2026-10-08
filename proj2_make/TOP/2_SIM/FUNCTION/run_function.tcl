xrun -64bit \
     +max_err_count+50 \
     +define+function_sim \
     -access +rwc \
     -profile \
     -profthread \
     -gui \
     +libext+.v \
     ../TESTBENCH/tb_tx_fifo.v \
     ../../1_RTL/uart_ex_top.v \
     ../../1_RTL/baud_gen.v \
     ../../1_RTL/interrupt_logic.v \
     ../../1_RTL/reg_block.v \
     ../../1_RTL/rx_fifo.v \
     ../../1_RTL/rx_logic.v \
     ../../1_RTL/tx_fifo.v \
     ../../1_RTL/tx_logic.v \
     /GPDK045/digital/giolib045_v3.5/vlog/pads_FF_s1vg.v \
     /GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
     -l func_sim.log
