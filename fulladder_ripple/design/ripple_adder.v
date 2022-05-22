module ripple_adder(
	input wire [31:0] a,b,sum_4,
	input c,co
);

wire [31:0] co_temp;


fulladd fulladd_inst0(
	.x	(a[0]),
	.y	(b[0]),
	.cin (c==1'b1?1'b1:1'b0),
	.res 	(sum_4[i]),
	.cout (co_temp[i]));

genvar i;
generate
	for(i=1; i<32; i=i+1'b1) begin: adder_gen
	fulladd fulladd_inst(
		.x	(a[0]),
		.y	(b[0]),
		.cin (co_temp[i-1]),
		.res 	(sum_4[i]),
		.cout (co_temp[i]));
	end
endgenerate
		
assign co = co_temp[31];

endmodule



