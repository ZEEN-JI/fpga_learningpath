`timescale 1ns/10ps;

module adder_test;
reg [3:0] a;
reg [3:0] b;
wire [3:0] so;
wire [3:0] co;

initial begin
	a=4'd5;
	b=4'd2;
	#10
	a=4'd10;
	b=4'd8;
end

ripple_adder ripple_adder_inst(
	.a(a),
	.b(b),
	.c(1'b0),
	.co(co),
	.so(so)
);

 initial begin
	  forever begin
			#100;
			if ($time >= 1000)  $finish ;
	  end
 end
 
 endmodule
 