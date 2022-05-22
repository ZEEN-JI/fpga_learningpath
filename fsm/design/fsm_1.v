module fsm_1(
	input wire rst_n,sclk,
	input wire write_start,
	output wire	error_flag
);

parameter	IDLE=5'b00001,
				WRITE=5'b00010,
				READ = 5'b00100,
				CHECK = 5'b01000,
				ERROR = 5'b10000;

reg [4:0] state;
reg write_end;
reg [9:0] write_cnt;
reg [9:0] read_cnt;
reg read_end;

always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		state<=IDLE;
	else begin
		case(state)
			IDLE: if(write_start == 1'b1)
						state <= WRITE;
			WRITE:if(write_end == 1'b1)
						state <= READ;
			READ: if(read_end == 'b1)
						state <= CHECK;
			CHECK:if((|write_cnt) == 1'd0 && (|read_cnt)==1'b0)
						state <= IDLE;
					else
						state<=ERROR;
						
			ERROR: state<=ERROR;
			default:state <= IDLE;
		endcase
	end


always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		write_cnt <='d0;
	else if(state == WRITE)
		write_cnt<=write_cnt + 1'b1;
	else
		write_cnt <= 1'b0;

	
always @(posedge sclk or negedge rst_n)
	if(rst_n == 1'b0)
		write_end <= 1'b0;
	else if (write_cnt == 'd1022)
		write_end <= 1'b1;
	else
		write_end <= 1'b0;
		
always @(sclk or negedge rst_n)
	if(rst_n == 1'b0)
		read_cnt <= 1'b0;
	else if(state == READ)
		read_cnt <= read_cnt + 1'b1;
	else
		read_cnt <= 1'b0;
		
always @(posedge sclk or negedge rst_n)
		if(rst_n==1'b0)
			read_end <= 1'b0;
		else if(read_cnt == 'd1022)
			read_end <= 1'b1;
		else
			read_end <= 1'b0;

assign error_flag=state[4];
			
endmodule
