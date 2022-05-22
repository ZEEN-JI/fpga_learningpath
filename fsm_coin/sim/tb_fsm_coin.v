module tb_fsm_coin();
	reg sclk;
	reg rst_n;
	reg pi_money;
	
	wire po_cola;
	
	initial 
		begin
			sclk=0;
			rst_n=0;
			pi_money=0;
			#100
			rst_n=1'b1;
		end
	always #10 sclk=~sclk;
	always #20 pi_money <={$random};
	fsm_coin fsm_coin_inst(
		.sclk	(sclk),
		.rst_n (rst_n),
		.pi_money (pi_money),
		.po_cola (po_cola)
	);
	
endmodule