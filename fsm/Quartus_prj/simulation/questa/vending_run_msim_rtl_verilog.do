transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/lab3/RTL {D:/colleage/fpga/lab3/RTL/simple_fsm.v}

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/lab3/Quartus_prj/../Sim {D:/colleage/fpga/lab3/Quartus_prj/../Sim/tb_simple_fsm.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_simple_fsm

add wave *
view structure
view signals
run 1 us
