quit -sim
vlib work
vlog ./tb_detect_fsm.v
vlog ./../design/*.v

vsim -voptargs=+acc work.tb_detect_fsm

add wave detect_fsm_inst/*

run 2500ns