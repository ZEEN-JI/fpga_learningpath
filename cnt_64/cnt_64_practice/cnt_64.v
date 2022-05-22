module cnt_64(
	input wire sclk,
	input wire rst_n,
	output wire [7:0] cnt_w
);
reg [7:0] cnt;
assign cnt_w = cnt;
//reg ctrl_flag;

//always @(posedge sclk or negedge rst_n)
//	if(rst_n == 1'b1)
//		ctrl_flag = 1'b0;
//	else if(cnt == 8'd63)
//	
//	else if(cnt == 


always @(posedge sclk or negedge rst_n)
	if(rst_n==1'b0)
		cnt <= 1'b0;
	else if(cnt == 8'd63)
		cnt <= 8'd0;
	else if(cnt >= 8'd0 && cnt < 8'd63)
		cnt <= cnt + 1'b1;


endmodule
