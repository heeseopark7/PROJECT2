#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Nov  5 01:00:47 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v22.17-s086_1 (64bit) 09/24/2024 10:51 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.17-s086_1 NR240905-1647/22_17-UB (database version 18.20.629) {superthreading v2.20}
#@(#)CDS: AAE 22.17-s013 (64bit) 09/24/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.17-s017_1 () Sep 12 2024 04:53:54 ( )
#@(#)CDS: SYNTECH 22.17-s006_1 () Aug 12 2024 03:52:27 ( )
#@(#)CDS: CPE v22.17-s051
#@(#)CDS: IQuantus/TQuantus 21.2.2-s369 (64bit) Tue May 7 14:30:42 PDT 2024 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set enc_check_rename_command_name 1
set init_gnd_net VSS
set init_lef_file {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef}
set init_verilog ../3_SYN/mapped/uart_ex_top_syn_final.v
set init_mmmc_file uart_ex_top.mmmc.view
set init_top_cell uart_ex_top
set init_pwr_net VDD
init_design
checkDesign -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign
floorPlan -site CoreSite -r 1 0.7 30 30 30 30
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 2.0 -pin {PWDATA[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 3 -spreadType center -spacing 2.0 -pin {PRDATA[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 4 -spreadType center -spacing 4.0 -pin {PCLK PRESETn PSEL PENABLE PWRITE UARTRXD PADDR[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 4 -spreadType center -spacing 4.0 -pin {PREADY PSLVERR UARTTXD UARTRXINTR UARTTXINTR UARTRTINTR UARTEINTR UARTINTR}
setPinAssignMode -pinEditInBatch false
report_analysis_views
timeDesign -prePlace
saveDesign -def InitDesign
fit
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { corePin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal10 -direction vertical -width 5 -spacing 5 -set_to_set_distance 40 -start_from left -start_offset 10 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer Metal11 -direction horizontal -width 5 -spacing 5 -set_to_set_distance 40 -start_from bottom -start_offset 10 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None
set_verify_drc_mode -area {0 0 0 0}
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_ndr_spacing auto -check_only default -check_same_via_cell true -exclude_pg_net false -ignore_trial_route false -ignore_cell_blockage false -use_min_spacing_on_block_obs auto -report uart_ex_top.drc.rpt -limit 1000
verify_drc
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer
verifyConnectivity -type all -noOpen -noAntenna -noWeakConnect -noUnConnPin -noUnroutedNet -error 1000 -warning 50
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer
violationBrowser -all -no_display_false -displayByLayer
violationBrowserClose
saveDesign -def PowerPlan
zoomBox -60.71450 -26.59800 183.89750 192.38200
zoomBox -15.66600 -7.19150 161.06600 151.02150
setDontUse SRDFFX1 true
setDontUse SRDFFSX1 true
setDontUse SRDFFSRX1 true
setDontUse SRDFFSRQX1 true
setDontUse SRDFFSQX1 true
setDontUse SRDFFRX1 true
setDontUse SRDFFRQX1 true
setDontUse SRDFFQX1 true
setDontUse SRDFFNX1 true
setDontUse SRDFFNSX1 true
setDontUse SRDFFNSRX1 true
setDontUse SRDFFNSRQX1 true
setDontUse SRDFFNSQX1 true
setDontUse SRDFFNRX1 true
setDontUse SRDFFNRQX1 true
setDontUse SRDFFNQX1 true
setDontUse RTLATX1 true
setDontUse RTLATSRX1 true
setDontUse RTLATRX1 true
setDontUse RDFFX1 true
setDontUse RDFFSX1 true
setDontUse RDFFSRX1 true
setDontUse RDFFSRQX1 true
setDontUse RDFFSQX1 true
setDontUse RDFFRX1 true
setDontUse RDFFRQX1 true
setDontUse RDFFQX1 true
setDontUse RDFFNX1 true
setDontUse RDFFNSX1 true
setDontUse RDFFNSRX1 true
setDontUse RDFFNSRQX1 true
setDontUse RDFFNSQX1 true
setDontUse RDFFNRX1 true
setDontUse RDFFNRQX1 true
setDontUse RDFFNQX1 true
setDontUse PINVX1 true
setDontUse LSLHX1_TO true
setDontUse LSLHX1_FROM true
setDontUse LSLH_ISONL_X1_TO_ON true
setDontUse LSLH_ISONL_X1_FROM_OFF true
setDontUse LSLH_ISONH_X1_TO_ON true
setDontUse LSLH_ISONH_X1_FROM_OFF true
setDontUse LSLH_ISOL_X1_TO_ON true
setDontUse LSLH_ISOL_X1_FROM_OFF true
setDontUse LSLH_ISOH_X1_TO_ON true
setDontUse LSLH_ISOH_X1_FROM_OFF true
setDontUse LSHLX1_FROM true
setDontUse LSHL_ISONL_X1_FROM_OFF true
setDontUse LSHL_ISONH_X1_FROM_OFF true
setDontUse LSHL_ISOL_X1_FROM_OFF true
setDontUse LSHL_ISOH_X1_FROM_OFF true
setDontUse ISONLX1_OFF true
setDontUse ISOLX1_OFF true
setDontUse ISOHX1_OFF true
setDontUse ISOHLDX1_OFF true
setDontUse HSWX1 true
setDontUse HSWNX1 true
setDontUse HSWDX1 true
setDontUse HSWDNX1 true
setDontUse FSWX1 true
setDontUse FSWNX1 true
setDontUse BUFX2 true
setPlaceMode -place_global_cong_effort high
place_design
checkPlace uart_ex_top.checkPlace
setRouteMode -earlyGlobalMinRouteLayer 1 -earlyGlobalMaxRouteLayer 11 -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
earlyGlobalRoute
reportCongestion -hotSpot
reportCongestion -overflow
setDrawView place
setLayerPreference densityMap -isVisible 1
setLayerPreference densityMap -isVisible 0
setLayerPreference pinDensityMap -isVisible 1
setLayerPreference pinDensityMap -isVisible 0
place_opt_design
earlyGlobalRoute
reportCongestion -hotSpot
reportCongestion -overflow
timeDesign -preCTS -outDir reports/timing/preCTS
checkDesign -place
saveDesign -def PlaceOpt
setDontUse SRDFFX1 true
setDontUse SRDFFSX1 true
setDontUse SRDFFSRX1 true
setDontUse SRDFFSRQX1 true
setDontUse SRDFFSQX1 true
setDontUse SRDFFRX1 true
setDontUse SRDFFRQX1 true
setDontUse SRDFFQX1 true
setDontUse SRDFFNX1 true
setDontUse SRDFFNSX1 true
setDontUse SRDFFNSRX1 true
setDontUse SRDFFNSRQX1 true
setDontUse SRDFFNSQX1 true
setDontUse SRDFFNRX1 true
setDontUse SRDFFNRQX1 true
setDontUse SRDFFNQX1 true
setDontUse RTLATX1 true
setDontUse RTLATSRX1 true
setDontUse RTLATRX1 true
setDontUse RDFFX1 true
setDontUse RDFFSX1 true
setDontUse RDFFSRX1 true
setDontUse RDFFSRQX1 true
setDontUse RDFFSQX1 true
setDontUse RDFFRX1 true
setDontUse RDFFRQX1 true
setDontUse RDFFQX1 true
setDontUse RDFFNX1 true
setDontUse RDFFNSX1 true
setDontUse RDFFNSRX1 true
setDontUse RDFFNSRQX1 true
setDontUse RDFFNSQX1 true
setDontUse RDFFNRX1 true
setDontUse RDFFNRQX1 true
setDontUse RDFFNQX1 true
setDontUse PINVX1 true
setDontUse LSLHX1_TO true
setDontUse LSLHX1_FROM true
setDontUse LSLH_ISONL_X1_TO_ON true
setDontUse LSLH_ISONL_X1_FROM_OFF true
setDontUse LSLH_ISONH_X1_TO_ON true
setDontUse LSLH_ISONH_X1_FROM_OFF true
setDontUse LSLH_ISOL_X1_TO_ON true
setDontUse LSLH_ISOL_X1_FROM_OFF true
setDontUse LSLH_ISOH_X1_TO_ON true
setDontUse LSLH_ISOH_X1_FROM_OFF true
setDontUse LSHLX1_FROM true
setDontUse LSHL_ISONL_X1_FROM_OFF true
setDontUse LSHL_ISONH_X1_FROM_OFF true
setDontUse LSHL_ISOL_X1_FROM_OFF true
setDontUse LSHL_ISOH_X1_FROM_OFF true
setDontUse ISONLX1_OFF true
setDontUse ISOLX1_OFF true
setDontUse ISOHX1_OFF true
setDontUse ISOHLDX1_OFF true
setDontUse HSWX1 true
setDontUse HSWNX1 true
setDontUse HSWDX1 true
setDontUse HSWDNX1 true
setDontUse FSWX1 true
setDontUse FSWNX1 true
setDontUse BUFX2 true
set_ccopt_property target_skew 0.01
create_ccopt_clock_tree_spec
ccopt_design
all_constraint_modes -active
set_interactive_constraint_modes [all_constraint_modes -active] 
set_propagated_clock [all_clocks]
timeDesign -postCTS -outDir reports/timing/postCTS
report_ccopt_clock_trees -file reports/clock/clock_trees.rpt
report_ccopt_skew_groups -file reports/clock/skew_groups.rpt
report_clock_timing -type skew -nworst 5 > reports/clock/skew.rpt
optDesign -postCTS
optDesign -postCTS -hold
timeDesign -postCTS -outDir reports/timing/postCTS
timeDesign -postCTS -outDir reports/timing/postCTS -hold
saveDesign -def PostCTSopt
setDontUse SRDFFX1 true
setDontUse SRDFFSX1 true
setDontUse SRDFFSRX1 true
setDontUse SRDFFSRQX1 true
setDontUse SRDFFSQX1 true
setDontUse SRDFFRX1 true
setDontUse SRDFFRQX1 true
setDontUse SRDFFQX1 true
setDontUse SRDFFNX1 true
setDontUse SRDFFNSX1 true
setDontUse SRDFFNSRX1 true
setDontUse SRDFFNSRQX1 true
setDontUse SRDFFNSQX1 true
setDontUse SRDFFNRX1 true
setDontUse SRDFFNRQX1 true
setDontUse SRDFFNQX1 true
setDontUse RTLATX1 true
setDontUse RTLATSRX1 true
setDontUse RTLATRX1 true
setDontUse RDFFX1 true
setDontUse RDFFSX1 true
setDontUse RDFFSRX1 true
setDontUse RDFFSRQX1 true
setDontUse RDFFSQX1 true
setDontUse RDFFRX1 true
setDontUse RDFFRQX1 true
setDontUse RDFFQX1 true
setDontUse RDFFNX1 true
setDontUse RDFFNSX1 true
setDontUse RDFFNSRX1 true
setDontUse RDFFNSRQX1 true
setDontUse RDFFNSQX1 true
setDontUse RDFFNRX1 true
setDontUse RDFFNRQX1 true
setDontUse RDFFNQX1 true
setDontUse PINVX1 true
setDontUse LSLHX1_TO true
setDontUse LSLHX1_FROM true
setDontUse LSLH_ISONL_X1_TO_ON true
setDontUse LSLH_ISONL_X1_FROM_OFF true
setDontUse LSLH_ISONH_X1_TO_ON true
setDontUse LSLH_ISONH_X1_FROM_OFF true
setDontUse LSLH_ISOL_X1_TO_ON true
setDontUse LSLH_ISOL_X1_FROM_OFF true
setDontUse LSLH_ISOH_X1_TO_ON true
setDontUse LSLH_ISOH_X1_FROM_OFF true
setDontUse LSHLX1_FROM true
setDontUse LSHL_ISONL_X1_FROM_OFF true
setDontUse LSHL_ISONH_X1_FROM_OFF true
setDontUse LSHL_ISOL_X1_FROM_OFF true
setDontUse LSHL_ISOH_X1_FROM_OFF true
setDontUse ISONLX1_OFF true
setDontUse ISOLX1_OFF true
setDontUse ISOHX1_OFF true
setDontUse ISOHLDX1_OFF true
setDontUse HSWX1 true
setDontUse HSWNX1 true
setDontUse HSWDX1 true
setDontUse HSWDNX1 true
setDontUse FSWX1 true
setDontUse FSWNX1 true
setDontUse BUFX2 true
setNanoRouteMode -quiet -drouteFixAntenna 1
setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithEco 0
setNanoRouteMode -quiet -routeWithLithoDriven 0
setNanoRouteMode -quiet -droutePostRouteLithoRepair 0
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeTdrEffort 8
setNanoRouteMode -quiet -drouteAutoStop 0
setNanoRouteMode -quiet -routeSelectedNetOnly 0
setNanoRouteMode -quiet -routeTopRoutingLayer 11
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 5
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail
zoomBox -58.21550 -31.02950 186.39650 187.95050
getMultiCpuUsage -localCpu
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_ndr_spacing auto -check_only default -check_same_via_cell true -exclude_pg_net false -ignore_trial_route false -ignore_cell_blockage false -use_min_spacing_on_block_obs auto -report uart_ex_top.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer
violationBrowserReport -all -no_display_false -report uart_ex_top.viols.rpt
zoomBox -4.61050 3.64900 145.61250 138.13050
zoomBox 35.70450 30.30900 114.12150 100.50900
zoomBox 8.29550 11.75950 135.98500 126.06900
