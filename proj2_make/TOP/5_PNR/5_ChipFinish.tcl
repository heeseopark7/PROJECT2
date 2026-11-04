#######################
#### Chip Finish ######
#######################
restoreDesign RouteDesign.dat

## Re-apply global PG connection right after restore (also covers CTS/opt inserted cells)
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *

# Add Filler
getFillerMode -quiet
addFiller -cell FILL1 FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 -prefix FILLER

# DRC
verify_drc

# LVS : Connectivity 
verifyConnectivity -type all -geomConnect -noAntenna -error 1000 -warning 50

# Process antenna check for signal nets (verifyConnectivity skips it with -noAntenna)
verifyProcessAntenna -reportfile uart_ex_top.antenna.rpt -error 1000

# Error Browser
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer

# Extraction 
extractRC

# If there is no error, save Design
saveDesign -rc -def ChipFinish

#####################
#### Write Out ######
#####################
# Write Out Files

# Netlist  file : -flat options is useful to next tool stages
saveNetlist -flat -uart_ex_top.v

# SDF OUT, but I recommend to use sdf file which is from Tempus tool
# SDF version 3.0 :: RECREM included in the SDF file
write_sdf uart_ex_top.sdf

# SDF version 2.1
write_sdf -version 2.1 uart_ex_top.sdf_2.1

# Write Out Constraint
writeTimingCon uart_ex_top.sdc

# GDS file : without layermap file for GPDK045
streamOut uart_ex_top.gds -libName DesignLib -units 2000 -mode ALL

exit
