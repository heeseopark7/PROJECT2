
########################################
# InitDesign (Setup, Floorplan)
# uart_ex_top :: NO IO PAD version
########################################

## Initialization
set GPDK ../../../../SoC/GPDK045/digital
set init_gnd_net VSS
# IO pad LEF (giolib045) is not used because this design has no pads
set init_lef_file [list \
    $GPDK/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef \
    $GPDK/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef \
    $GPDK/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef \
]
set init_verilog ../3_SYN/mapped/uart_ex_top_syn_final.v
set init_mmmc_file uart_ex_top.mmmc.view
# No init_io_file : there are no pads. Pins are placed with editPin below.
set init_top_cell uart_ex_top
set init_pwr_net VDD
init_design

## Check Design  (-io is skipped: no pad cells)
checkDesign -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign

##################################################
## Floorplan
## Synthesized area is about 6630 um^2 (cell 4998 + net 1630)
## -r <aspect> <utilization> <core2left> <core2bottom> <core2right> <core2top>
## Utilization 0.7 -> core is about 97 x 97 um
## 30 um margin leaves room for the power ring (5+5+5+5 + offset 5 = 25 um)
##################################################
floorPlan -site CoreSite -r 1 0.7 30 30 30 30

##################################################
## Pin placement (no pads, so place the ports on the die edge)
##   Left   : PWDATA[31:0]                      (input,  horizontal layer)
##   Right  : PRDATA[31:0]                      (output, horizontal layer)
##   Bottom : PCLK PRESETn PSEL PENABLE PWRITE PADDR[11:2] UARTRXD (input, vertical layer)
##   Top    : PREADY PSLVERR UARTTXD UART*INTR  (output, vertical layer)
## Metal3 = horizontal, Metal4 = vertical in GPDK045
##################################################
setPinAssignMode -pinEditInBatch true

editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left   -layer 3 -spreadType center -spacing 2.0 -pin {PWDATA[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right  -layer 3 -spreadType center -spacing 2.0 -pin {PRDATA[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 4 -spreadType center -spacing 4.0 -pin {PCLK PRESETn PSEL PENABLE PWRITE UARTRXD PADDR[*]}
editPin -fixedPin 1 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top    -layer 4 -spreadType center -spacing 4.0 -pin {PREADY PSLVERR UARTTXD UARTRXINTR UARTTXINTR UARTRTINTR UARTEINTR UARTINTR}

setPinAssignMode -pinEditInBatch false

# Verify Timing
report_analysis_views 
timeDesign -prePlace

## If there is no error, Save Design
saveDesign -def InitDesign
exit
