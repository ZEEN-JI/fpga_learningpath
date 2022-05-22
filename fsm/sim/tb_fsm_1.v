module tb_fsm_1;
reg sclk_t,rst_n;
reg write_start;
wire error_flag;




initial begin
	sclk_t=0;
	rst_n=0;
	#100
	rst_n=1;
end

always #(10) sclk_t = ~sclk_t;

initial begin
#47280
force fsm_1_inst.read_cnt=10'd2;
end

initial begin
	write_start=0;
	#300
	write_start=1;
	#30
	write_start=0;
end

fsm_1 fsm_1_inst(
	.sclk (sclk_t),
	.rst_n (rst_n),
	.write_start (write_start),
	.error_flag (error_flag)
);

endmodule
