transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Kartik U C/Documents/GitHub/EE739-Superscalar/DUT.vhdl}
vcom -93 -work work {C:/Users/Kartik U C/Documents/GitHub/EE739-Superscalar/robtest.vhd}

vcom -93 -work work {C:/Users/Kartik U C/Documents/GitHub/EE739-Superscalar/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
