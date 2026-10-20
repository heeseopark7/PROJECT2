################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 10/21/2026 02:07:45
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_physical -lef {/home/hah013/PROJ2/proj2_make/TOP/3_SYN/../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /home/hah013/PROJ2/proj2_make/TOP/3_SYN/../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /home/hah013/PROJ2/proj2_make/TOP/3_SYN/../../../../SoC/GPDK045/digital/giolib045_v3.5/lef/giolib045.lef}

read_netlist ./mapped/uart_ex_top_mapped.v

init_design
