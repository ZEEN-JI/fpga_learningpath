quit -sim
vlib work
vlog ./tb_fsm_1.v
vlog ./../design/*.v

vsim -voptargs=+acc work.tb_fsm_1

virtual type {
{01 IDLE}
{02 WRITE}
{04 READ}
{08 CHECK}
{10 ERROR}
} virtual_new_signal

virtual function {(vritual_new_signal)tb_fsm_1/fsm_1_inst/state} new_state

add wave -colo red fsm_1_inst/new_state
add wave fsm_1_inst/*

run 100us
