module detect_fsm(
	input wire [7:0] a,
	input wire [7:0] b,
	input wire [7:0] c,
	input wire rst_n, sclk,detect_on,
	output reg detect_end_flag
);

reg [2:0] state;
reg [3:0] detect_cnt;
reg detect_end;
// assign detect_end_flag = detect_end;
parameter IDLE = 3'b001;
parameter DETECT = 3'b010;
parameter DETECT_OK = 3'b100;


always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		state<=IDLE;
	else begin
		case(state) 
			IDLE:		if(detect_on==1)
							state<=DETECT;
			DETECT: 	if(detect_cnt == 5)
							state <= DETECT_OK;
						else if (detect_end_flag == 1)
							state <= IDLE;
			DETECT_OK:  state<=DETECT;
			default:	state<=IDLE;
		endcase
	end

always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		detect_end_flag <= 0;
	else if(state == DETECT_OK)
		detect_end_flag <= 1;
	
	
always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		detect_cnt <= 0;
	else if((state==DETECT) && ((a+b+c) == 11))
		detect_cnt <= detect_cnt + 'b1;
	else if (state==DETECT_OK)
		detect_cnt <= 'b0;
//	else
//		detect_cnt <= 'b0;

endmodule
			