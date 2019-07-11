read_lef  -lef /tech/NANGATE/NangateOpenCellLibrary_PDKv1_2_v2008_10.lef -tech also
read_lef -lef vedic.lef
read_verilog -v 2mult.vg
elaborate mult2
set_floorplan_parameters -WIDTH 500 -HEIGHT 500
set_floorplan -force -partition mult2
write_def -output mult2.def --overwrite
defIn -def mult.def --all

create_net -type power -name VDD
create_net -type ground -name VSS

addPowerRing -offset {0,0} -spacing 1 -width 1 -layerH metal7 -layerV metal8 -nets {VDD,VSS}
addHardMacroPowerRing -offset {1,1} -spacing 1 -width 1 -layerH metal7 -layerV metal8 -nets {VDD,VSS} -instance U1
addHardMacroPowerRing -offset {1,1} -spacing 1 -width 1 -layerH metal7 -layerV metal8 -nets {VDD,VSS} -instance U3
