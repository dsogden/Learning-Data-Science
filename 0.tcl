mol new ../step3_input.psf
mol addfile ../step3_input.pdb

mol new ../step3_input.psf
mol addfile ../output/0/replica.0.dcd type dcd first 0 last -1 filebonds 1 autobonds 1 waitfor all

source functions.tcl
source calculate.tcl

