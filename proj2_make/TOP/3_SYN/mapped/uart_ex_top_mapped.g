######################################################################

# Created by Genus(TM) Synthesis Solution 22.17-s071_1 on Thu Oct 15 20:43:42 KST 2026

# This file contains the Genus script for design:uart_ex_top

######################################################################

set_db -quiet init_lib_search_path {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing ../../../../SoC/GPDK045/digital/giolib045_v3.5/timing ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../../SoC/GPDK045/digital/giolib045_v3.5/lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx}
set_db -quiet operating_conditions_min PVT_1P1V_0C
set_db -quiet operating_conditions_min_library library:default_emulate_libset_max/fast_vdd1v0
set_db -quiet operating_conditions_library_given true
set_db -quiet design_mode_process 60.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_route_early_global false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet db_units 2000
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 19 0.0 17.699921} {to_generic 10 29 10 28} {first_condense 11 41 13 43} {PBS_Generic_Opt-Post 23 42 23.188824999999998 40.888746} {{PBS_Generic-Postgen HBO Optimizations} 0 42 0.0 40.888746} {PBS_TechMap-Start 0 45 0.0 42.824566} {{PBS_TechMap-Premap HBO Optimizations} 0 45 0.0 42.824566} {second_condense 11 56 13 59} {reify 10 66 14 74} {global_incr_map 3 69 3 77} {{PBS_Techmap-Global Mapping} 24 69 23.476588999999997 66.301155} {{PBS_TechMap-Datapath Postmap Operations} 2 71 3.0 69.301155} {{PBS_TechMap-Postmap HBO Optimizations} 0 71 -0.025993999999997186 69.275161} {{PBS_TechMap-Postmap Clock Gating} 1 72 0.0 69.275161} {{PBS_TechMap-Postmap Cleanup} 1 73 1.8942929999999762 71.16945399999997} {PBS_Techmap-Post_MBCI 0 73 0.0 71.16945399999997} {incr_opt 34 110 35 119} }
set_db -quiet timing_adjust_tns_of_complex_flops false
set_db -quiet hdl_array_naming_style %s_%d
set_db -quiet tinfo_tstamp_file .rs_hah013.tstamp
set_db -quiet metric_enable true
set_db -quiet auto_ungroup none
set_db -quiet max_cpus_per_server 2
set_db -quiet syn_generic_effort high
set_db -quiet use_area_from_lef true
set_db -quiet uniquify_naming_style uart_ex_top_%s_%d
set_db -quiet optimize_merge_flops false
set_db -quiet optimize_merge_latches false
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet layer_aware_buffer true
set_db -quiet ple_mode global
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet operating_conditions operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C
set_db -quiet wireload_selection none
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name MAIN_CLOCK -domain domain_1 -period 800.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design design:uart_ex_top port:uart_ex_top/PCLK
set_db -quiet clock:uart_ex_top/MAIN_CLOCK .slew {100.0 100.0 100.0 100.0}
set_db -quiet clock:uart_ex_top/MAIN_CLOCK .clock_network_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:uart_ex_top/MAIN_CLOCK .clock_source_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:uart_ex_top/MAIN_CLOCK .clock_setup_uncertainty {100.0 100.0}
define_cost_group -design design:uart_ex_top -name MAIN_CLOCK
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del port:uart_ex_top/PRESETn
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_1_1 port:uart_ex_top/PSEL
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_2_1 port:uart_ex_top/PENABLE
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_3_1 port:uart_ex_top/PWRITE
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_4_1 {{port:uart_ex_top/PADDR[11]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_5_1 {{port:uart_ex_top/PADDR[10]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_6_1 {{port:uart_ex_top/PADDR[9]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_7_1 {{port:uart_ex_top/PADDR[8]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_8_1 {{port:uart_ex_top/PADDR[7]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_9_1 {{port:uart_ex_top/PADDR[6]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_10_1 {{port:uart_ex_top/PADDR[5]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_11_1 {{port:uart_ex_top/PADDR[4]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_12_1 {{port:uart_ex_top/PADDR[3]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_13_1 {{port:uart_ex_top/PADDR[2]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_14_1 {{port:uart_ex_top/PWDATA[31]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_15_1 {{port:uart_ex_top/PWDATA[30]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_16_1 {{port:uart_ex_top/PWDATA[29]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_17_1 {{port:uart_ex_top/PWDATA[28]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_18_1 {{port:uart_ex_top/PWDATA[27]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_19_1 {{port:uart_ex_top/PWDATA[26]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_20_1 {{port:uart_ex_top/PWDATA[25]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_21_1 {{port:uart_ex_top/PWDATA[24]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_22_1 {{port:uart_ex_top/PWDATA[23]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_23_1 {{port:uart_ex_top/PWDATA[22]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_24_1 {{port:uart_ex_top/PWDATA[21]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_25_1 {{port:uart_ex_top/PWDATA[20]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_26_1 {{port:uart_ex_top/PWDATA[19]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_27_1 {{port:uart_ex_top/PWDATA[18]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_28_1 {{port:uart_ex_top/PWDATA[17]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_29_1 {{port:uart_ex_top/PWDATA[16]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_30_1 {{port:uart_ex_top/PWDATA[15]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_31_1 {{port:uart_ex_top/PWDATA[14]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_32_1 {{port:uart_ex_top/PWDATA[13]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_33_1 {{port:uart_ex_top/PWDATA[12]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_34_1 {{port:uart_ex_top/PWDATA[11]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_35_1 {{port:uart_ex_top/PWDATA[10]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_36_1 {{port:uart_ex_top/PWDATA[9]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_37_1 {{port:uart_ex_top/PWDATA[8]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_38_1 {{port:uart_ex_top/PWDATA[7]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_39_1 {{port:uart_ex_top/PWDATA[6]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_40_1 {{port:uart_ex_top/PWDATA[5]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_41_1 {{port:uart_ex_top/PWDATA[4]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_42_1 {{port:uart_ex_top/PWDATA[3]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_43_1 {{port:uart_ex_top/PWDATA[2]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_44_1 {{port:uart_ex_top/PWDATA[1]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_45_1 {{port:uart_ex_top/PWDATA[0]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_46_1 port:uart_ex_top/UARTRXD
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_47_1 port:uart_ex_top/PRESETn
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_48_1 port:uart_ex_top/PSEL
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_49_1 port:uart_ex_top/PENABLE
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_50_1 port:uart_ex_top/PWRITE
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_51_1 {{port:uart_ex_top/PADDR[11]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_52_1 {{port:uart_ex_top/PADDR[10]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_53_1 {{port:uart_ex_top/PADDR[9]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_54_1 {{port:uart_ex_top/PADDR[8]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_55_1 {{port:uart_ex_top/PADDR[7]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_56_1 {{port:uart_ex_top/PADDR[6]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_57_1 {{port:uart_ex_top/PADDR[5]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_58_1 {{port:uart_ex_top/PADDR[4]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_59_1 {{port:uart_ex_top/PADDR[3]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_60_1 {{port:uart_ex_top/PADDR[2]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_61_1 {{port:uart_ex_top/PWDATA[31]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_62_1 {{port:uart_ex_top/PWDATA[30]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_63_1 {{port:uart_ex_top/PWDATA[29]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_64_1 {{port:uart_ex_top/PWDATA[28]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_65_1 {{port:uart_ex_top/PWDATA[27]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_66_1 {{port:uart_ex_top/PWDATA[26]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_67_1 {{port:uart_ex_top/PWDATA[25]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_68_1 {{port:uart_ex_top/PWDATA[24]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_69_1 {{port:uart_ex_top/PWDATA[23]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_70_1 {{port:uart_ex_top/PWDATA[22]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_71_1 {{port:uart_ex_top/PWDATA[21]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_72_1 {{port:uart_ex_top/PWDATA[20]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_73_1 {{port:uart_ex_top/PWDATA[19]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_74_1 {{port:uart_ex_top/PWDATA[18]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_75_1 {{port:uart_ex_top/PWDATA[17]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_76_1 {{port:uart_ex_top/PWDATA[16]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_77_1 {{port:uart_ex_top/PWDATA[15]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_78_1 {{port:uart_ex_top/PWDATA[14]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_79_1 {{port:uart_ex_top/PWDATA[13]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_80_1 {{port:uart_ex_top/PWDATA[12]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_81_1 {{port:uart_ex_top/PWDATA[11]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_82_1 {{port:uart_ex_top/PWDATA[10]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_83_1 {{port:uart_ex_top/PWDATA[9]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_84_1 {{port:uart_ex_top/PWDATA[8]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_85_1 {{port:uart_ex_top/PWDATA[7]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_86_1 {{port:uart_ex_top/PWDATA[6]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_87_1 {{port:uart_ex_top/PWDATA[5]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_88_1 {{port:uart_ex_top/PWDATA[4]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_89_1 {{port:uart_ex_top/PWDATA[3]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_90_1 {{port:uart_ex_top/PWDATA[2]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_91_1 {{port:uart_ex_top/PWDATA[1]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_92_1 {{port:uart_ex_top/PWDATA[0]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name in_del_93_1 port:uart_ex_top/UARTRXD
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del {{port:uart_ex_top/PRDATA[31]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_93_1 {{port:uart_ex_top/PRDATA[30]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_94_1 {{port:uart_ex_top/PRDATA[29]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_95_1 {{port:uart_ex_top/PRDATA[28]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_96_1 {{port:uart_ex_top/PRDATA[27]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_97_1 {{port:uart_ex_top/PRDATA[26]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_98_1 {{port:uart_ex_top/PRDATA[25]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_99_1 {{port:uart_ex_top/PRDATA[24]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_100_1 {{port:uart_ex_top/PRDATA[23]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_101_1 {{port:uart_ex_top/PRDATA[22]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_102_1 {{port:uart_ex_top/PRDATA[21]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_103_1 {{port:uart_ex_top/PRDATA[20]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_104_1 {{port:uart_ex_top/PRDATA[19]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_105_1 {{port:uart_ex_top/PRDATA[18]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_106_1 {{port:uart_ex_top/PRDATA[17]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_107_1 {{port:uart_ex_top/PRDATA[16]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_108_1 {{port:uart_ex_top/PRDATA[15]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_109_1 {{port:uart_ex_top/PRDATA[14]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_110_1 {{port:uart_ex_top/PRDATA[13]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_111_1 {{port:uart_ex_top/PRDATA[12]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_112_1 {{port:uart_ex_top/PRDATA[11]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_113_1 {{port:uart_ex_top/PRDATA[10]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_114_1 {{port:uart_ex_top/PRDATA[9]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_115_1 {{port:uart_ex_top/PRDATA[8]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_116_1 {{port:uart_ex_top/PRDATA[7]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_117_1 {{port:uart_ex_top/PRDATA[6]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_118_1 {{port:uart_ex_top/PRDATA[5]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_119_1 {{port:uart_ex_top/PRDATA[4]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_120_1 {{port:uart_ex_top/PRDATA[3]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_121_1 {{port:uart_ex_top/PRDATA[2]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_122_1 {{port:uart_ex_top/PRDATA[1]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_123_1 {{port:uart_ex_top/PRDATA[0]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_124_1 port:uart_ex_top/PREADY
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_125_1 port:uart_ex_top/PSLVERR
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_126_1 port:uart_ex_top/UARTTXD
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_127_1 port:uart_ex_top/UARTRXINTR
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_128_1 port:uart_ex_top/UARTTXINTR
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_129_1 port:uart_ex_top/UARTRTINTR
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_130_1 port:uart_ex_top/UARTEINTR
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_131_1 port:uart_ex_top/UARTINTR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_132_1 {{port:uart_ex_top/PRDATA[31]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_133_1 {{port:uart_ex_top/PRDATA[30]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_134_1 {{port:uart_ex_top/PRDATA[29]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_135_1 {{port:uart_ex_top/PRDATA[28]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_136_1 {{port:uart_ex_top/PRDATA[27]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_137_1 {{port:uart_ex_top/PRDATA[26]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_138_1 {{port:uart_ex_top/PRDATA[25]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_139_1 {{port:uart_ex_top/PRDATA[24]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_140_1 {{port:uart_ex_top/PRDATA[23]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_141_1 {{port:uart_ex_top/PRDATA[22]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_142_1 {{port:uart_ex_top/PRDATA[21]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_143_1 {{port:uart_ex_top/PRDATA[20]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_144_1 {{port:uart_ex_top/PRDATA[19]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_145_1 {{port:uart_ex_top/PRDATA[18]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_146_1 {{port:uart_ex_top/PRDATA[17]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_147_1 {{port:uart_ex_top/PRDATA[16]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_148_1 {{port:uart_ex_top/PRDATA[15]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_149_1 {{port:uart_ex_top/PRDATA[14]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_150_1 {{port:uart_ex_top/PRDATA[13]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_151_1 {{port:uart_ex_top/PRDATA[12]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_152_1 {{port:uart_ex_top/PRDATA[11]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_153_1 {{port:uart_ex_top/PRDATA[10]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_154_1 {{port:uart_ex_top/PRDATA[9]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_155_1 {{port:uart_ex_top/PRDATA[8]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_156_1 {{port:uart_ex_top/PRDATA[7]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_157_1 {{port:uart_ex_top/PRDATA[6]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_158_1 {{port:uart_ex_top/PRDATA[5]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_159_1 {{port:uart_ex_top/PRDATA[4]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_160_1 {{port:uart_ex_top/PRDATA[3]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_161_1 {{port:uart_ex_top/PRDATA[2]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_162_1 {{port:uart_ex_top/PRDATA[1]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_163_1 {{port:uart_ex_top/PRDATA[0]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_164_1 port:uart_ex_top/PREADY
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_165_1 port:uart_ex_top/PSLVERR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_166_1 port:uart_ex_top/UARTTXD
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_167_1 port:uart_ex_top/UARTRXINTR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_168_1 port:uart_ex_top/UARTTXINTR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_169_1 port:uart_ex_top/UARTRTINTR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_170_1 port:uart_ex_top/UARTEINTR
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_ex_top/MAIN_CLOCK -name ou_del_171_1 port:uart_ex_top/UARTINTR
path_group -paths [specify_paths -lenient -to clock:uart_ex_top/MAIN_CLOCK]  -name MAIN_CLOCK -group cost_group:uart_ex_top/MAIN_CLOCK -user_priority -1047552
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
# END DFT SECTION
set_db -quiet design:uart_ex_top .seq_reason_deleted_internal {}
set_db -quiet design:uart_ex_top .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 1278196} {cell_count 2500} {utilization  0.00} {runtime 10 29 10 28} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 1276888} {cell_count 2786} {utilization  0.00} {runtime 11 41 13 43} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 1276877} {cell_count 2776} {utilization  0.00} {runtime 11 56 13 59} }{reify {wns -2968} {tns 427167} {vep 387} {area 1273635} {cell_count 1799} {utilization  0.00} {runtime 10 66 14 74} }{global_incr_map {wns -2958} {tns 442062} {vep 426} {area 1272896} {cell_count 1647} {utilization  0.00} {runtime 3 69 3 77} }{incr_opt {wns -2949} {tns 420502} {vep 206} {area 1272980} {cell_count 1620} {utilization  0.00} {runtime 34 110 35 119} }}
set_db -quiet design:uart_ex_top .seq_mbci_coverage 0.0
set_db -quiet design:uart_ex_top .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/uart_ex_top.v ../1_RTL/interrupt_logic.v ../1_RTL/reg_block.v ../1_RTL/rx_fifo.v ../1_RTL/rx_logic.v ../1_RTL/tx_fifo.v ../1_RTL/tx_logic.v ../1_RTL/baud_gen.v} {../1_RTL} {}}}
set_db -quiet design:uart_ex_top .verification_directory fv/uart_ex_top
set_db -quiet port:uart_ex_top/PCLK .is_ideal_network true
set_db -quiet port:uart_ex_top/PCLK .original_name PCLK
set_db -quiet port:uart_ex_top/PCLK .ideal_network true
set_db -quiet port:uart_ex_top/PRESETn .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PRESETn .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PRESETn .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PRESETn .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PRESETn .is_ideal_network true
set_db -quiet port:uart_ex_top/PRESETn .original_name PRESETn
set_db -quiet port:uart_ex_top/PRESETn .ideal_network true
set_db -quiet port:uart_ex_top/PSEL .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PSEL .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PSEL .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PSEL .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PSEL .original_name PSEL
set_db -quiet port:uart_ex_top/PENABLE .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PENABLE .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PENABLE .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PENABLE .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PENABLE .original_name PENABLE
set_db -quiet port:uart_ex_top/PWRITE .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PWRITE .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PWRITE .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PWRITE .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/PWRITE .original_name PWRITE
set_db -quiet {port:uart_ex_top/PADDR[11]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[11]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[11]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[11]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[11]} .original_name {PADDR[11]}
set_db -quiet {port:uart_ex_top/PADDR[10]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[10]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[10]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[10]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[10]} .original_name {PADDR[10]}
set_db -quiet {port:uart_ex_top/PADDR[9]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[9]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[9]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[9]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[9]} .original_name {PADDR[9]}
set_db -quiet {port:uart_ex_top/PADDR[8]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[8]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[8]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[8]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[8]} .original_name {PADDR[8]}
set_db -quiet {port:uart_ex_top/PADDR[7]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[7]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[7]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[7]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[7]} .original_name {PADDR[7]}
set_db -quiet {port:uart_ex_top/PADDR[6]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[6]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[6]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[6]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[6]} .original_name {PADDR[6]}
set_db -quiet {port:uart_ex_top/PADDR[5]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[5]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[5]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[5]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[5]} .original_name {PADDR[5]}
set_db -quiet {port:uart_ex_top/PADDR[4]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[4]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[4]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[4]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[4]} .original_name {PADDR[4]}
set_db -quiet {port:uart_ex_top/PADDR[3]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[3]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[3]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[3]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[3]} .original_name {PADDR[3]}
set_db -quiet {port:uart_ex_top/PADDR[2]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[2]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[2]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[2]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PADDR[2]} .original_name {PADDR[2]}
set_db -quiet {port:uart_ex_top/PWDATA[31]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[31]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[31]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[31]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[31]} .original_name {PWDATA[31]}
set_db -quiet {port:uart_ex_top/PWDATA[30]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[30]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[30]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[30]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[30]} .original_name {PWDATA[30]}
set_db -quiet {port:uart_ex_top/PWDATA[29]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[29]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[29]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[29]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[29]} .original_name {PWDATA[29]}
set_db -quiet {port:uart_ex_top/PWDATA[28]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[28]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[28]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[28]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[28]} .original_name {PWDATA[28]}
set_db -quiet {port:uart_ex_top/PWDATA[27]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[27]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[27]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[27]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[27]} .original_name {PWDATA[27]}
set_db -quiet {port:uart_ex_top/PWDATA[26]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[26]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[26]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[26]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[26]} .original_name {PWDATA[26]}
set_db -quiet {port:uart_ex_top/PWDATA[25]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[25]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[25]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[25]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[25]} .original_name {PWDATA[25]}
set_db -quiet {port:uart_ex_top/PWDATA[24]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[24]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[24]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[24]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[24]} .original_name {PWDATA[24]}
set_db -quiet {port:uart_ex_top/PWDATA[23]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[23]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[23]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[23]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[23]} .original_name {PWDATA[23]}
set_db -quiet {port:uart_ex_top/PWDATA[22]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[22]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[22]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[22]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[22]} .original_name {PWDATA[22]}
set_db -quiet {port:uart_ex_top/PWDATA[21]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[21]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[21]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[21]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[21]} .original_name {PWDATA[21]}
set_db -quiet {port:uart_ex_top/PWDATA[20]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[20]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[20]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[20]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[20]} .original_name {PWDATA[20]}
set_db -quiet {port:uart_ex_top/PWDATA[19]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[19]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[19]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[19]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[19]} .original_name {PWDATA[19]}
set_db -quiet {port:uart_ex_top/PWDATA[18]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[18]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[18]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[18]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[18]} .original_name {PWDATA[18]}
set_db -quiet {port:uart_ex_top/PWDATA[17]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[17]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[17]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[17]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[17]} .original_name {PWDATA[17]}
set_db -quiet {port:uart_ex_top/PWDATA[16]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[16]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[16]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[16]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[16]} .original_name {PWDATA[16]}
set_db -quiet {port:uart_ex_top/PWDATA[15]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[15]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[15]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[15]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[15]} .original_name {PWDATA[15]}
set_db -quiet {port:uart_ex_top/PWDATA[14]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[14]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[14]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[14]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[14]} .original_name {PWDATA[14]}
set_db -quiet {port:uart_ex_top/PWDATA[13]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[13]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[13]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[13]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[13]} .original_name {PWDATA[13]}
set_db -quiet {port:uart_ex_top/PWDATA[12]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[12]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[12]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[12]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[12]} .original_name {PWDATA[12]}
set_db -quiet {port:uart_ex_top/PWDATA[11]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[11]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[11]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[11]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[11]} .original_name {PWDATA[11]}
set_db -quiet {port:uart_ex_top/PWDATA[10]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[10]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[10]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[10]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[10]} .original_name {PWDATA[10]}
set_db -quiet {port:uart_ex_top/PWDATA[9]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[9]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[9]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[9]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[9]} .original_name {PWDATA[9]}
set_db -quiet {port:uart_ex_top/PWDATA[8]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[8]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[8]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[8]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[8]} .original_name {PWDATA[8]}
set_db -quiet {port:uart_ex_top/PWDATA[7]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[7]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[7]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[7]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[7]} .original_name {PWDATA[7]}
set_db -quiet {port:uart_ex_top/PWDATA[6]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[6]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[6]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[6]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[6]} .original_name {PWDATA[6]}
set_db -quiet {port:uart_ex_top/PWDATA[5]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[5]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[5]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[5]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[5]} .original_name {PWDATA[5]}
set_db -quiet {port:uart_ex_top/PWDATA[4]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[4]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[4]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[4]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[4]} .original_name {PWDATA[4]}
set_db -quiet {port:uart_ex_top/PWDATA[3]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[3]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[3]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[3]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[3]} .original_name {PWDATA[3]}
set_db -quiet {port:uart_ex_top/PWDATA[2]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[2]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[2]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[2]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[2]} .original_name {PWDATA[2]}
set_db -quiet {port:uart_ex_top/PWDATA[1]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[1]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[1]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[1]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[1]} .original_name {PWDATA[1]}
set_db -quiet {port:uart_ex_top/PWDATA[0]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[0]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[0]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[0]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:uart_ex_top/PWDATA[0]} .original_name {PWDATA[0]}
set_db -quiet port:uart_ex_top/UARTRXD .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/UARTRXD .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/UARTRXD .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/UARTRXD .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_ex_top/UARTRXD .original_name UARTRXD
set_db -quiet {port:uart_ex_top/PRDATA[31]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[31]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[31]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[31]} .original_name {PRDATA[31]}
set_db -quiet {port:uart_ex_top/PRDATA[31]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[30]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[30]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[30]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[30]} .original_name {PRDATA[30]}
set_db -quiet {port:uart_ex_top/PRDATA[30]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[29]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[29]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[29]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[29]} .original_name {PRDATA[29]}
set_db -quiet {port:uart_ex_top/PRDATA[29]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[28]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[28]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[28]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[28]} .original_name {PRDATA[28]}
set_db -quiet {port:uart_ex_top/PRDATA[28]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[27]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[27]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[27]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[27]} .original_name {PRDATA[27]}
set_db -quiet {port:uart_ex_top/PRDATA[27]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[26]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[26]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[26]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[26]} .original_name {PRDATA[26]}
set_db -quiet {port:uart_ex_top/PRDATA[26]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[25]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[25]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[25]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[25]} .original_name {PRDATA[25]}
set_db -quiet {port:uart_ex_top/PRDATA[25]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[24]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[24]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[24]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[24]} .original_name {PRDATA[24]}
set_db -quiet {port:uart_ex_top/PRDATA[24]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[23]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[23]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[23]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[23]} .original_name {PRDATA[23]}
set_db -quiet {port:uart_ex_top/PRDATA[23]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[22]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[22]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[22]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[22]} .original_name {PRDATA[22]}
set_db -quiet {port:uart_ex_top/PRDATA[22]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[21]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[21]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[21]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[21]} .original_name {PRDATA[21]}
set_db -quiet {port:uart_ex_top/PRDATA[21]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[20]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[20]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[20]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[20]} .original_name {PRDATA[20]}
set_db -quiet {port:uart_ex_top/PRDATA[20]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[19]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[19]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[19]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[19]} .original_name {PRDATA[19]}
set_db -quiet {port:uart_ex_top/PRDATA[19]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[18]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[18]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[18]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[18]} .original_name {PRDATA[18]}
set_db -quiet {port:uart_ex_top/PRDATA[18]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[17]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[17]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[17]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[17]} .original_name {PRDATA[17]}
set_db -quiet {port:uart_ex_top/PRDATA[17]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[16]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[16]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[16]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[16]} .original_name {PRDATA[16]}
set_db -quiet {port:uart_ex_top/PRDATA[16]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[15]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[15]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[15]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[15]} .original_name {PRDATA[15]}
set_db -quiet {port:uart_ex_top/PRDATA[15]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[14]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[14]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[14]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[14]} .original_name {PRDATA[14]}
set_db -quiet {port:uart_ex_top/PRDATA[14]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[13]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[13]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[13]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[13]} .original_name {PRDATA[13]}
set_db -quiet {port:uart_ex_top/PRDATA[13]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[12]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[12]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[12]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[12]} .original_name {PRDATA[12]}
set_db -quiet {port:uart_ex_top/PRDATA[12]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[11]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[11]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[11]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[11]} .original_name {PRDATA[11]}
set_db -quiet {port:uart_ex_top/PRDATA[11]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[10]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[10]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[10]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[10]} .original_name {PRDATA[10]}
set_db -quiet {port:uart_ex_top/PRDATA[10]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[9]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[9]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[9]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[9]} .original_name {PRDATA[9]}
set_db -quiet {port:uart_ex_top/PRDATA[9]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[8]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[8]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[8]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[8]} .original_name {PRDATA[8]}
set_db -quiet {port:uart_ex_top/PRDATA[8]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[7]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[7]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[7]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[7]} .original_name {PRDATA[7]}
set_db -quiet {port:uart_ex_top/PRDATA[7]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[6]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[6]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[6]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[6]} .original_name {PRDATA[6]}
set_db -quiet {port:uart_ex_top/PRDATA[6]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[5]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[5]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[5]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[5]} .original_name {PRDATA[5]}
set_db -quiet {port:uart_ex_top/PRDATA[5]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[4]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[4]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[4]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[4]} .original_name {PRDATA[4]}
set_db -quiet {port:uart_ex_top/PRDATA[4]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[3]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[3]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[3]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[3]} .original_name {PRDATA[3]}
set_db -quiet {port:uart_ex_top/PRDATA[3]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[2]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[2]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[2]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[2]} .original_name {PRDATA[2]}
set_db -quiet {port:uart_ex_top/PRDATA[2]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[1]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[1]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[1]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[1]} .original_name {PRDATA[1]}
set_db -quiet {port:uart_ex_top/PRDATA[1]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[0]} .external_pin_cap_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[0]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:uart_ex_top/PRDATA[0]} .external_capacitance_min 3.0
set_db -quiet {port:uart_ex_top/PRDATA[0]} .original_name {PRDATA[0]}
set_db -quiet {port:uart_ex_top/PRDATA[0]} .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/PREADY .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/PREADY .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/PREADY .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/PREADY .original_name PREADY
set_db -quiet port:uart_ex_top/PREADY .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/PSLVERR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/PSLVERR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/PSLVERR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/PSLVERR .original_name PSLVERR
set_db -quiet port:uart_ex_top/PSLVERR .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTTXD .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTTXD .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTTXD .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTTXD .original_name UARTTXD
set_db -quiet port:uart_ex_top/UARTTXD .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTRXINTR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTRXINTR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTRXINTR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTRXINTR .original_name UARTRXINTR
set_db -quiet port:uart_ex_top/UARTRXINTR .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTTXINTR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTTXINTR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTTXINTR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTTXINTR .original_name UARTTXINTR
set_db -quiet port:uart_ex_top/UARTTXINTR .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTRTINTR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTRTINTR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTRTINTR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTRTINTR .original_name UARTRTINTR
set_db -quiet port:uart_ex_top/UARTRTINTR .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTEINTR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTEINTR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTEINTR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTEINTR .original_name UARTEINTR
set_db -quiet port:uart_ex_top/UARTEINTR .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTINTR .external_pin_cap_min 3.0
set_db -quiet port:uart_ex_top/UARTINTR .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_ex_top/UARTINTR .external_capacitance_min 3.0
set_db -quiet port:uart_ex_top/UARTINTR .original_name UARTINTR
set_db -quiet port:uart_ex_top/UARTINTR .external_pin_cap {3.0 3.0}
set_db -quiet inst:uart_ex_top/ipad1 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad1 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad1 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad1 .preserve true
set_db -quiet inst:uart_ex_top/ipad2 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad2 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad2 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad2 .preserve true
set_db -quiet inst:uart_ex_top/ipad3 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad3 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad3 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad3 .preserve true
set_db -quiet inst:uart_ex_top/ipad4 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad4 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad4 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad4 .preserve true
set_db -quiet inst:uart_ex_top/ipad5 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad5 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad5 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad5 .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[2]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[2]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[2]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[2]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[3]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[3]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[3]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[3]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[4]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[4]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[4]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[4]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[5]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[5]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[5]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[5]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[6]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[6]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[6]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[6]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[7]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[7]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[7]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[7]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[8]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[8]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[8]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[8]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[9]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[9]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[9]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[9]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[10]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[10]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[10]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[10]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad6[11]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad6[11]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad6[11]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad6[11]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[0]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[0]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[0]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[0]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[1]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[1]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[1]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[1]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[2]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[2]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[2]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[2]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[3]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[3]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[3]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[3]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[4]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[4]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[4]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[4]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[5]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[5]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[5]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[5]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[6]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[6]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[6]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[6]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[7]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[7]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[7]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[7]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[8]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[8]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[8]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[8]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[9]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[9]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[9]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[9]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[10]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[10]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[10]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[10]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[11]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[11]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[11]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[11]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[12]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[12]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[12]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[12]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[13]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[13]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[13]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[13]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[14]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[14]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[14]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[14]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[15]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[15]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[15]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[15]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[16]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[16]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[16]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[16]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[17]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[17]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[17]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[17]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[18]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[18]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[18]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[18]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[19]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[19]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[19]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[19]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[20]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[20]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[20]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[20]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[21]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[21]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[21]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[21]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[22]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[22]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[22]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[22]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[23]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[23]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[23]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[23]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[24]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[24]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[24]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[24]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[25]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[25]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[25]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[25]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[26]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[26]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[26]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[26]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[27]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[27]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[27]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[27]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[28]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[28]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[28]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[28]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[29]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[29]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[29]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[29]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[30]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[30]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[30]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[30]} .preserve true
set_db -quiet {inst:uart_ex_top/ipad7[31]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/ipad7[31]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/ipad7[31]} .dont_touch true
set_db -quiet {inst:uart_ex_top/ipad7[31]} .preserve true
set_db -quiet inst:uart_ex_top/ipad8 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/ipad8 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/ipad8 .dont_touch true
set_db -quiet inst:uart_ex_top/ipad8 .preserve true
set_db -quiet {inst:uart_ex_top/opad1[0]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[0]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[0]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[0]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[1]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[1]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[1]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[1]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[2]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[2]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[2]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[2]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[3]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[3]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[3]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[3]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[4]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[4]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[4]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[4]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[5]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[5]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[5]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[5]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[6]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[6]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[6]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[6]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[7]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[7]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[7]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[7]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[8]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[8]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[8]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[8]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[9]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[9]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[9]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[9]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[10]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[10]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[10]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[10]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[11]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[11]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[11]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[11]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[12]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[12]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[12]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[12]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[13]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[13]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[13]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[13]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[14]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[14]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[14]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[14]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[15]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[15]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[15]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[15]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[16]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[16]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[16]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[16]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[17]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[17]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[17]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[17]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[18]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[18]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[18]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[18]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[19]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[19]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[19]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[19]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[20]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[20]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[20]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[20]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[21]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[21]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[21]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[21]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[22]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[22]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[22]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[22]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[23]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[23]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[23]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[23]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[24]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[24]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[24]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[24]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[25]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[25]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[25]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[25]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[26]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[26]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[26]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[26]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[27]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[27]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[27]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[27]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[28]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[28]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[28]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[28]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[29]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[29]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[29]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[29]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[30]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[30]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[30]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[30]} .preserve true
set_db -quiet {inst:uart_ex_top/opad1[31]} .dont_touch_reason set_dont_touch
set_db -quiet {inst:uart_ex_top/opad1[31]} .dont_touch_file 0
set_db -quiet {inst:uart_ex_top/opad1[31]} .dont_touch true
set_db -quiet {inst:uart_ex_top/opad1[31]} .preserve true
set_db -quiet inst:uart_ex_top/opad2 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad2 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad2 .dont_touch true
set_db -quiet inst:uart_ex_top/opad2 .preserve true
set_db -quiet inst:uart_ex_top/opad3 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad3 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad3 .dont_touch true
set_db -quiet inst:uart_ex_top/opad3 .preserve true
set_db -quiet inst:uart_ex_top/opad4 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad4 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad4 .dont_touch true
set_db -quiet inst:uart_ex_top/opad4 .preserve true
set_db -quiet inst:uart_ex_top/opad5 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad5 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad5 .dont_touch true
set_db -quiet inst:uart_ex_top/opad5 .preserve true
set_db -quiet inst:uart_ex_top/opad6 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad6 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad6 .dont_touch true
set_db -quiet inst:uart_ex_top/opad6 .preserve true
set_db -quiet inst:uart_ex_top/opad7 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad7 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad7 .dont_touch true
set_db -quiet inst:uart_ex_top/opad7 .preserve true
set_db -quiet inst:uart_ex_top/opad8 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad8 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad8 .dont_touch true
set_db -quiet inst:uart_ex_top/opad8 .preserve true
set_db -quiet inst:uart_ex_top/opad9 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_ex_top/opad9 .dont_touch_file 0
set_db -quiet inst:uart_ex_top/opad9 .dont_touch true
set_db -quiet inst:uart_ex_top/opad9 .preserve true
set_db -quiet module:uart_ex_top/baud_gen .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/baud_gen.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_0 .original_name {{uut1/r_count[0]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_0 .single_bit_orig_name {uut1/r_count[0]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_0/Q .original_name {uut1/r_count[0]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_1 .original_name {{uut1/r_count[1]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_1 .single_bit_orig_name {uut1/r_count[1]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_1/Q .original_name {uut1/r_count[1]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_2 .original_name {{uut1/r_count[2]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_2 .single_bit_orig_name {uut1/r_count[2]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_2/Q .original_name {uut1/r_count[2]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_3 .original_name {{uut1/r_count[3]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_3 .single_bit_orig_name {uut1/r_count[3]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_3/Q .original_name {uut1/r_count[3]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_4 .original_name {{uut1/r_count[4]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_4 .single_bit_orig_name {uut1/r_count[4]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_4/Q .original_name {uut1/r_count[4]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_5 .original_name {{uut1/r_count[5]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_5 .single_bit_orig_name {uut1/r_count[5]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_5/Q .original_name {uut1/r_count[5]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_6 .original_name {{uut1/r_count[6]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_6 .single_bit_orig_name {uut1/r_count[6]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_6/Q .original_name {uut1/r_count[6]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_7 .original_name {{uut1/r_count[7]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_7 .single_bit_orig_name {uut1/r_count[7]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_7/Q .original_name {uut1/r_count[7]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_8 .original_name {{uut1/r_count[8]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_8 .single_bit_orig_name {uut1/r_count[8]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_8/Q .original_name {uut1/r_count[8]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_9 .original_name {{uut1/r_count[9]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_9 .single_bit_orig_name {uut1/r_count[9]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_9/Q .original_name {uut1/r_count[9]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_10 .original_name {{uut1/r_count[10]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_10 .single_bit_orig_name {uut1/r_count[10]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_10/Q .original_name {uut1/r_count[10]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_11 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_11 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_11 .original_name {{uut1/r_count[11]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_11 .single_bit_orig_name {uut1/r_count[11]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_11/Q .original_name {uut1/r_count[11]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_12 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_12 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_12 .original_name {{uut1/r_count[12]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_12 .single_bit_orig_name {uut1/r_count[12]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_12/Q .original_name {uut1/r_count[12]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_13 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_13 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_13 .original_name {{uut1/r_count[13]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_13 .single_bit_orig_name {uut1/r_count[13]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_13/Q .original_name {uut1/r_count[13]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_14 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_14 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_14 .original_name {{uut1/r_count[14]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_14 .single_bit_orig_name {uut1/r_count[14]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_14/Q .original_name {uut1/r_count[14]/q}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_15 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_15 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_15 .original_name {{uut1/r_count[15]}}
set_db -quiet inst:uart_ex_top/uut1/r_count_reg_15 .single_bit_orig_name {uut1/r_count[15]}
set_db -quiet pin:uart_ex_top/uut1/r_count_reg_15/Q .original_name {uut1/r_count[15]/q}
set_db -quiet module:uart_ex_top/tx_fifo_FIFO_DEPTH16 .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/tx_fifo.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_0 .original_name {{uut2/r_count[0]}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_0 .single_bit_orig_name {uut2/r_count[0]}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_0/Q .original_name {uut2/r_count[0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_0/QN .original_name {uut2/r_count[0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_1 .original_name {{uut2/r_count[1]}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_1 .single_bit_orig_name {uut2/r_count[1]}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_1/Q .original_name {uut2/r_count[1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_1/QN .original_name {uut2/r_count[1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_3 .original_name {{uut2/r_count[3]}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_3 .single_bit_orig_name {uut2/r_count[3]}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_3/Q .original_name {uut2/r_count[3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_3/QN .original_name {uut2/r_count[3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_4 .original_name {{uut2/r_count[4]}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_4 .single_bit_orig_name {uut2/r_count[4]}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_4/Q .original_name {uut2/r_count[4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_4/QN .original_name {uut2/r_count[4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_0 .original_name {{uut2/r_mem[2][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_0 .single_bit_orig_name {uut2/r_mem[2][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_0/Q .original_name {uut2/r_mem[2][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_1 .original_name {{uut2/r_mem[2][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_1 .single_bit_orig_name {uut2/r_mem[2][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_1/Q .original_name {uut2/r_mem[2][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_2 .original_name {{uut2/r_mem[2][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_2 .single_bit_orig_name {uut2/r_mem[2][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_2/Q .original_name {uut2/r_mem[2][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_3 .original_name {{uut2/r_mem[2][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_3 .single_bit_orig_name {uut2/r_mem[2][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_3/Q .original_name {uut2/r_mem[2][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_4 .original_name {{uut2/r_mem[2][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_4 .single_bit_orig_name {uut2/r_mem[2][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_4/Q .original_name {uut2/r_mem[2][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_5 .original_name {{uut2/r_mem[2][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_5 .single_bit_orig_name {uut2/r_mem[2][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_5/Q .original_name {uut2/r_mem[2][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_6 .original_name {{uut2/r_mem[2][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_6 .single_bit_orig_name {uut2/r_mem[2][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_6/Q .original_name {uut2/r_mem[2][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_7 .original_name {{uut2/r_mem[2][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_2_7 .single_bit_orig_name {uut2/r_mem[2][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_2_7/Q .original_name {uut2/r_mem[2][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_0 .original_name {{uut2/r_mem[3][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_0 .single_bit_orig_name {uut2/r_mem[3][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_0/Q .original_name {uut2/r_mem[3][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_1 .original_name {{uut2/r_mem[3][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_1 .single_bit_orig_name {uut2/r_mem[3][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_1/Q .original_name {uut2/r_mem[3][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_2 .original_name {{uut2/r_mem[3][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_2 .single_bit_orig_name {uut2/r_mem[3][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_2/Q .original_name {uut2/r_mem[3][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_3 .original_name {{uut2/r_mem[3][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_3 .single_bit_orig_name {uut2/r_mem[3][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_3/Q .original_name {uut2/r_mem[3][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_4 .original_name {{uut2/r_mem[3][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_4 .single_bit_orig_name {uut2/r_mem[3][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_4/Q .original_name {uut2/r_mem[3][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_5 .original_name {{uut2/r_mem[3][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_5 .single_bit_orig_name {uut2/r_mem[3][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_5/Q .original_name {uut2/r_mem[3][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_6 .original_name {{uut2/r_mem[3][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_6 .single_bit_orig_name {uut2/r_mem[3][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_6/Q .original_name {uut2/r_mem[3][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_7 .original_name {{uut2/r_mem[3][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_3_7 .single_bit_orig_name {uut2/r_mem[3][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_3_7/Q .original_name {uut2/r_mem[3][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_0 .original_name {{uut2/r_mem[6][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_0 .single_bit_orig_name {uut2/r_mem[6][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_0/Q .original_name {uut2/r_mem[6][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_1 .original_name {{uut2/r_mem[6][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_1 .single_bit_orig_name {uut2/r_mem[6][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_1/Q .original_name {uut2/r_mem[6][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_2 .original_name {{uut2/r_mem[6][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_2 .single_bit_orig_name {uut2/r_mem[6][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_2/Q .original_name {uut2/r_mem[6][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_3 .original_name {{uut2/r_mem[6][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_3 .single_bit_orig_name {uut2/r_mem[6][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_3/Q .original_name {uut2/r_mem[6][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_4 .original_name {{uut2/r_mem[6][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_4 .single_bit_orig_name {uut2/r_mem[6][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_4/Q .original_name {uut2/r_mem[6][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_5 .original_name {{uut2/r_mem[6][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_5 .single_bit_orig_name {uut2/r_mem[6][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_5/Q .original_name {uut2/r_mem[6][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_6 .original_name {{uut2/r_mem[6][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_6 .single_bit_orig_name {uut2/r_mem[6][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_6/Q .original_name {uut2/r_mem[6][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_7 .original_name {{uut2/r_mem[6][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_6_7 .single_bit_orig_name {uut2/r_mem[6][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_6_7/Q .original_name {uut2/r_mem[6][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_0 .original_name {{uut2/r_mem[7][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_0 .single_bit_orig_name {uut2/r_mem[7][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_0/Q .original_name {uut2/r_mem[7][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_1 .original_name {{uut2/r_mem[7][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_1 .single_bit_orig_name {uut2/r_mem[7][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_1/Q .original_name {uut2/r_mem[7][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_2 .original_name {{uut2/r_mem[7][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_2 .single_bit_orig_name {uut2/r_mem[7][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_2/Q .original_name {uut2/r_mem[7][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_3 .original_name {{uut2/r_mem[7][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_3 .single_bit_orig_name {uut2/r_mem[7][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_3/Q .original_name {uut2/r_mem[7][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_4 .original_name {{uut2/r_mem[7][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_4 .single_bit_orig_name {uut2/r_mem[7][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_4/Q .original_name {uut2/r_mem[7][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_5 .original_name {{uut2/r_mem[7][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_5 .single_bit_orig_name {uut2/r_mem[7][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_5/Q .original_name {uut2/r_mem[7][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_6 .original_name {{uut2/r_mem[7][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_6 .single_bit_orig_name {uut2/r_mem[7][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_6/Q .original_name {uut2/r_mem[7][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_7 .original_name {{uut2/r_mem[7][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_7_7 .single_bit_orig_name {uut2/r_mem[7][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_7_7/Q .original_name {uut2/r_mem[7][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_0 .original_name {{uut2/r_mem[10][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_0 .single_bit_orig_name {uut2/r_mem[10][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_0/Q .original_name {uut2/r_mem[10][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_1 .original_name {{uut2/r_mem[10][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_1 .single_bit_orig_name {uut2/r_mem[10][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_1/Q .original_name {uut2/r_mem[10][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_2 .original_name {{uut2/r_mem[10][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_2 .single_bit_orig_name {uut2/r_mem[10][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_2/Q .original_name {uut2/r_mem[10][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_3 .original_name {{uut2/r_mem[10][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_3 .single_bit_orig_name {uut2/r_mem[10][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_3/Q .original_name {uut2/r_mem[10][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_4 .original_name {{uut2/r_mem[10][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_4 .single_bit_orig_name {uut2/r_mem[10][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_4/Q .original_name {uut2/r_mem[10][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_5 .original_name {{uut2/r_mem[10][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_5 .single_bit_orig_name {uut2/r_mem[10][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_5/Q .original_name {uut2/r_mem[10][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_6 .original_name {{uut2/r_mem[10][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_6 .single_bit_orig_name {uut2/r_mem[10][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_6/Q .original_name {uut2/r_mem[10][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_7 .original_name {{uut2/r_mem[10][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_10_7 .single_bit_orig_name {uut2/r_mem[10][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_10_7/Q .original_name {uut2/r_mem[10][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_0 .original_name {{uut2/r_mem[11][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_0 .single_bit_orig_name {uut2/r_mem[11][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_0/Q .original_name {uut2/r_mem[11][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_1 .original_name {{uut2/r_mem[11][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_1 .single_bit_orig_name {uut2/r_mem[11][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_1/Q .original_name {uut2/r_mem[11][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_2 .original_name {{uut2/r_mem[11][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_2 .single_bit_orig_name {uut2/r_mem[11][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_2/Q .original_name {uut2/r_mem[11][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_3 .original_name {{uut2/r_mem[11][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_3 .single_bit_orig_name {uut2/r_mem[11][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_3/Q .original_name {uut2/r_mem[11][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_4 .original_name {{uut2/r_mem[11][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_4 .single_bit_orig_name {uut2/r_mem[11][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_4/Q .original_name {uut2/r_mem[11][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_5 .original_name {{uut2/r_mem[11][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_5 .single_bit_orig_name {uut2/r_mem[11][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_5/Q .original_name {uut2/r_mem[11][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_6 .original_name {{uut2/r_mem[11][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_6 .single_bit_orig_name {uut2/r_mem[11][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_6/Q .original_name {uut2/r_mem[11][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_7 .original_name {{uut2/r_mem[11][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_11_7 .single_bit_orig_name {uut2/r_mem[11][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_11_7/Q .original_name {uut2/r_mem[11][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_0 .original_name {{uut2/r_mem[14][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_0 .single_bit_orig_name {uut2/r_mem[14][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_0/Q .original_name {uut2/r_mem[14][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_1 .original_name {{uut2/r_mem[14][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_1 .single_bit_orig_name {uut2/r_mem[14][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_1/Q .original_name {uut2/r_mem[14][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_2 .original_name {{uut2/r_mem[14][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_2 .single_bit_orig_name {uut2/r_mem[14][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_2/Q .original_name {uut2/r_mem[14][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_3 .original_name {{uut2/r_mem[14][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_3 .single_bit_orig_name {uut2/r_mem[14][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_3/Q .original_name {uut2/r_mem[14][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_4 .original_name {{uut2/r_mem[14][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_4 .single_bit_orig_name {uut2/r_mem[14][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_4/Q .original_name {uut2/r_mem[14][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_5 .original_name {{uut2/r_mem[14][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_5 .single_bit_orig_name {uut2/r_mem[14][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_5/Q .original_name {uut2/r_mem[14][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_6 .original_name {{uut2/r_mem[14][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_6 .single_bit_orig_name {uut2/r_mem[14][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_6/Q .original_name {uut2/r_mem[14][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_7 .original_name {{uut2/r_mem[14][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_14_7 .single_bit_orig_name {uut2/r_mem[14][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_14_7/Q .original_name {uut2/r_mem[14][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_0 .original_name {{uut2/r_mem[15][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_0 .single_bit_orig_name {uut2/r_mem[15][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_0/Q .original_name {uut2/r_mem[15][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_1 .original_name {{uut2/r_mem[15][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_1 .single_bit_orig_name {uut2/r_mem[15][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_1/Q .original_name {uut2/r_mem[15][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_2 .original_name {{uut2/r_mem[15][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_2 .single_bit_orig_name {uut2/r_mem[15][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_2/Q .original_name {uut2/r_mem[15][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_3 .original_name {{uut2/r_mem[15][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_3 .single_bit_orig_name {uut2/r_mem[15][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_3/Q .original_name {uut2/r_mem[15][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_4 .original_name {{uut2/r_mem[15][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_4 .single_bit_orig_name {uut2/r_mem[15][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_4/Q .original_name {uut2/r_mem[15][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_5 .original_name {{uut2/r_mem[15][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_5 .single_bit_orig_name {uut2/r_mem[15][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_5/Q .original_name {uut2/r_mem[15][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_6 .original_name {{uut2/r_mem[15][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_6 .single_bit_orig_name {uut2/r_mem[15][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_6/Q .original_name {uut2/r_mem[15][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_7 .original_name {{uut2/r_mem[15][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_15_7 .single_bit_orig_name {uut2/r_mem[15][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_15_7/Q .original_name {uut2/r_mem[15][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_1 .original_name {{uut2/r_rptr[1]}}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_1 .single_bit_orig_name {uut2/r_rptr[1]}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_1/Q .original_name {uut2/r_rptr[1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_2 .original_name {{uut2/r_rptr[2]}}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_2 .single_bit_orig_name {uut2/r_rptr[2]}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_2/Q .original_name {uut2/r_rptr[2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_0 .original_name {{uut2/r_wptr[0]}}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_0 .single_bit_orig_name {uut2/r_wptr[0]}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_0/Q .original_name {uut2/r_wptr[0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_0/QN .original_name {uut2/r_wptr[0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_2 .original_name {{uut2/r_wptr[2]}}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_2 .single_bit_orig_name {uut2/r_wptr[2]}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_2/Q .original_name {uut2/r_wptr[2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_2/QN .original_name {uut2/r_wptr[2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_3 .original_name {{uut2/r_wptr[3]}}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_3 .single_bit_orig_name {uut2/r_wptr[3]}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_3/Q .original_name {uut2/r_wptr[3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_2 .original_name {{uut2/r_count[2]}}
set_db -quiet inst:uart_ex_top/uut2/r_count_reg_2 .single_bit_orig_name {uut2/r_count[2]}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_2/Q .original_name {uut2/r_count[2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_count_reg_2/QN .original_name {uut2/r_count[2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_0 .original_name {{uut2/r_mem[0][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_0 .single_bit_orig_name {uut2/r_mem[0][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_0/Q .original_name {uut2/r_mem[0][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_0/QN .original_name {uut2/r_mem[0][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_1 .original_name {{uut2/r_mem[0][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_1 .single_bit_orig_name {uut2/r_mem[0][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_1/Q .original_name {uut2/r_mem[0][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_1/QN .original_name {uut2/r_mem[0][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_2 .original_name {{uut2/r_mem[0][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_2 .single_bit_orig_name {uut2/r_mem[0][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_2/Q .original_name {uut2/r_mem[0][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_2/QN .original_name {uut2/r_mem[0][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_3 .original_name {{uut2/r_mem[0][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_3 .single_bit_orig_name {uut2/r_mem[0][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_3/Q .original_name {uut2/r_mem[0][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_3/QN .original_name {uut2/r_mem[0][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_4 .original_name {{uut2/r_mem[0][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_4 .single_bit_orig_name {uut2/r_mem[0][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_4/Q .original_name {uut2/r_mem[0][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_4/QN .original_name {uut2/r_mem[0][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_5 .original_name {{uut2/r_mem[0][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_5 .single_bit_orig_name {uut2/r_mem[0][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_5/Q .original_name {uut2/r_mem[0][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_5/QN .original_name {uut2/r_mem[0][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_6 .original_name {{uut2/r_mem[0][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_6 .single_bit_orig_name {uut2/r_mem[0][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_6/Q .original_name {uut2/r_mem[0][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_6/QN .original_name {uut2/r_mem[0][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_7 .original_name {{uut2/r_mem[0][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_0_7 .single_bit_orig_name {uut2/r_mem[0][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_7/Q .original_name {uut2/r_mem[0][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_0_7/QN .original_name {uut2/r_mem[0][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_0 .original_name {{uut2/r_mem[1][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_0 .single_bit_orig_name {uut2/r_mem[1][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_0/Q .original_name {uut2/r_mem[1][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_0/QN .original_name {uut2/r_mem[1][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_1 .original_name {{uut2/r_mem[1][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_1 .single_bit_orig_name {uut2/r_mem[1][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_1/Q .original_name {uut2/r_mem[1][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_1/QN .original_name {uut2/r_mem[1][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_2 .original_name {{uut2/r_mem[1][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_2 .single_bit_orig_name {uut2/r_mem[1][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_2/Q .original_name {uut2/r_mem[1][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_2/QN .original_name {uut2/r_mem[1][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_3 .original_name {{uut2/r_mem[1][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_3 .single_bit_orig_name {uut2/r_mem[1][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_3/Q .original_name {uut2/r_mem[1][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_3/QN .original_name {uut2/r_mem[1][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_4 .original_name {{uut2/r_mem[1][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_4 .single_bit_orig_name {uut2/r_mem[1][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_4/Q .original_name {uut2/r_mem[1][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_4/QN .original_name {uut2/r_mem[1][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_5 .original_name {{uut2/r_mem[1][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_5 .single_bit_orig_name {uut2/r_mem[1][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_5/Q .original_name {uut2/r_mem[1][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_5/QN .original_name {uut2/r_mem[1][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_6 .original_name {{uut2/r_mem[1][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_6 .single_bit_orig_name {uut2/r_mem[1][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_6/Q .original_name {uut2/r_mem[1][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_6/QN .original_name {uut2/r_mem[1][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_7 .original_name {{uut2/r_mem[1][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_1_7 .single_bit_orig_name {uut2/r_mem[1][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_7/Q .original_name {uut2/r_mem[1][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_1_7/QN .original_name {uut2/r_mem[1][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_0 .original_name {{uut2/r_mem[4][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_0 .single_bit_orig_name {uut2/r_mem[4][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_0/Q .original_name {uut2/r_mem[4][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_0/QN .original_name {uut2/r_mem[4][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_1 .original_name {{uut2/r_mem[4][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_1 .single_bit_orig_name {uut2/r_mem[4][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_1/Q .original_name {uut2/r_mem[4][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_1/QN .original_name {uut2/r_mem[4][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_2 .original_name {{uut2/r_mem[4][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_2 .single_bit_orig_name {uut2/r_mem[4][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_2/Q .original_name {uut2/r_mem[4][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_2/QN .original_name {uut2/r_mem[4][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_3 .original_name {{uut2/r_mem[4][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_3 .single_bit_orig_name {uut2/r_mem[4][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_3/Q .original_name {uut2/r_mem[4][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_3/QN .original_name {uut2/r_mem[4][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_4 .original_name {{uut2/r_mem[4][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_4 .single_bit_orig_name {uut2/r_mem[4][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_4/Q .original_name {uut2/r_mem[4][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_4/QN .original_name {uut2/r_mem[4][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_5 .original_name {{uut2/r_mem[4][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_5 .single_bit_orig_name {uut2/r_mem[4][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_5/Q .original_name {uut2/r_mem[4][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_5/QN .original_name {uut2/r_mem[4][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_6 .original_name {{uut2/r_mem[4][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_6 .single_bit_orig_name {uut2/r_mem[4][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_6/Q .original_name {uut2/r_mem[4][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_6/QN .original_name {uut2/r_mem[4][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_7 .original_name {{uut2/r_mem[4][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_4_7 .single_bit_orig_name {uut2/r_mem[4][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_7/Q .original_name {uut2/r_mem[4][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_4_7/QN .original_name {uut2/r_mem[4][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_0 .original_name {{uut2/r_mem[5][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_0 .single_bit_orig_name {uut2/r_mem[5][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_0/Q .original_name {uut2/r_mem[5][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_0/QN .original_name {uut2/r_mem[5][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_1 .original_name {{uut2/r_mem[5][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_1 .single_bit_orig_name {uut2/r_mem[5][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_1/Q .original_name {uut2/r_mem[5][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_1/QN .original_name {uut2/r_mem[5][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_2 .original_name {{uut2/r_mem[5][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_2 .single_bit_orig_name {uut2/r_mem[5][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_2/Q .original_name {uut2/r_mem[5][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_2/QN .original_name {uut2/r_mem[5][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_3 .original_name {{uut2/r_mem[5][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_3 .single_bit_orig_name {uut2/r_mem[5][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_3/Q .original_name {uut2/r_mem[5][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_3/QN .original_name {uut2/r_mem[5][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_4 .original_name {{uut2/r_mem[5][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_4 .single_bit_orig_name {uut2/r_mem[5][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_4/Q .original_name {uut2/r_mem[5][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_4/QN .original_name {uut2/r_mem[5][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_5 .original_name {{uut2/r_mem[5][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_5 .single_bit_orig_name {uut2/r_mem[5][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_5/Q .original_name {uut2/r_mem[5][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_5/QN .original_name {uut2/r_mem[5][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_6 .original_name {{uut2/r_mem[5][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_6 .single_bit_orig_name {uut2/r_mem[5][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_6/Q .original_name {uut2/r_mem[5][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_6/QN .original_name {uut2/r_mem[5][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_7 .original_name {{uut2/r_mem[5][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_5_7 .single_bit_orig_name {uut2/r_mem[5][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_7/Q .original_name {uut2/r_mem[5][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_5_7/QN .original_name {uut2/r_mem[5][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_0 .original_name {{uut2/r_mem[8][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_0 .single_bit_orig_name {uut2/r_mem[8][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_0/Q .original_name {uut2/r_mem[8][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_0/QN .original_name {uut2/r_mem[8][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_1 .original_name {{uut2/r_mem[8][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_1 .single_bit_orig_name {uut2/r_mem[8][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_1/Q .original_name {uut2/r_mem[8][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_1/QN .original_name {uut2/r_mem[8][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_2 .original_name {{uut2/r_mem[8][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_2 .single_bit_orig_name {uut2/r_mem[8][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_2/Q .original_name {uut2/r_mem[8][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_2/QN .original_name {uut2/r_mem[8][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_3 .original_name {{uut2/r_mem[8][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_3 .single_bit_orig_name {uut2/r_mem[8][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_3/Q .original_name {uut2/r_mem[8][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_3/QN .original_name {uut2/r_mem[8][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_4 .original_name {{uut2/r_mem[8][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_4 .single_bit_orig_name {uut2/r_mem[8][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_4/Q .original_name {uut2/r_mem[8][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_4/QN .original_name {uut2/r_mem[8][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_5 .original_name {{uut2/r_mem[8][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_5 .single_bit_orig_name {uut2/r_mem[8][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_5/Q .original_name {uut2/r_mem[8][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_5/QN .original_name {uut2/r_mem[8][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_6 .original_name {{uut2/r_mem[8][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_6 .single_bit_orig_name {uut2/r_mem[8][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_6/Q .original_name {uut2/r_mem[8][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_6/QN .original_name {uut2/r_mem[8][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_7 .original_name {{uut2/r_mem[8][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_8_7 .single_bit_orig_name {uut2/r_mem[8][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_7/Q .original_name {uut2/r_mem[8][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_8_7/QN .original_name {uut2/r_mem[8][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_0 .original_name {{uut2/r_mem[9][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_0 .single_bit_orig_name {uut2/r_mem[9][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_0/Q .original_name {uut2/r_mem[9][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_0/QN .original_name {uut2/r_mem[9][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_1 .original_name {{uut2/r_mem[9][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_1 .single_bit_orig_name {uut2/r_mem[9][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_1/Q .original_name {uut2/r_mem[9][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_1/QN .original_name {uut2/r_mem[9][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_2 .original_name {{uut2/r_mem[9][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_2 .single_bit_orig_name {uut2/r_mem[9][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_2/Q .original_name {uut2/r_mem[9][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_2/QN .original_name {uut2/r_mem[9][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_3 .original_name {{uut2/r_mem[9][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_3 .single_bit_orig_name {uut2/r_mem[9][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_3/Q .original_name {uut2/r_mem[9][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_3/QN .original_name {uut2/r_mem[9][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_4 .original_name {{uut2/r_mem[9][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_4 .single_bit_orig_name {uut2/r_mem[9][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_4/Q .original_name {uut2/r_mem[9][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_4/QN .original_name {uut2/r_mem[9][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_5 .original_name {{uut2/r_mem[9][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_5 .single_bit_orig_name {uut2/r_mem[9][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_5/Q .original_name {uut2/r_mem[9][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_5/QN .original_name {uut2/r_mem[9][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_6 .original_name {{uut2/r_mem[9][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_6 .single_bit_orig_name {uut2/r_mem[9][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_6/Q .original_name {uut2/r_mem[9][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_6/QN .original_name {uut2/r_mem[9][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_7 .original_name {{uut2/r_mem[9][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_9_7 .single_bit_orig_name {uut2/r_mem[9][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_7/Q .original_name {uut2/r_mem[9][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_9_7/QN .original_name {uut2/r_mem[9][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_0 .original_name {{uut2/r_mem[12][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_0 .single_bit_orig_name {uut2/r_mem[12][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_0/Q .original_name {uut2/r_mem[12][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_0/QN .original_name {uut2/r_mem[12][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_1 .original_name {{uut2/r_mem[12][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_1 .single_bit_orig_name {uut2/r_mem[12][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_1/Q .original_name {uut2/r_mem[12][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_1/QN .original_name {uut2/r_mem[12][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_2 .original_name {{uut2/r_mem[12][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_2 .single_bit_orig_name {uut2/r_mem[12][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_2/Q .original_name {uut2/r_mem[12][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_2/QN .original_name {uut2/r_mem[12][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_3 .original_name {{uut2/r_mem[12][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_3 .single_bit_orig_name {uut2/r_mem[12][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_3/Q .original_name {uut2/r_mem[12][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_3/QN .original_name {uut2/r_mem[12][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_4 .original_name {{uut2/r_mem[12][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_4 .single_bit_orig_name {uut2/r_mem[12][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_4/Q .original_name {uut2/r_mem[12][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_4/QN .original_name {uut2/r_mem[12][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_5 .original_name {{uut2/r_mem[12][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_5 .single_bit_orig_name {uut2/r_mem[12][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_5/Q .original_name {uut2/r_mem[12][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_5/QN .original_name {uut2/r_mem[12][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_6 .original_name {{uut2/r_mem[12][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_6 .single_bit_orig_name {uut2/r_mem[12][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_6/Q .original_name {uut2/r_mem[12][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_6/QN .original_name {uut2/r_mem[12][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_7 .original_name {{uut2/r_mem[12][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_12_7 .single_bit_orig_name {uut2/r_mem[12][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_7/Q .original_name {uut2/r_mem[12][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_12_7/QN .original_name {uut2/r_mem[12][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_0 .original_name {{uut2/r_mem[13][0]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_0 .single_bit_orig_name {uut2/r_mem[13][0]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_0/Q .original_name {uut2/r_mem[13][0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_0/QN .original_name {uut2/r_mem[13][0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_1 .original_name {{uut2/r_mem[13][1]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_1 .single_bit_orig_name {uut2/r_mem[13][1]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_1/Q .original_name {uut2/r_mem[13][1]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_1/QN .original_name {uut2/r_mem[13][1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_2 .original_name {{uut2/r_mem[13][2]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_2 .single_bit_orig_name {uut2/r_mem[13][2]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_2/Q .original_name {uut2/r_mem[13][2]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_2/QN .original_name {uut2/r_mem[13][2]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_3 .original_name {{uut2/r_mem[13][3]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_3 .single_bit_orig_name {uut2/r_mem[13][3]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_3/Q .original_name {uut2/r_mem[13][3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_3/QN .original_name {uut2/r_mem[13][3]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_4 .original_name {{uut2/r_mem[13][4]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_4 .single_bit_orig_name {uut2/r_mem[13][4]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_4/Q .original_name {uut2/r_mem[13][4]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_4/QN .original_name {uut2/r_mem[13][4]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_5 .original_name {{uut2/r_mem[13][5]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_5 .single_bit_orig_name {uut2/r_mem[13][5]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_5/Q .original_name {uut2/r_mem[13][5]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_5/QN .original_name {uut2/r_mem[13][5]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_6 .original_name {{uut2/r_mem[13][6]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_6 .single_bit_orig_name {uut2/r_mem[13][6]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_6/Q .original_name {uut2/r_mem[13][6]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_6/QN .original_name {uut2/r_mem[13][6]/q}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_7 .original_name {{uut2/r_mem[13][7]}}
set_db -quiet inst:uart_ex_top/uut2/r_mem_reg_13_7 .single_bit_orig_name {uut2/r_mem[13][7]}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_7/Q .original_name {uut2/r_mem[13][7]/q}
set_db -quiet pin:uart_ex_top/uut2/r_mem_reg_13_7/QN .original_name {uut2/r_mem[13][7]/q}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_1 .original_name {{uut2/r_wptr[1]}}
set_db -quiet inst:uart_ex_top/uut2/r_wptr_reg_1 .single_bit_orig_name {uut2/r_wptr[1]}
set_db -quiet pin:uart_ex_top/uut2/r_wptr_reg_1/Q .original_name {uut2/r_wptr[1]/q}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_0 .original_name {{uut2/r_rptr[0]}}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_0 .single_bit_orig_name {uut2/r_rptr[0]}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_0/Q .original_name {uut2/r_rptr[0]/q}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_0/QN .original_name {uut2/r_rptr[0]/q}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_3 .original_name {{uut2/r_rptr[3]}}
set_db -quiet inst:uart_ex_top/uut2/r_rptr_reg_3 .single_bit_orig_name {uut2/r_rptr[3]}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_3/Q .original_name {uut2/r_rptr[3]/q}
set_db -quiet pin:uart_ex_top/uut2/r_rptr_reg_3/QN .original_name {uut2/r_rptr[3]/q}
set_db -quiet module:uart_ex_top/rx_fifo_FIFO_DEPTH16 .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/rx_fifo.v ../1_RTL/tx_fifo.v} {../1_RTL} {}}}
set_db -quiet module:uart_ex_top/tx_fifo_DATA_WIDTH11_FIFO_DEPTH16 .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/tx_fifo.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_2 .original_name {{uut3/dut/r_count[2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_2 .single_bit_orig_name {uut3/dut/r_count[2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_2/Q .original_name {uut3/dut/r_count[2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_4 .original_name {{uut3/dut/r_count[4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_4 .single_bit_orig_name {uut3/dut/r_count[4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_4/Q .original_name {uut3/dut/r_count[4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_0 .original_name {{uut3/dut/r_mem[0][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_0 .single_bit_orig_name {uut3/dut/r_mem[0][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_0/Q .original_name {uut3/dut/r_mem[0][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_1 .original_name {{uut3/dut/r_mem[0][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_1 .single_bit_orig_name {uut3/dut/r_mem[0][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_1/Q .original_name {uut3/dut/r_mem[0][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_2 .original_name {{uut3/dut/r_mem[0][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_2 .single_bit_orig_name {uut3/dut/r_mem[0][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_2/Q .original_name {uut3/dut/r_mem[0][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_3 .original_name {{uut3/dut/r_mem[0][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_3 .single_bit_orig_name {uut3/dut/r_mem[0][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_3/Q .original_name {uut3/dut/r_mem[0][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_4 .original_name {{uut3/dut/r_mem[0][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_4 .single_bit_orig_name {uut3/dut/r_mem[0][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_4/Q .original_name {uut3/dut/r_mem[0][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_5 .original_name {{uut3/dut/r_mem[0][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_5 .single_bit_orig_name {uut3/dut/r_mem[0][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_5/Q .original_name {uut3/dut/r_mem[0][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_6 .original_name {{uut3/dut/r_mem[0][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_6 .single_bit_orig_name {uut3/dut/r_mem[0][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_6/Q .original_name {uut3/dut/r_mem[0][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_7 .original_name {{uut3/dut/r_mem[0][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_7 .single_bit_orig_name {uut3/dut/r_mem[0][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_7/Q .original_name {uut3/dut/r_mem[0][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_8 .original_name {{uut3/dut/r_mem[0][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_8 .single_bit_orig_name {uut3/dut/r_mem[0][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_8/Q .original_name {uut3/dut/r_mem[0][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_9 .original_name {{uut3/dut/r_mem[0][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_9 .single_bit_orig_name {uut3/dut/r_mem[0][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_9/Q .original_name {uut3/dut/r_mem[0][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_10 .original_name {{uut3/dut/r_mem[0][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_0_10 .single_bit_orig_name {uut3/dut/r_mem[0][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_0_10/Q .original_name {uut3/dut/r_mem[0][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_0 .original_name {{uut3/dut/r_mem[1][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_0 .single_bit_orig_name {uut3/dut/r_mem[1][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_0/Q .original_name {uut3/dut/r_mem[1][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_1 .original_name {{uut3/dut/r_mem[1][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_1 .single_bit_orig_name {uut3/dut/r_mem[1][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_1/Q .original_name {uut3/dut/r_mem[1][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_2 .original_name {{uut3/dut/r_mem[1][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_2 .single_bit_orig_name {uut3/dut/r_mem[1][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_2/Q .original_name {uut3/dut/r_mem[1][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_3 .original_name {{uut3/dut/r_mem[1][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_3 .single_bit_orig_name {uut3/dut/r_mem[1][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_3/Q .original_name {uut3/dut/r_mem[1][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_4 .original_name {{uut3/dut/r_mem[1][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_4 .single_bit_orig_name {uut3/dut/r_mem[1][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_4/Q .original_name {uut3/dut/r_mem[1][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_5 .original_name {{uut3/dut/r_mem[1][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_5 .single_bit_orig_name {uut3/dut/r_mem[1][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_5/Q .original_name {uut3/dut/r_mem[1][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_6 .original_name {{uut3/dut/r_mem[1][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_6 .single_bit_orig_name {uut3/dut/r_mem[1][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_6/Q .original_name {uut3/dut/r_mem[1][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_7 .original_name {{uut3/dut/r_mem[1][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_7 .single_bit_orig_name {uut3/dut/r_mem[1][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_7/Q .original_name {uut3/dut/r_mem[1][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_8 .original_name {{uut3/dut/r_mem[1][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_8 .single_bit_orig_name {uut3/dut/r_mem[1][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_8/Q .original_name {uut3/dut/r_mem[1][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_9 .original_name {{uut3/dut/r_mem[1][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_9 .single_bit_orig_name {uut3/dut/r_mem[1][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_9/Q .original_name {uut3/dut/r_mem[1][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_10 .original_name {{uut3/dut/r_mem[1][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_1_10 .single_bit_orig_name {uut3/dut/r_mem[1][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_1_10/Q .original_name {uut3/dut/r_mem[1][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_0 .original_name {{uut3/dut/r_mem[2][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_0 .single_bit_orig_name {uut3/dut/r_mem[2][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_0/Q .original_name {uut3/dut/r_mem[2][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_1 .original_name {{uut3/dut/r_mem[2][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_1 .single_bit_orig_name {uut3/dut/r_mem[2][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_1/Q .original_name {uut3/dut/r_mem[2][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_2 .original_name {{uut3/dut/r_mem[2][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_2 .single_bit_orig_name {uut3/dut/r_mem[2][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_2/Q .original_name {uut3/dut/r_mem[2][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_3 .original_name {{uut3/dut/r_mem[2][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_3 .single_bit_orig_name {uut3/dut/r_mem[2][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_3/Q .original_name {uut3/dut/r_mem[2][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_4 .original_name {{uut3/dut/r_mem[2][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_4 .single_bit_orig_name {uut3/dut/r_mem[2][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_4/Q .original_name {uut3/dut/r_mem[2][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_5 .original_name {{uut3/dut/r_mem[2][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_5 .single_bit_orig_name {uut3/dut/r_mem[2][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_5/Q .original_name {uut3/dut/r_mem[2][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_6 .original_name {{uut3/dut/r_mem[2][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_6 .single_bit_orig_name {uut3/dut/r_mem[2][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_6/Q .original_name {uut3/dut/r_mem[2][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_7 .original_name {{uut3/dut/r_mem[2][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_7 .single_bit_orig_name {uut3/dut/r_mem[2][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_7/Q .original_name {uut3/dut/r_mem[2][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_8 .original_name {{uut3/dut/r_mem[2][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_8 .single_bit_orig_name {uut3/dut/r_mem[2][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_8/Q .original_name {uut3/dut/r_mem[2][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_9 .original_name {{uut3/dut/r_mem[2][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_9 .single_bit_orig_name {uut3/dut/r_mem[2][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_9/Q .original_name {uut3/dut/r_mem[2][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_10 .original_name {{uut3/dut/r_mem[2][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_2_10 .single_bit_orig_name {uut3/dut/r_mem[2][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_2_10/Q .original_name {uut3/dut/r_mem[2][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_0 .original_name {{uut3/dut/r_mem[3][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_0 .single_bit_orig_name {uut3/dut/r_mem[3][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_0/Q .original_name {uut3/dut/r_mem[3][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_1 .original_name {{uut3/dut/r_mem[3][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_1 .single_bit_orig_name {uut3/dut/r_mem[3][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_1/Q .original_name {uut3/dut/r_mem[3][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_2 .original_name {{uut3/dut/r_mem[3][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_2 .single_bit_orig_name {uut3/dut/r_mem[3][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_2/Q .original_name {uut3/dut/r_mem[3][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_3 .original_name {{uut3/dut/r_mem[3][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_3 .single_bit_orig_name {uut3/dut/r_mem[3][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_3/Q .original_name {uut3/dut/r_mem[3][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_4 .original_name {{uut3/dut/r_mem[3][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_4 .single_bit_orig_name {uut3/dut/r_mem[3][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_4/Q .original_name {uut3/dut/r_mem[3][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_5 .original_name {{uut3/dut/r_mem[3][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_5 .single_bit_orig_name {uut3/dut/r_mem[3][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_5/Q .original_name {uut3/dut/r_mem[3][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_6 .original_name {{uut3/dut/r_mem[3][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_6 .single_bit_orig_name {uut3/dut/r_mem[3][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_6/Q .original_name {uut3/dut/r_mem[3][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_7 .original_name {{uut3/dut/r_mem[3][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_7 .single_bit_orig_name {uut3/dut/r_mem[3][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_7/Q .original_name {uut3/dut/r_mem[3][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_8 .original_name {{uut3/dut/r_mem[3][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_8 .single_bit_orig_name {uut3/dut/r_mem[3][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_8/Q .original_name {uut3/dut/r_mem[3][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_9 .original_name {{uut3/dut/r_mem[3][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_9 .single_bit_orig_name {uut3/dut/r_mem[3][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_9/Q .original_name {uut3/dut/r_mem[3][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_10 .original_name {{uut3/dut/r_mem[3][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_3_10 .single_bit_orig_name {uut3/dut/r_mem[3][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_3_10/Q .original_name {uut3/dut/r_mem[3][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_0 .original_name {{uut3/dut/r_mem[4][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_0 .single_bit_orig_name {uut3/dut/r_mem[4][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_0/Q .original_name {uut3/dut/r_mem[4][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_1 .original_name {{uut3/dut/r_mem[4][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_1 .single_bit_orig_name {uut3/dut/r_mem[4][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_1/Q .original_name {uut3/dut/r_mem[4][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_2 .original_name {{uut3/dut/r_mem[4][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_2 .single_bit_orig_name {uut3/dut/r_mem[4][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_2/Q .original_name {uut3/dut/r_mem[4][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_3 .original_name {{uut3/dut/r_mem[4][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_3 .single_bit_orig_name {uut3/dut/r_mem[4][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_3/Q .original_name {uut3/dut/r_mem[4][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_4 .original_name {{uut3/dut/r_mem[4][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_4 .single_bit_orig_name {uut3/dut/r_mem[4][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_4/Q .original_name {uut3/dut/r_mem[4][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_5 .original_name {{uut3/dut/r_mem[4][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_5 .single_bit_orig_name {uut3/dut/r_mem[4][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_5/Q .original_name {uut3/dut/r_mem[4][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_6 .original_name {{uut3/dut/r_mem[4][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_6 .single_bit_orig_name {uut3/dut/r_mem[4][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_6/Q .original_name {uut3/dut/r_mem[4][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_7 .original_name {{uut3/dut/r_mem[4][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_7 .single_bit_orig_name {uut3/dut/r_mem[4][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_7/Q .original_name {uut3/dut/r_mem[4][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_8 .original_name {{uut3/dut/r_mem[4][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_8 .single_bit_orig_name {uut3/dut/r_mem[4][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_8/Q .original_name {uut3/dut/r_mem[4][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_9 .original_name {{uut3/dut/r_mem[4][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_9 .single_bit_orig_name {uut3/dut/r_mem[4][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_9/Q .original_name {uut3/dut/r_mem[4][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_10 .original_name {{uut3/dut/r_mem[4][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_4_10 .single_bit_orig_name {uut3/dut/r_mem[4][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_4_10/Q .original_name {uut3/dut/r_mem[4][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_0 .original_name {{uut3/dut/r_mem[5][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_0 .single_bit_orig_name {uut3/dut/r_mem[5][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_0/Q .original_name {uut3/dut/r_mem[5][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_1 .original_name {{uut3/dut/r_mem[5][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_1 .single_bit_orig_name {uut3/dut/r_mem[5][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_1/Q .original_name {uut3/dut/r_mem[5][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_2 .original_name {{uut3/dut/r_mem[5][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_2 .single_bit_orig_name {uut3/dut/r_mem[5][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_2/Q .original_name {uut3/dut/r_mem[5][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_3 .original_name {{uut3/dut/r_mem[5][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_3 .single_bit_orig_name {uut3/dut/r_mem[5][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_3/Q .original_name {uut3/dut/r_mem[5][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_4 .original_name {{uut3/dut/r_mem[5][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_4 .single_bit_orig_name {uut3/dut/r_mem[5][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_4/Q .original_name {uut3/dut/r_mem[5][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_5 .original_name {{uut3/dut/r_mem[5][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_5 .single_bit_orig_name {uut3/dut/r_mem[5][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_5/Q .original_name {uut3/dut/r_mem[5][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_6 .original_name {{uut3/dut/r_mem[5][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_6 .single_bit_orig_name {uut3/dut/r_mem[5][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_6/Q .original_name {uut3/dut/r_mem[5][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_7 .original_name {{uut3/dut/r_mem[5][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_7 .single_bit_orig_name {uut3/dut/r_mem[5][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_7/Q .original_name {uut3/dut/r_mem[5][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_8 .original_name {{uut3/dut/r_mem[5][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_8 .single_bit_orig_name {uut3/dut/r_mem[5][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_8/Q .original_name {uut3/dut/r_mem[5][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_9 .original_name {{uut3/dut/r_mem[5][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_9 .single_bit_orig_name {uut3/dut/r_mem[5][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_9/Q .original_name {uut3/dut/r_mem[5][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_10 .original_name {{uut3/dut/r_mem[5][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_5_10 .single_bit_orig_name {uut3/dut/r_mem[5][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_5_10/Q .original_name {uut3/dut/r_mem[5][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_0 .original_name {{uut3/dut/r_mem[6][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_0 .single_bit_orig_name {uut3/dut/r_mem[6][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_0/Q .original_name {uut3/dut/r_mem[6][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_1 .original_name {{uut3/dut/r_mem[6][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_1 .single_bit_orig_name {uut3/dut/r_mem[6][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_1/Q .original_name {uut3/dut/r_mem[6][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_2 .original_name {{uut3/dut/r_mem[6][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_2 .single_bit_orig_name {uut3/dut/r_mem[6][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_2/Q .original_name {uut3/dut/r_mem[6][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_3 .original_name {{uut3/dut/r_mem[6][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_3 .single_bit_orig_name {uut3/dut/r_mem[6][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_3/Q .original_name {uut3/dut/r_mem[6][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_4 .original_name {{uut3/dut/r_mem[6][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_4 .single_bit_orig_name {uut3/dut/r_mem[6][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_4/Q .original_name {uut3/dut/r_mem[6][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_5 .original_name {{uut3/dut/r_mem[6][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_5 .single_bit_orig_name {uut3/dut/r_mem[6][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_5/Q .original_name {uut3/dut/r_mem[6][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_6 .original_name {{uut3/dut/r_mem[6][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_6 .single_bit_orig_name {uut3/dut/r_mem[6][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_6/Q .original_name {uut3/dut/r_mem[6][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_7 .original_name {{uut3/dut/r_mem[6][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_7 .single_bit_orig_name {uut3/dut/r_mem[6][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_7/Q .original_name {uut3/dut/r_mem[6][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_8 .original_name {{uut3/dut/r_mem[6][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_8 .single_bit_orig_name {uut3/dut/r_mem[6][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_8/Q .original_name {uut3/dut/r_mem[6][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_9 .original_name {{uut3/dut/r_mem[6][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_9 .single_bit_orig_name {uut3/dut/r_mem[6][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_9/Q .original_name {uut3/dut/r_mem[6][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_10 .original_name {{uut3/dut/r_mem[6][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_6_10 .single_bit_orig_name {uut3/dut/r_mem[6][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_6_10/Q .original_name {uut3/dut/r_mem[6][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_0 .original_name {{uut3/dut/r_mem[7][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_0 .single_bit_orig_name {uut3/dut/r_mem[7][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_0/Q .original_name {uut3/dut/r_mem[7][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_1 .original_name {{uut3/dut/r_mem[7][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_1 .single_bit_orig_name {uut3/dut/r_mem[7][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_1/Q .original_name {uut3/dut/r_mem[7][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_2 .original_name {{uut3/dut/r_mem[7][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_2 .single_bit_orig_name {uut3/dut/r_mem[7][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_2/Q .original_name {uut3/dut/r_mem[7][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_3 .original_name {{uut3/dut/r_mem[7][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_3 .single_bit_orig_name {uut3/dut/r_mem[7][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_3/Q .original_name {uut3/dut/r_mem[7][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_4 .original_name {{uut3/dut/r_mem[7][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_4 .single_bit_orig_name {uut3/dut/r_mem[7][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_4/Q .original_name {uut3/dut/r_mem[7][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_5 .original_name {{uut3/dut/r_mem[7][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_5 .single_bit_orig_name {uut3/dut/r_mem[7][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_5/Q .original_name {uut3/dut/r_mem[7][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_6 .original_name {{uut3/dut/r_mem[7][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_6 .single_bit_orig_name {uut3/dut/r_mem[7][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_6/Q .original_name {uut3/dut/r_mem[7][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_7 .original_name {{uut3/dut/r_mem[7][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_7 .single_bit_orig_name {uut3/dut/r_mem[7][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_7/Q .original_name {uut3/dut/r_mem[7][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_8 .original_name {{uut3/dut/r_mem[7][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_8 .single_bit_orig_name {uut3/dut/r_mem[7][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_8/Q .original_name {uut3/dut/r_mem[7][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_9 .original_name {{uut3/dut/r_mem[7][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_9 .single_bit_orig_name {uut3/dut/r_mem[7][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_9/Q .original_name {uut3/dut/r_mem[7][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_10 .original_name {{uut3/dut/r_mem[7][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_7_10 .single_bit_orig_name {uut3/dut/r_mem[7][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_7_10/Q .original_name {uut3/dut/r_mem[7][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_0 .original_name {{uut3/dut/r_mem[8][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_0 .single_bit_orig_name {uut3/dut/r_mem[8][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_0/Q .original_name {uut3/dut/r_mem[8][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_1 .original_name {{uut3/dut/r_mem[8][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_1 .single_bit_orig_name {uut3/dut/r_mem[8][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_1/Q .original_name {uut3/dut/r_mem[8][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_2 .original_name {{uut3/dut/r_mem[8][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_2 .single_bit_orig_name {uut3/dut/r_mem[8][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_2/Q .original_name {uut3/dut/r_mem[8][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_3 .original_name {{uut3/dut/r_mem[8][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_3 .single_bit_orig_name {uut3/dut/r_mem[8][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_3/Q .original_name {uut3/dut/r_mem[8][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_4 .original_name {{uut3/dut/r_mem[8][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_4 .single_bit_orig_name {uut3/dut/r_mem[8][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_4/Q .original_name {uut3/dut/r_mem[8][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_5 .original_name {{uut3/dut/r_mem[8][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_5 .single_bit_orig_name {uut3/dut/r_mem[8][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_5/Q .original_name {uut3/dut/r_mem[8][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_6 .original_name {{uut3/dut/r_mem[8][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_6 .single_bit_orig_name {uut3/dut/r_mem[8][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_6/Q .original_name {uut3/dut/r_mem[8][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_7 .original_name {{uut3/dut/r_mem[8][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_7 .single_bit_orig_name {uut3/dut/r_mem[8][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_7/Q .original_name {uut3/dut/r_mem[8][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_8 .original_name {{uut3/dut/r_mem[8][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_8 .single_bit_orig_name {uut3/dut/r_mem[8][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_8/Q .original_name {uut3/dut/r_mem[8][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_9 .original_name {{uut3/dut/r_mem[8][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_9 .single_bit_orig_name {uut3/dut/r_mem[8][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_9/Q .original_name {uut3/dut/r_mem[8][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_10 .original_name {{uut3/dut/r_mem[8][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_8_10 .single_bit_orig_name {uut3/dut/r_mem[8][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_8_10/Q .original_name {uut3/dut/r_mem[8][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_0 .original_name {{uut3/dut/r_mem[9][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_0 .single_bit_orig_name {uut3/dut/r_mem[9][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_0/Q .original_name {uut3/dut/r_mem[9][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_1 .original_name {{uut3/dut/r_mem[9][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_1 .single_bit_orig_name {uut3/dut/r_mem[9][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_1/Q .original_name {uut3/dut/r_mem[9][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_2 .original_name {{uut3/dut/r_mem[9][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_2 .single_bit_orig_name {uut3/dut/r_mem[9][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_2/Q .original_name {uut3/dut/r_mem[9][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_3 .original_name {{uut3/dut/r_mem[9][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_3 .single_bit_orig_name {uut3/dut/r_mem[9][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_3/Q .original_name {uut3/dut/r_mem[9][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_4 .original_name {{uut3/dut/r_mem[9][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_4 .single_bit_orig_name {uut3/dut/r_mem[9][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_4/Q .original_name {uut3/dut/r_mem[9][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_5 .original_name {{uut3/dut/r_mem[9][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_5 .single_bit_orig_name {uut3/dut/r_mem[9][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_5/Q .original_name {uut3/dut/r_mem[9][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_6 .original_name {{uut3/dut/r_mem[9][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_6 .single_bit_orig_name {uut3/dut/r_mem[9][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_6/Q .original_name {uut3/dut/r_mem[9][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_7 .original_name {{uut3/dut/r_mem[9][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_7 .single_bit_orig_name {uut3/dut/r_mem[9][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_7/Q .original_name {uut3/dut/r_mem[9][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_8 .original_name {{uut3/dut/r_mem[9][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_8 .single_bit_orig_name {uut3/dut/r_mem[9][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_8/Q .original_name {uut3/dut/r_mem[9][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_9 .original_name {{uut3/dut/r_mem[9][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_9 .single_bit_orig_name {uut3/dut/r_mem[9][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_9/Q .original_name {uut3/dut/r_mem[9][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_10 .original_name {{uut3/dut/r_mem[9][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_9_10 .single_bit_orig_name {uut3/dut/r_mem[9][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_9_10/Q .original_name {uut3/dut/r_mem[9][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_0 .original_name {{uut3/dut/r_mem[10][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_0 .single_bit_orig_name {uut3/dut/r_mem[10][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_0/Q .original_name {uut3/dut/r_mem[10][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_1 .original_name {{uut3/dut/r_mem[10][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_1 .single_bit_orig_name {uut3/dut/r_mem[10][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_1/Q .original_name {uut3/dut/r_mem[10][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_2 .original_name {{uut3/dut/r_mem[10][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_2 .single_bit_orig_name {uut3/dut/r_mem[10][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_2/Q .original_name {uut3/dut/r_mem[10][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_3 .original_name {{uut3/dut/r_mem[10][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_3 .single_bit_orig_name {uut3/dut/r_mem[10][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_3/Q .original_name {uut3/dut/r_mem[10][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_4 .original_name {{uut3/dut/r_mem[10][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_4 .single_bit_orig_name {uut3/dut/r_mem[10][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_4/Q .original_name {uut3/dut/r_mem[10][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_5 .original_name {{uut3/dut/r_mem[10][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_5 .single_bit_orig_name {uut3/dut/r_mem[10][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_5/Q .original_name {uut3/dut/r_mem[10][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_6 .original_name {{uut3/dut/r_mem[10][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_6 .single_bit_orig_name {uut3/dut/r_mem[10][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_6/Q .original_name {uut3/dut/r_mem[10][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_7 .original_name {{uut3/dut/r_mem[10][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_7 .single_bit_orig_name {uut3/dut/r_mem[10][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_7/Q .original_name {uut3/dut/r_mem[10][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_8 .original_name {{uut3/dut/r_mem[10][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_8 .single_bit_orig_name {uut3/dut/r_mem[10][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_8/Q .original_name {uut3/dut/r_mem[10][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_9 .original_name {{uut3/dut/r_mem[10][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_9 .single_bit_orig_name {uut3/dut/r_mem[10][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_9/Q .original_name {uut3/dut/r_mem[10][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_10 .original_name {{uut3/dut/r_mem[10][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_10_10 .single_bit_orig_name {uut3/dut/r_mem[10][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_10_10/Q .original_name {uut3/dut/r_mem[10][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_0 .original_name {{uut3/dut/r_mem[11][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_0 .single_bit_orig_name {uut3/dut/r_mem[11][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_0/Q .original_name {uut3/dut/r_mem[11][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_1 .original_name {{uut3/dut/r_mem[11][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_1 .single_bit_orig_name {uut3/dut/r_mem[11][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_1/Q .original_name {uut3/dut/r_mem[11][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_2 .original_name {{uut3/dut/r_mem[11][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_2 .single_bit_orig_name {uut3/dut/r_mem[11][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_2/Q .original_name {uut3/dut/r_mem[11][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_3 .original_name {{uut3/dut/r_mem[11][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_3 .single_bit_orig_name {uut3/dut/r_mem[11][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_3/Q .original_name {uut3/dut/r_mem[11][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_4 .original_name {{uut3/dut/r_mem[11][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_4 .single_bit_orig_name {uut3/dut/r_mem[11][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_4/Q .original_name {uut3/dut/r_mem[11][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_5 .original_name {{uut3/dut/r_mem[11][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_5 .single_bit_orig_name {uut3/dut/r_mem[11][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_5/Q .original_name {uut3/dut/r_mem[11][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_6 .original_name {{uut3/dut/r_mem[11][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_6 .single_bit_orig_name {uut3/dut/r_mem[11][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_6/Q .original_name {uut3/dut/r_mem[11][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_7 .original_name {{uut3/dut/r_mem[11][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_7 .single_bit_orig_name {uut3/dut/r_mem[11][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_7/Q .original_name {uut3/dut/r_mem[11][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_8 .original_name {{uut3/dut/r_mem[11][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_8 .single_bit_orig_name {uut3/dut/r_mem[11][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_8/Q .original_name {uut3/dut/r_mem[11][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_9 .original_name {{uut3/dut/r_mem[11][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_9 .single_bit_orig_name {uut3/dut/r_mem[11][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_9/Q .original_name {uut3/dut/r_mem[11][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_10 .original_name {{uut3/dut/r_mem[11][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_11_10 .single_bit_orig_name {uut3/dut/r_mem[11][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_11_10/Q .original_name {uut3/dut/r_mem[11][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_0 .original_name {{uut3/dut/r_mem[12][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_0 .single_bit_orig_name {uut3/dut/r_mem[12][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_0/Q .original_name {uut3/dut/r_mem[12][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_1 .original_name {{uut3/dut/r_mem[12][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_1 .single_bit_orig_name {uut3/dut/r_mem[12][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_1/Q .original_name {uut3/dut/r_mem[12][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_2 .original_name {{uut3/dut/r_mem[12][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_2 .single_bit_orig_name {uut3/dut/r_mem[12][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_2/Q .original_name {uut3/dut/r_mem[12][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_3 .original_name {{uut3/dut/r_mem[12][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_3 .single_bit_orig_name {uut3/dut/r_mem[12][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_3/Q .original_name {uut3/dut/r_mem[12][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_4 .original_name {{uut3/dut/r_mem[12][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_4 .single_bit_orig_name {uut3/dut/r_mem[12][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_4/Q .original_name {uut3/dut/r_mem[12][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_5 .original_name {{uut3/dut/r_mem[12][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_5 .single_bit_orig_name {uut3/dut/r_mem[12][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_5/Q .original_name {uut3/dut/r_mem[12][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_6 .original_name {{uut3/dut/r_mem[12][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_6 .single_bit_orig_name {uut3/dut/r_mem[12][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_6/Q .original_name {uut3/dut/r_mem[12][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_7 .original_name {{uut3/dut/r_mem[12][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_7 .single_bit_orig_name {uut3/dut/r_mem[12][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_7/Q .original_name {uut3/dut/r_mem[12][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_8 .original_name {{uut3/dut/r_mem[12][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_8 .single_bit_orig_name {uut3/dut/r_mem[12][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_8/Q .original_name {uut3/dut/r_mem[12][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_9 .original_name {{uut3/dut/r_mem[12][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_9 .single_bit_orig_name {uut3/dut/r_mem[12][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_9/Q .original_name {uut3/dut/r_mem[12][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_10 .original_name {{uut3/dut/r_mem[12][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_12_10 .single_bit_orig_name {uut3/dut/r_mem[12][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_12_10/Q .original_name {uut3/dut/r_mem[12][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_0 .original_name {{uut3/dut/r_mem[13][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_0 .single_bit_orig_name {uut3/dut/r_mem[13][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_0/Q .original_name {uut3/dut/r_mem[13][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_1 .original_name {{uut3/dut/r_mem[13][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_1 .single_bit_orig_name {uut3/dut/r_mem[13][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_1/Q .original_name {uut3/dut/r_mem[13][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_2 .original_name {{uut3/dut/r_mem[13][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_2 .single_bit_orig_name {uut3/dut/r_mem[13][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_2/Q .original_name {uut3/dut/r_mem[13][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_3 .original_name {{uut3/dut/r_mem[13][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_3 .single_bit_orig_name {uut3/dut/r_mem[13][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_3/Q .original_name {uut3/dut/r_mem[13][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_4 .original_name {{uut3/dut/r_mem[13][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_4 .single_bit_orig_name {uut3/dut/r_mem[13][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_4/Q .original_name {uut3/dut/r_mem[13][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_5 .original_name {{uut3/dut/r_mem[13][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_5 .single_bit_orig_name {uut3/dut/r_mem[13][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_5/Q .original_name {uut3/dut/r_mem[13][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_6 .original_name {{uut3/dut/r_mem[13][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_6 .single_bit_orig_name {uut3/dut/r_mem[13][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_6/Q .original_name {uut3/dut/r_mem[13][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_7 .original_name {{uut3/dut/r_mem[13][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_7 .single_bit_orig_name {uut3/dut/r_mem[13][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_7/Q .original_name {uut3/dut/r_mem[13][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_8 .original_name {{uut3/dut/r_mem[13][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_8 .single_bit_orig_name {uut3/dut/r_mem[13][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_8/Q .original_name {uut3/dut/r_mem[13][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_9 .original_name {{uut3/dut/r_mem[13][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_9 .single_bit_orig_name {uut3/dut/r_mem[13][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_9/Q .original_name {uut3/dut/r_mem[13][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_10 .original_name {{uut3/dut/r_mem[13][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_13_10 .single_bit_orig_name {uut3/dut/r_mem[13][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_13_10/Q .original_name {uut3/dut/r_mem[13][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_0 .original_name {{uut3/dut/r_mem[14][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_0 .single_bit_orig_name {uut3/dut/r_mem[14][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_0/Q .original_name {uut3/dut/r_mem[14][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_1 .original_name {{uut3/dut/r_mem[14][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_1 .single_bit_orig_name {uut3/dut/r_mem[14][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_1/Q .original_name {uut3/dut/r_mem[14][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_2 .original_name {{uut3/dut/r_mem[14][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_2 .single_bit_orig_name {uut3/dut/r_mem[14][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_2/Q .original_name {uut3/dut/r_mem[14][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_3 .original_name {{uut3/dut/r_mem[14][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_3 .single_bit_orig_name {uut3/dut/r_mem[14][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_3/Q .original_name {uut3/dut/r_mem[14][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_4 .original_name {{uut3/dut/r_mem[14][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_4 .single_bit_orig_name {uut3/dut/r_mem[14][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_4/Q .original_name {uut3/dut/r_mem[14][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_5 .original_name {{uut3/dut/r_mem[14][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_5 .single_bit_orig_name {uut3/dut/r_mem[14][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_5/Q .original_name {uut3/dut/r_mem[14][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_6 .original_name {{uut3/dut/r_mem[14][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_6 .single_bit_orig_name {uut3/dut/r_mem[14][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_6/Q .original_name {uut3/dut/r_mem[14][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_7 .original_name {{uut3/dut/r_mem[14][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_7 .single_bit_orig_name {uut3/dut/r_mem[14][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_7/Q .original_name {uut3/dut/r_mem[14][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_8 .original_name {{uut3/dut/r_mem[14][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_8 .single_bit_orig_name {uut3/dut/r_mem[14][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_8/Q .original_name {uut3/dut/r_mem[14][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_9 .original_name {{uut3/dut/r_mem[14][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_9 .single_bit_orig_name {uut3/dut/r_mem[14][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_9/Q .original_name {uut3/dut/r_mem[14][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_10 .original_name {{uut3/dut/r_mem[14][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_14_10 .single_bit_orig_name {uut3/dut/r_mem[14][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_14_10/Q .original_name {uut3/dut/r_mem[14][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_0 .original_name {{uut3/dut/r_mem[15][0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_0 .single_bit_orig_name {uut3/dut/r_mem[15][0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_0/Q .original_name {uut3/dut/r_mem[15][0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_1 .original_name {{uut3/dut/r_mem[15][1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_1 .single_bit_orig_name {uut3/dut/r_mem[15][1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_1/Q .original_name {uut3/dut/r_mem[15][1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_2 .original_name {{uut3/dut/r_mem[15][2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_2 .single_bit_orig_name {uut3/dut/r_mem[15][2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_2/Q .original_name {uut3/dut/r_mem[15][2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_3 .original_name {{uut3/dut/r_mem[15][3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_3 .single_bit_orig_name {uut3/dut/r_mem[15][3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_3/Q .original_name {uut3/dut/r_mem[15][3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_4 .original_name {{uut3/dut/r_mem[15][4]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_4 .single_bit_orig_name {uut3/dut/r_mem[15][4]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_4/Q .original_name {uut3/dut/r_mem[15][4]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_5 .original_name {{uut3/dut/r_mem[15][5]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_5 .single_bit_orig_name {uut3/dut/r_mem[15][5]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_5/Q .original_name {uut3/dut/r_mem[15][5]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_6 .original_name {{uut3/dut/r_mem[15][6]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_6 .single_bit_orig_name {uut3/dut/r_mem[15][6]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_6/Q .original_name {uut3/dut/r_mem[15][6]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_7 .original_name {{uut3/dut/r_mem[15][7]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_7 .single_bit_orig_name {uut3/dut/r_mem[15][7]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_7/Q .original_name {uut3/dut/r_mem[15][7]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_8 .original_name {{uut3/dut/r_mem[15][8]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_8 .single_bit_orig_name {uut3/dut/r_mem[15][8]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_8/Q .original_name {uut3/dut/r_mem[15][8]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_9 .original_name {{uut3/dut/r_mem[15][9]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_9 .single_bit_orig_name {uut3/dut/r_mem[15][9]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_9/Q .original_name {uut3/dut/r_mem[15][9]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_10 .original_name {{uut3/dut/r_mem[15][10]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_mem_reg_15_10 .single_bit_orig_name {uut3/dut/r_mem[15][10]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_mem_reg_15_10/Q .original_name {uut3/dut/r_mem[15][10]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_0 .original_name {{uut3/dut/r_rptr[0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_0 .single_bit_orig_name {uut3/dut/r_rptr[0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_rptr_reg_0/Q .original_name {uut3/dut/r_rptr[0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_1 .original_name {{uut3/dut/r_rptr[1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_1 .single_bit_orig_name {uut3/dut/r_rptr[1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_rptr_reg_1/Q .original_name {uut3/dut/r_rptr[1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_2 .original_name {{uut3/dut/r_rptr[2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_2 .single_bit_orig_name {uut3/dut/r_rptr[2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_rptr_reg_2/Q .original_name {uut3/dut/r_rptr[2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_3 .original_name {{uut3/dut/r_rptr[3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_rptr_reg_3 .single_bit_orig_name {uut3/dut/r_rptr[3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_rptr_reg_3/Q .original_name {uut3/dut/r_rptr[3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_0 .original_name {{uut3/dut/r_wptr[0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_0 .single_bit_orig_name {uut3/dut/r_wptr[0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_0/Q .original_name {uut3/dut/r_wptr[0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_1 .original_name {{uut3/dut/r_wptr[1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_1 .single_bit_orig_name {uut3/dut/r_wptr[1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_1/Q .original_name {uut3/dut/r_wptr[1]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_3 .original_name {{uut3/dut/r_count[3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_3 .single_bit_orig_name {uut3/dut/r_count[3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_3/Q .original_name {uut3/dut/r_count[3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_2 .original_name {{uut3/dut/r_wptr[2]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_2 .single_bit_orig_name {uut3/dut/r_wptr[2]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_2/Q .original_name {uut3/dut/r_wptr[2]/q}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_2/QN .original_name {uut3/dut/r_wptr[2]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_3 .original_name {{uut3/dut/r_wptr[3]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_wptr_reg_3 .single_bit_orig_name {uut3/dut/r_wptr[3]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_3/Q .original_name {uut3/dut/r_wptr[3]/q}
set_db -quiet pin:uart_ex_top/uut3/dut/r_wptr_reg_3/QN .original_name {uut3/dut/r_wptr[3]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_0 .original_name {{uut3/dut/r_count[0]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_0 .single_bit_orig_name {uut3/dut/r_count[0]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_0/Q .original_name {uut3/dut/r_count[0]/q}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_1 .original_name {{uut3/dut/r_count[1]}}
set_db -quiet inst:uart_ex_top/uut3/dut/r_count_reg_1 .single_bit_orig_name {uut3/dut/r_count[1]}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_1/Q .original_name {uut3/dut/r_count[1]/q}
set_db -quiet pin:uart_ex_top/uut3/dut/r_count_reg_1/QN .original_name {uut3/dut/r_count[1]/q}
set_db -quiet module:uart_ex_top/tx_logic .is_sop_cluster true
set_db -quiet module:uart_ex_top/tx_logic .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/tx_logic.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_0 .original_name {{uut4/r_bit_cnt[0]}}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_0 .single_bit_orig_name {uut4/r_bit_cnt[0]}
set_db -quiet pin:uart_ex_top/uut4/r_bit_cnt_reg_0/Q .original_name {uut4/r_bit_cnt[0]/q}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_1 .original_name {{uut4/r_bit_cnt[1]}}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_1 .single_bit_orig_name {uut4/r_bit_cnt[1]}
set_db -quiet pin:uart_ex_top/uut4/r_bit_cnt_reg_1/Q .original_name {uut4/r_bit_cnt[1]/q}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_2 .original_name {{uut4/r_bit_cnt[2]}}
set_db -quiet inst:uart_ex_top/uut4/r_bit_cnt_reg_2 .single_bit_orig_name {uut4/r_bit_cnt[2]}
set_db -quiet pin:uart_ex_top/uut4/r_bit_cnt_reg_2/Q .original_name {uut4/r_bit_cnt[2]/q}
set_db -quiet inst:uart_ex_top/uut4/r_par_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_par_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_par_reg .original_name uut4/r_par
set_db -quiet inst:uart_ex_top/uut4/r_par_reg .single_bit_orig_name uut4/r_par
set_db -quiet pin:uart_ex_top/uut4/r_par_reg/Q .original_name uut4/r_par/q
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_0 .original_name {{uut4/r_shift[0]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_0 .single_bit_orig_name {uut4/r_shift[0]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_0/Q .original_name {uut4/r_shift[0]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_1 .original_name {{uut4/r_shift[1]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_1 .single_bit_orig_name {uut4/r_shift[1]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_1/Q .original_name {uut4/r_shift[1]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_2 .original_name {{uut4/r_shift[2]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_2 .single_bit_orig_name {uut4/r_shift[2]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_2/Q .original_name {uut4/r_shift[2]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_3 .original_name {{uut4/r_shift[3]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_3 .single_bit_orig_name {uut4/r_shift[3]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_3/Q .original_name {uut4/r_shift[3]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_4 .original_name {{uut4/r_shift[4]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_4 .single_bit_orig_name {uut4/r_shift[4]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_4/Q .original_name {uut4/r_shift[4]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_5 .original_name {{uut4/r_shift[5]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_5 .single_bit_orig_name {uut4/r_shift[5]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_5/Q .original_name {uut4/r_shift[5]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_6 .original_name {{uut4/r_shift[6]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_6 .single_bit_orig_name {uut4/r_shift[6]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_6/Q .original_name {uut4/r_shift[6]/q}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_7 .original_name {{uut4/r_shift[7]}}
set_db -quiet inst:uart_ex_top/uut4/r_shift_reg_7 .single_bit_orig_name {uut4/r_shift[7]}
set_db -quiet pin:uart_ex_top/uut4/r_shift_reg_7/Q .original_name {uut4/r_shift[7]/q}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_0 .original_name {{uut4/r_state[0]}}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_0 .single_bit_orig_name {uut4/r_state[0]}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_0/Q .original_name {uut4/r_state[0]/q}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_0/QN .original_name {uut4/r_state[0]/q}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_1 .original_name {{uut4/r_state[1]}}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_1 .single_bit_orig_name {uut4/r_state[1]}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_1/Q .original_name {uut4/r_state[1]/q}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_1/QN .original_name {uut4/r_state[1]/q}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_2 .original_name {{uut4/r_state[2]}}
set_db -quiet inst:uart_ex_top/uut4/r_state_reg_2 .single_bit_orig_name {uut4/r_state[2]}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_2/Q .original_name {uut4/r_state[2]/q}
set_db -quiet pin:uart_ex_top/uut4/r_state_reg_2/QN .original_name {uut4/r_state[2]/q}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_0 .original_name {{uut4/r_tick_cnt[0]}}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_0 .single_bit_orig_name {uut4/r_tick_cnt[0]}
set_db -quiet pin:uart_ex_top/uut4/r_tick_cnt_reg_0/Q .original_name {uut4/r_tick_cnt[0]/q}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_1 .original_name {{uut4/r_tick_cnt[1]}}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_1 .single_bit_orig_name {uut4/r_tick_cnt[1]}
set_db -quiet pin:uart_ex_top/uut4/r_tick_cnt_reg_1/Q .original_name {uut4/r_tick_cnt[1]/q}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_2 .original_name {{uut4/r_tick_cnt[2]}}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_2 .single_bit_orig_name {uut4/r_tick_cnt[2]}
set_db -quiet pin:uart_ex_top/uut4/r_tick_cnt_reg_2/Q .original_name {uut4/r_tick_cnt[2]/q}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_3 .original_name {{uut4/r_tick_cnt[3]}}
set_db -quiet inst:uart_ex_top/uut4/r_tick_cnt_reg_3 .single_bit_orig_name {uut4/r_tick_cnt[3]}
set_db -quiet pin:uart_ex_top/uut4/r_tick_cnt_reg_3/Q .original_name {uut4/r_tick_cnt[3]/q}
set_db -quiet module:uart_ex_top/rx_logic .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/rx_logic.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut5/r_rxd_d_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_rxd_d_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_rxd_d_reg .original_name uut5/r_rxd_d
set_db -quiet inst:uart_ex_top/uut5/r_rxd_d_reg .single_bit_orig_name uut5/r_rxd_d
set_db -quiet pin:uart_ex_top/uut5/r_rxd_d_reg/Q .original_name uut5/r_rxd_d/q
set_db -quiet pin:uart_ex_top/uut5/r_rxd_d_reg/QN .original_name uut5/r_rxd_d/q
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_2 .original_name {{uut5/r_tick_cnt[2]}}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_2 .single_bit_orig_name {uut5/r_tick_cnt[2]}
set_db -quiet pin:uart_ex_top/uut5/r_tick_cnt_reg_2/Q .original_name {uut5/r_tick_cnt[2]/q}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_1 .original_name {{uut5/r_tick_cnt[1]}}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_1 .single_bit_orig_name {uut5/r_tick_cnt[1]}
set_db -quiet pin:uart_ex_top/uut5/r_tick_cnt_reg_1/Q .original_name {uut5/r_tick_cnt[1]/q}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_2 .original_name {{uut5/r_bit_cnt[2]}}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_2 .single_bit_orig_name {uut5/r_bit_cnt[2]}
set_db -quiet pin:uart_ex_top/uut5/r_bit_cnt_reg_2/Q .original_name {uut5/r_bit_cnt[2]/q}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_3 .original_name {{uut5/r_tick_cnt[3]}}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_3 .single_bit_orig_name {uut5/r_tick_cnt[3]}
set_db -quiet pin:uart_ex_top/uut5/r_tick_cnt_reg_3/Q .original_name {uut5/r_tick_cnt[3]/q}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_0 .original_name {{uut5/r_tick_cnt[0]}}
set_db -quiet inst:uart_ex_top/uut5/r_tick_cnt_reg_0 .single_bit_orig_name {uut5/r_tick_cnt[0]}
set_db -quiet pin:uart_ex_top/uut5/r_tick_cnt_reg_0/Q .original_name {uut5/r_tick_cnt[0]/q}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_1 .original_name {{uut5/r_bit_cnt[1]}}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_1 .single_bit_orig_name {uut5/r_bit_cnt[1]}
set_db -quiet pin:uart_ex_top/uut5/r_bit_cnt_reg_1/Q .original_name {uut5/r_bit_cnt[1]/q}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_0 .original_name {{uut5/r_bit_cnt[0]}}
set_db -quiet inst:uart_ex_top/uut5/r_bit_cnt_reg_0 .single_bit_orig_name {uut5/r_bit_cnt[0]}
set_db -quiet pin:uart_ex_top/uut5/r_bit_cnt_reg_0/Q .original_name {uut5/r_bit_cnt[0]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_0 .original_name {{uut5/r_shift[0]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_0 .single_bit_orig_name {uut5/r_shift[0]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_0/Q .original_name {uut5/r_shift[0]/q}
set_db -quiet inst:uart_ex_top/uut5/r_pbit_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_pbit_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_pbit_reg .original_name uut5/r_pbit
set_db -quiet inst:uart_ex_top/uut5/r_pbit_reg .single_bit_orig_name uut5/r_pbit
set_db -quiet pin:uart_ex_top/uut5/r_pbit_reg/Q .original_name uut5/r_pbit/q
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_4 .original_name {{uut5/r_shift[4]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_4 .single_bit_orig_name {uut5/r_shift[4]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_4/Q .original_name {uut5/r_shift[4]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_3 .original_name {{uut5/r_shift[3]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_3 .single_bit_orig_name {uut5/r_shift[3]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_3/Q .original_name {uut5/r_shift[3]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_2 .original_name {{uut5/r_shift[2]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_2 .single_bit_orig_name {uut5/r_shift[2]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_2/Q .original_name {uut5/r_shift[2]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_1 .original_name {{uut5/r_shift[1]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_1 .single_bit_orig_name {uut5/r_shift[1]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_1/Q .original_name {uut5/r_shift[1]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_5 .original_name {{uut5/r_shift[5]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_5 .single_bit_orig_name {uut5/r_shift[5]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_5/Q .original_name {uut5/r_shift[5]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_6 .original_name {{uut5/r_shift[6]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_6 .single_bit_orig_name {uut5/r_shift[6]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_6/Q .original_name {uut5/r_shift[6]/q}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_7 .original_name {{uut5/r_shift[7]}}
set_db -quiet inst:uart_ex_top/uut5/r_shift_reg_7 .single_bit_orig_name {uut5/r_shift[7]}
set_db -quiet pin:uart_ex_top/uut5/r_shift_reg_7/Q .original_name {uut5/r_shift[7]/q}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_0 .original_name {{uut5/r_state[0]}}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_0 .single_bit_orig_name {uut5/r_state[0]}
set_db -quiet pin:uart_ex_top/uut5/r_state_reg_0/Q .original_name {uut5/r_state[0]/q}
set_db -quiet pin:uart_ex_top/uut5/r_state_reg_0/QN .original_name {uut5/r_state[0]/q}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_1 .original_name {{uut5/r_state[1]}}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_1 .single_bit_orig_name {uut5/r_state[1]}
set_db -quiet pin:uart_ex_top/uut5/r_state_reg_1/Q .original_name {uut5/r_state[1]/q}
set_db -quiet pin:uart_ex_top/uut5/r_state_reg_1/QN .original_name {uut5/r_state[1]/q}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_2 .original_name {{uut5/r_state[2]}}
set_db -quiet inst:uart_ex_top/uut5/r_state_reg_2 .single_bit_orig_name {uut5/r_state[2]}
set_db -quiet pin:uart_ex_top/uut5/r_state_reg_2/Q .original_name {uut5/r_state[2]/q}
set_db -quiet module:uart_ex_top/reg_block .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/reg_block.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut6/g3620__2802 .seq_dup_name_count 1
set_db -quiet inst:uart_ex_top/uut6/g3625 .seq_dup_name_count 1
set_db -quiet inst:uart_ex_top/uut6/g3628__6131 .seq_dup_name_count 1
set_db -quiet inst:uart_ex_top/uut6/g3629__1881 .seq_dup_name_count 1
set_db -quiet inst:uart_ex_top/uut6/g3630__5115 .seq_dup_name_count 1
set_db -quiet inst:uart_ex_top/uut6/r_brk_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_brk_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_brk_reg .original_name uut6/r_brk
set_db -quiet inst:uart_ex_top/uut6/r_brk_reg .single_bit_orig_name uut6/r_brk
set_db -quiet pin:uart_ex_top/uut6/r_brk_reg/Q .original_name uut6/r_brk/q
set_db -quiet inst:uart_ex_top/uut6/r_eps_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_eps_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_eps_reg .original_name uut6/r_eps
set_db -quiet inst:uart_ex_top/uut6/r_eps_reg .single_bit_orig_name uut6/r_eps
set_db -quiet pin:uart_ex_top/uut6/r_eps_reg/Q .original_name uut6/r_eps/q
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_0 .original_name {{uut6/r_ibrd[0]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_0 .single_bit_orig_name {uut6/r_ibrd[0]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_0/Q .original_name {uut6/r_ibrd[0]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_0/QN .original_name {uut6/r_ibrd[0]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_1 .original_name {{uut6/r_ibrd[1]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_1 .single_bit_orig_name {uut6/r_ibrd[1]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_1/Q .original_name {uut6/r_ibrd[1]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_2 .original_name {{uut6/r_ibrd[2]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_2 .single_bit_orig_name {uut6/r_ibrd[2]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_2/Q .original_name {uut6/r_ibrd[2]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_3 .original_name {{uut6/r_ibrd[3]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_3 .single_bit_orig_name {uut6/r_ibrd[3]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_3/Q .original_name {uut6/r_ibrd[3]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_3/QN .original_name {uut6/r_ibrd[3]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_4 .original_name {{uut6/r_ibrd[4]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_4 .single_bit_orig_name {uut6/r_ibrd[4]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_4/Q .original_name {uut6/r_ibrd[4]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_4/QN .original_name {uut6/r_ibrd[4]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_6 .original_name {{uut6/r_ibrd[6]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_6 .single_bit_orig_name {uut6/r_ibrd[6]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_6/Q .original_name {uut6/r_ibrd[6]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_6/QN .original_name {uut6/r_ibrd[6]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_7 .original_name {{uut6/r_ibrd[7]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_7 .single_bit_orig_name {uut6/r_ibrd[7]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_7/Q .original_name {uut6/r_ibrd[7]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_7/QN .original_name {uut6/r_ibrd[7]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_11 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_11 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_11 .original_name {{uut6/r_ibrd[11]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_11 .single_bit_orig_name {uut6/r_ibrd[11]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_11/Q .original_name {uut6/r_ibrd[11]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_12 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_12 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_12 .original_name {{uut6/r_ibrd[12]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_12 .single_bit_orig_name {uut6/r_ibrd[12]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_12/Q .original_name {uut6/r_ibrd[12]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_13 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_13 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_13 .original_name {{uut6/r_ibrd[13]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_13 .single_bit_orig_name {uut6/r_ibrd[13]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_13/Q .original_name {uut6/r_ibrd[13]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_14 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_14 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_14 .original_name {{uut6/r_ibrd[14]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_14 .single_bit_orig_name {uut6/r_ibrd[14]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_14/Q .original_name {uut6/r_ibrd[14]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_15 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_15 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_15 .original_name {{uut6/r_ibrd[15]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_15 .single_bit_orig_name {uut6/r_ibrd[15]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_15/Q .original_name {uut6/r_ibrd[15]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_1 .original_name {{uut6/r_imsc[1]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_1 .single_bit_orig_name {uut6/r_imsc[1]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_1/Q .original_name {uut6/r_imsc[1]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_2 .original_name {{uut6/r_imsc[2]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_2 .single_bit_orig_name {uut6/r_imsc[2]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_2/Q .original_name {uut6/r_imsc[2]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_3 .original_name {{uut6/r_imsc[3]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_3 .single_bit_orig_name {uut6/r_imsc[3]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_3/Q .original_name {uut6/r_imsc[3]/q}
set_db -quiet inst:uart_ex_top/uut6/r_lbe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_lbe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_lbe_reg .original_name uut6/r_lbe
set_db -quiet inst:uart_ex_top/uut6/r_lbe_reg .single_bit_orig_name uut6/r_lbe
set_db -quiet pin:uart_ex_top/uut6/r_lbe_reg/Q .original_name uut6/r_lbe/q
set_db -quiet inst:uart_ex_top/uut6/r_rxe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_rxe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_rxe_reg .original_name uut6/r_rxe
set_db -quiet inst:uart_ex_top/uut6/r_rxe_reg .single_bit_orig_name uut6/r_rxe
set_db -quiet pin:uart_ex_top/uut6/r_rxe_reg/Q .original_name uut6/r_rxe/q
set_db -quiet pin:uart_ex_top/uut6/r_rxe_reg/QN .original_name uut6/r_rxe/q
set_db -quiet inst:uart_ex_top/uut6/r_txe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_txe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_txe_reg .original_name uut6/r_txe
set_db -quiet inst:uart_ex_top/uut6/r_txe_reg .single_bit_orig_name uut6/r_txe
set_db -quiet pin:uart_ex_top/uut6/r_txe_reg/Q .original_name uut6/r_txe/q
set_db -quiet pin:uart_ex_top/uut6/r_txe_reg/QN .original_name uut6/r_txe/q
set_db -quiet inst:uart_ex_top/uut6/r_uarten_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_uarten_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_uarten_reg .original_name uut6/r_uarten
set_db -quiet inst:uart_ex_top/uut6/r_uarten_reg .single_bit_orig_name uut6/r_uarten
set_db -quiet pin:uart_ex_top/uut6/r_uarten_reg/Q .original_name uut6/r_uarten/q
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_9 .original_name {{uut6/r_ibrd[9]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_9 .single_bit_orig_name {uut6/r_ibrd[9]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_9/Q .original_name {uut6/r_ibrd[9]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_9/QN .original_name {uut6/r_ibrd[9]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_8 .original_name {{uut6/r_ibrd[8]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_8 .single_bit_orig_name {uut6/r_ibrd[8]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_8/Q .original_name {uut6/r_ibrd[8]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_8/QN .original_name {uut6/r_ibrd[8]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_5 .original_name {{uut6/r_imsc[5]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_5 .single_bit_orig_name {uut6/r_imsc[5]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_5/Q .original_name {uut6/r_imsc[5]/q}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_5/QN .original_name {uut6/r_imsc[5]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_4 .original_name {{uut6/r_imsc[4]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_4 .single_bit_orig_name {uut6/r_imsc[4]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_4/Q .original_name {uut6/r_imsc[4]/q}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_4/QN .original_name {uut6/r_imsc[4]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_6 .original_name {{uut6/r_imsc[6]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_6 .single_bit_orig_name {uut6/r_imsc[6]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_6/Q .original_name {uut6/r_imsc[6]/q}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_6/QN .original_name {uut6/r_imsc[6]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_10 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_10 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_10 .original_name {{uut6/r_ibrd[10]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_10 .single_bit_orig_name {uut6/r_ibrd[10]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_10/Q .original_name {uut6/r_ibrd[10]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_10/QN .original_name {uut6/r_ibrd[10]/q}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_5 .original_name {{uut6/r_ibrd[5]}}
set_db -quiet inst:uart_ex_top/uut6/r_ibrd_reg_5 .single_bit_orig_name {uut6/r_ibrd[5]}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_5/Q .original_name {uut6/r_ibrd[5]/q}
set_db -quiet pin:uart_ex_top/uut6/r_ibrd_reg_5/QN .original_name {uut6/r_ibrd[5]/q}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_0 .original_name {{uut6/r_imsc[0]}}
set_db -quiet inst:uart_ex_top/uut6/r_imsc_reg_0 .single_bit_orig_name {uut6/r_imsc[0]}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_0/Q .original_name {uut6/r_imsc[0]/q}
set_db -quiet pin:uart_ex_top/uut6/r_imsc_reg_0/QN .original_name {uut6/r_imsc[0]/q}
set_db -quiet inst:uart_ex_top/uut6/r_pen_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut6/r_pen_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut6/r_pen_reg .original_name uut6/r_pen
set_db -quiet inst:uart_ex_top/uut6/r_pen_reg .single_bit_orig_name uut6/r_pen
set_db -quiet pin:uart_ex_top/uut6/r_pen_reg/Q .original_name uut6/r_pen/q
set_db -quiet module:uart_ex_top/interrupt_logic_FIFO_DEPTH16 .hdl_filelist {{default -v2001 {SYNTHESIS} {../1_RTL/interrupt_logic.v} {../1_RTL} {}}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_9 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_9 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_9 .original_name {{uut7/r_rt_cnt[9]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_9 .single_bit_orig_name {uut7/r_rt_cnt[9]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_9/Q .original_name {uut7/r_rt_cnt[9]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_reg .original_name uut7/r_rt
set_db -quiet inst:uart_ex_top/uut7/r_rt_reg .single_bit_orig_name uut7/r_rt
set_db -quiet pin:uart_ex_top/uut7/r_rt_reg/Q .original_name uut7/r_rt/q
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_8 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_8 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_8 .original_name {{uut7/r_rt_cnt[8]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_8 .single_bit_orig_name {uut7/r_rt_cnt[8]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_8/Q .original_name {uut7/r_rt_cnt[8]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_5 .original_name {{uut7/r_rt_cnt[5]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_5 .single_bit_orig_name {uut7/r_rt_cnt[5]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_5/Q .original_name {uut7/r_rt_cnt[5]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_7 .original_name {{uut7/r_rt_cnt[7]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_7 .single_bit_orig_name {uut7/r_rt_cnt[7]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_7/Q .original_name {uut7/r_rt_cnt[7]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_3 .original_name {{uut7/r_rt_cnt[3]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_3 .single_bit_orig_name {uut7/r_rt_cnt[3]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_3/Q .original_name {uut7/r_rt_cnt[3]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_2 .original_name {{uut7/r_rt_cnt[2]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_2 .single_bit_orig_name {uut7/r_rt_cnt[2]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_2/Q .original_name {uut7/r_rt_cnt[2]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_1 .original_name {{uut7/r_rt_cnt[1]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_1 .single_bit_orig_name {uut7/r_rt_cnt[1]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_1/Q .original_name {uut7/r_rt_cnt[1]/q}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_0 .original_name {{uut7/r_rt_cnt[0]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_0 .single_bit_orig_name {uut7/r_rt_cnt[0]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_0/Q .original_name {uut7/r_rt_cnt[0]/q}
set_db -quiet inst:uart_ex_top/uut7/r_oe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_oe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_oe_reg .original_name uut7/r_oe
set_db -quiet inst:uart_ex_top/uut7/r_oe_reg .single_bit_orig_name uut7/r_oe
set_db -quiet pin:uart_ex_top/uut7/r_oe_reg/Q .original_name uut7/r_oe/q
set_db -quiet pin:uart_ex_top/uut7/r_oe_reg/QN .original_name uut7/r_oe/q
set_db -quiet inst:uart_ex_top/uut7/r_fe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_fe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_fe_reg .original_name uut7/r_fe
set_db -quiet inst:uart_ex_top/uut7/r_fe_reg .single_bit_orig_name uut7/r_fe
set_db -quiet pin:uart_ex_top/uut7/r_fe_reg/Q .original_name uut7/r_fe/q
set_db -quiet pin:uart_ex_top/uut7/r_fe_reg/QN .original_name uut7/r_fe/q
set_db -quiet inst:uart_ex_top/uut7/r_be_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_be_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_be_reg .original_name uut7/r_be
set_db -quiet inst:uart_ex_top/uut7/r_be_reg .single_bit_orig_name uut7/r_be
set_db -quiet pin:uart_ex_top/uut7/r_be_reg/Q .original_name uut7/r_be/q
set_db -quiet pin:uart_ex_top/uut7/r_be_reg/QN .original_name uut7/r_be/q
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_6 .original_name {{uut7/r_rt_cnt[6]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_6 .single_bit_orig_name {uut7/r_rt_cnt[6]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_6/Q .original_name {uut7/r_rt_cnt[6]/q}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_6/QN .original_name {uut7/r_rt_cnt[6]/q}
set_db -quiet inst:uart_ex_top/uut7/r_pe_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_pe_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_pe_reg .original_name uut7/r_pe
set_db -quiet inst:uart_ex_top/uut7/r_pe_reg .single_bit_orig_name uut7/r_pe
set_db -quiet pin:uart_ex_top/uut7/r_pe_reg/Q .original_name uut7/r_pe/q
set_db -quiet pin:uart_ex_top/uut7/r_pe_reg/QN .original_name uut7/r_pe/q
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_4 .original_name {{uut7/r_rt_cnt[4]}}
set_db -quiet inst:uart_ex_top/uut7/r_rt_cnt_reg_4 .single_bit_orig_name {uut7/r_rt_cnt[4]}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_4/Q .original_name {uut7/r_rt_cnt[4]/q}
set_db -quiet pin:uart_ex_top/uut7/r_rt_cnt_reg_4/QN .original_name {uut7/r_rt_cnt[4]/q}
set_db -quiet inst:uart_ex_top/r_rxd_s2_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/r_rxd_s2_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/r_rxd_s2_reg .original_name r_rxd_s2
set_db -quiet inst:uart_ex_top/r_rxd_s2_reg .single_bit_orig_name r_rxd_s2
set_db -quiet pin:uart_ex_top/r_rxd_s2_reg/Q .original_name r_rxd_s2/q
set_db -quiet pin:uart_ex_top/r_rxd_s2_reg/QN .original_name r_rxd_s2/q
set_db -quiet inst:uart_ex_top/r_rxd_s1_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_ex_top/r_rxd_s1_reg .gint_phase_inversion false
set_db -quiet inst:uart_ex_top/r_rxd_s1_reg .original_name r_rxd_s1
set_db -quiet inst:uart_ex_top/r_rxd_s1_reg .single_bit_orig_name r_rxd_s1
set_db -quiet pin:uart_ex_top/r_rxd_s1_reg/Q .original_name r_rxd_s1/q
set_db -quiet pin:uart_ex_top/r_rxd_s1_reg/QN .original_name r_rxd_s1/q
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
# BEGIN GLO TBR TABLE
set_db -quiet design:uart_ex_top .set_boundary_change_new {start restore}
set_db -quiet design:uart_ex_top .set_boundary_change_new {finish restore}
# END GLO TBR TABLE
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 22.17-s071_1
## flowkit v22.15-s003_1
## Written on 20:43:42 15-Oct 2026
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}
if {[is_attribute flow_plugin_steps -obj_type root]} {set_db flow_plugin_steps {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_remark -obj_type root]} {set_db flow_remark {}}
if {[is_attribute flow_features -obj_type root]} {set_db flow_features {}}
if {[is_attribute flow_feature_values -obj_type root]} {set_db flow_feature_values {}}
if {[is_attribute flow_write_db_args -obj_type root]} {set_db flow_write_db_args {}}
if {[is_attribute flow_write_db_sdc -obj_type root]} {set_db flow_write_db_sdc true}
if {[is_attribute flow_write_db_common -obj_type root]} {set_db flow_write_db_common false}
if {[is_attribute flow_post_db_overwrite -obj_type root]} {set_db flow_post_db_overwrite {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}
if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_db flow_db_directory dbs}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_current_cache -obj_type root]} {set_db flow_current_cache {}}
if {[is_attribute flow_step_order_cache -obj_type root]} {set_db flow_step_order_cache {}}
if {[is_attribute flow_step_results_cache -obj_type root]} {set_db flow_step_results_cache {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_execute_in_global -obj_type root]} {set_db flow_execute_in_global true}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_db flow_overwrite_db false}
if {[is_attribute flow_print_run_information -obj_type root]} {set_db flow_print_run_information false}
if {[is_attribute flow_verbose -obj_type root]} {set_db flow_verbose true}
if {[is_attribute flow_print_run_information_full -obj_type root]} {set_db flow_print_run_information_full false}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_init_header_tcl -obj_type root]} {set_db flow_init_header_tcl {}}
if {[is_attribute flow_init_footer_tcl -obj_type root]} {set_db flow_init_footer_tcl {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_step_last_number -obj_type root]} {set_db flow_step_last_number 0}
if {[is_attribute flow_autoload_applets -obj_type root]} {set_db flow_autoload_applets false}
if {[is_attribute flow_autoload_dir -obj_type root]} {set_db flow_autoload_dir error}
if {[is_attribute flow_skip_auto_db_save -obj_type root]} {set_db flow_skip_auto_db_save true}
if {[is_attribute flow_skip_auto_generate_metrics -obj_type root]} {set_db flow_skip_auto_generate_metrics false}
if {[is_attribute flow_top -obj_type root]} {set_db flow_top {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_yaml_script -obj_type root]} {set_db flow_yaml_script {}}
if {[is_attribute flow_cla_enabled_features -obj_type root]} {set_db flow_cla_enabled_features {}}
if {[is_attribute flow_cla_inject_tcl -obj_type root]} {set_db flow_cla_inject_tcl {}}
if {[is_attribute flow_error_message -obj_type root]} {set_db flow_error_message {}}
if {[is_attribute flow_error_errorinfo -obj_type root]} {set_db flow_error_errorinfo {}}
if {[is_attribute flow_exclude_time_for_init_flow -obj_type root]} {set_db flow_exclude_time_for_init_flow false}
if {[is_attribute flow_error_write_db -obj_type root]} {set_db flow_error_write_db true}
if {[is_attribute flow_advanced_metric_isolation -obj_type root]} {set_db flow_advanced_metric_isolation flow}
if {[is_attribute flow_yaml_root -obj_type root]} {set_db flow_yaml_root {}}
if {[is_attribute flow_yaml_root_dir -obj_type root]} {set_db flow_yaml_root_dir {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}

#############################################################
#####   User Defined Attributes   ###########################

