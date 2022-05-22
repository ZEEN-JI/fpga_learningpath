quit -sim
vlib work

vlog ./tb_fsm_coin.v
vlog ./../design/*.v

vsim -voptargs=+acc work.tb_fsm_coin

run 100us