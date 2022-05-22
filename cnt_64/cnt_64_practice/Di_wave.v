module Di_wave(
	input wire sclk_i,rst_n_i,
	input wire [7:0]	cnt_w_i,
	output wire waveo1,waveo2
);


reg o1,o2;
reg [7:0] cin;
reg [3:0] o2_flag;

assign waveo1 = o1;
assign waveo2 = o2;
//assign cnt_w_i = cin;




always @(posedge sclk_i or negedge rst_n_i)
	if(rst_n_i == 1'b0)
		o1 <= 1'b0;
	else if (cnt_w_i == 8'd63)
		o1 <= 1'b1;
	else
		o1 <= 1'b0;

		
always @(posedge sclk_i or negedge rst_n_i)
	if(rst_n_i == 1'b0)
		begin
			o2 <= 1'b0;
			o2_flag <= 4'd0;
		end
	else if(o2_flag == 4'd3 && cnt_w_i == 8'd63)
		begin
			o2 <= 1'b1;
			o2_flag <= 4'd0;
		end
	else if(cnt_w_i == 8'd63 && o2_flag < 4'd3)
		begin
			o2_flag <= o2_flag + 1'b1;
			o2 <= 1'b0;
		end
	else
		o2 <= 1'b0;
		
endmodule
