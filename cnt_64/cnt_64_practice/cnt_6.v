module counter6(sclk, rst_n, en, dout, co);

input clk, rst_n, en;
output [3:0] dout;
reg [3:0] dout;
output co;

always @(posedge clk or negedge rst_n)
begin
	if(rst_n==1)
		dout<=0;
	else if(en)
		if(dout == 4'b0101)
			dout<=0;
		else
			dout<=dout+1;
	else
		dout<=dout;
end

assign co = dout[0]&dout[2];
endmodule 