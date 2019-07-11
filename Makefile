clean:
	rm -rf proton.log* proton.cmd*


sta:
	/OpenSTA/app/sta -f sta.tcl

block:
	proton -f create_hard_block.tcl
