`timescale 1ns/1ps

module tb_top();
reg	sclk,rst_n;
wire	[7:0]	cnt;
wire o1,o2;
initial begin
	sclk=0;
	rst_n = 0;
#100
	rst_n = 1;
end

always #10 sclk=~sclk;

top top_inst(
	.sclk_t	(sclk),
	.rst_n_t	(rst_n),
	.wo1	(o1),
	.wo2	(o2)
);


endmodule
