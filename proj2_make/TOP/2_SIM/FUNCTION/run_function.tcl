xrun -64bit \
     +max_err_count+50 \
     +define+function_sim \
     -access +rwc \
     -profile \
     -profthread \
     -gui \
     +libext+.v \
     ../TESTBENCH/tb_uart_top.v \
     ../../RTL/uart_top.v \
     ../../RTL/baud_gen.v \
     ../../RTL/uart_tx.v \
     ../../RTL/uart_rx.v \
     ../../RTL/cmd_decoder.v \
     /GPDK045/digital/giolib045_v3.5/vlog/pads_FF_s1vg.v \
     /GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
     -l func_sim.log
