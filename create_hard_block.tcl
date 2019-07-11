read_lef  -lef /tech/NANGATE/NangateOpenCellLibrary_PDKv1_2_v2008_10.lef -tech also
read_verilog -v /home/olutuleoatiq/vedicmultiplier/vedic.vg
elaborate vedic_16x16
set_floorplan 
create_net -type power -name VDD
create_net -type ground -name VSS
addPowerRing -offset{0.2,0.2} -spacing 0.5 -width 1 -layerV metal4 -layerH metal5 -nets {VDD,VSS}
addPowerRows -width 0.18 -layer metal1 -nets {VDD,VSS}
addPowerVias
place_graywolf
def2lef -output vedic.lef 
