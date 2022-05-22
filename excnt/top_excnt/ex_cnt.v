
module ex_cnt(
	input	wire	sclk,
	input wire	rst_n,
	output	wire	[7:0]	cnt_w

);

reg	[7:0]	cnt;
reg	ctrl_flag;
assign cnt_w = cnt;

always @(posedge sclk or negedge rst_n) //异步复位
	if(rst_n == 1'b0)
		cnt<= 1'b0;
	else if (ctrl_flag == 1'b0 && cnt!=8'd255)
		cnt <= cnt + 1'b1;
	else if(cnt != 8'd0)
		cnt <= cnt - 1'b1;
		
always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		ctrl_flag <= 1'b0;
	else if((|cnt)==1'd0)
		ctrl_flag <= 1'b0;
	else if((&cnt) == 1'b1)
		ctrl_flag <= 1'b1;
//always @(posedge sclk) //同步复位 复位只在时钟上升沿发生
endmodule


