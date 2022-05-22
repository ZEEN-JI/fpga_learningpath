`timescale 1ns/1ps

module tb_top();
reg	sclk,rst_n;
wire	[7:0]	cnt;

initial begin
	sclk=0;
	rst_n = 0;
#100
	rst_n = 1;
end

always #10 sclk=~sclk;

top top_inst(
	.sclk_i	(sclk),
	.rst_n_i	(rst_n),
	.cnt_o	(cnt)
);


endmodule
