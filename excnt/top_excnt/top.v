module top(
	input wire	sclk_i,
	input wire	rst_n_i,
	output	wire [7:0]	cnt_o
);

ex_cnt ex_cnt_inst(
	.sclk		(sclk_i),
	.rst_n	(rst_n_i),
	.cnt_w	(cnt_o)
);
endmodule
