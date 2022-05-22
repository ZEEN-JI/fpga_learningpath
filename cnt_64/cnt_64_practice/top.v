module top(wo1,wo2,rst_n_t,sclk_t);

output wire wo1;
output wire wo2;
input wire rst_n_t;
input wire sclk_t;
wire [7:0] cnt_connect;

cnt_64 cnt_64_inst(
	.sclk	(sclk_t),
	.rst_n (rst_n_t),
	.cnt_w (cnt_connect)
);

Di_wave Di_wave_inst(
	.sclk_i	(sclk_t),
	.rst_n_i	(rst_n_t),
	.cnt_w_i (cnt_connect),
	.waveo1	(wo1),
	.waveo2	(wo2)
);


endmodule
