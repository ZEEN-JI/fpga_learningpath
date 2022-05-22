`timescale 1ns/1ns

module tb_detect_fsm();
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;

reg rst_n,sclk,detect_on;
wire detect_end_flag;

initial begin
	sclk=0;
	detect_on=0;
	rst_n=0;
	#200
	rst_n=1;
	detect_on=1;
	@(posedge detect_end_flag);
	detect_on=0;
end


integer i;
initial begin
	a=0;
	b=0;
	c=0;
	@(posedge detect_on);
	gen_(100);
	// for(i=0;i<100;i=i+1) begin
	// 	@(posedge sclk)
	// 	a={$random()}%7;
	// 	b={$random()}%7;
	// 	c={$random()}%7;
	// 	// $display("%d",a);
	// 	if(detect_end_flag==1)
	// 		i = 100 + 1;
	// end
	// a=0;
	// b=0;
	// c=0;
end


task gen_;
	integer i;
	// output [7:0] a,b,c;
	input [7:0] len_;
	begin
		for(i=0;i<len_;i=i+1) begin
			@(posedge sclk)
			a={$random()}%7;
			b={$random()}%7;
			c={$random()}%7;
			// $display("%d",a);
			if(detect_end_flag==1)
				i = len_ + 1;
		end
		a=0;
		b=0;
		c=0;
	end
endtask
always #(10) sclk = ~sclk;
detect_fsm detect_fsm_inst(
	.sclk (sclk),
	.rst_n (rst_n),
	.a (a),
	.b (b),
	.c (c),
	.detect_on (detect_on),
	.detect_end_flag (detect_end_flag)
);

endmodule
