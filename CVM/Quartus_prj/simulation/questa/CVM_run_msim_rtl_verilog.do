transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/CVM/RTL {D:/colleage/fpga/CVM/RTL/CVM.v}

vlog -vlog01compat -work work +incdir+D:/colleage/fpga/CVM/Quartus_prj/../Sim {D:/colleage/fpga/CVM/Quartus_prj/../Sim/tb_CVM.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_CVM

add wave *
view structure
view signals
run 1 us
