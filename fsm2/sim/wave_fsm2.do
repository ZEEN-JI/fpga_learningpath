onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/a
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/b
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/c
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/rst_n
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/sclk
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/detect_on
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/detect_end_flag
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/state
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/detect_cnt
add wave -noupdate /tb_detect_fsm/detect_fsm_inst/detect_end
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2120 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 265
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1550 ns} {2439 ns}
