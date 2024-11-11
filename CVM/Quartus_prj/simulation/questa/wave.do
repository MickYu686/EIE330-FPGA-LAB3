onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_CVM/sys_clk
add wave -noupdate /tb_CVM/sys_rst_n
add wave -noupdate /tb_CVM/coin
add wave -noupdate /tb_CVM/cola
add wave -noupdate /tb_CVM/return_coins
add wave -noupdate /tb_CVM/st_cur
add wave -noupdate /tb_CVM/st_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {967173 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 ns}
