set_clock_latency -source -early -max  0.2 [get_clocks {MAIN_CLOCK}]
set_clock_latency -source -late -max  0.2 [get_clocks {MAIN_CLOCK}]
set_clock_latency -source -early -min   0.2 [get_ports {PCLK}] -clock MAIN_CLOCK 
set_clock_latency -source -late -min   0.2 [get_ports {PCLK}] -clock MAIN_CLOCK 
