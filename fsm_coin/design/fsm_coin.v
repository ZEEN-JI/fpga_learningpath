module fsm_coin(
	input wire pi_money,
	input wire rst_n, sclk_t,
	output reg po_cola
);


reg [2:0] state;
parameter IDLE = 3'b001;
parameter ONE = 3'b010;
parameter TWO = 3'b100;


always @(posedge sclk_t or negedge rst_n)
	if(rst_n == 1)
		state = IDLE;
	else begin
		case(state) begin
			IDLE: if(pi_money==1)
						state<=ONE;
					
			ONE:	if(pi_money==1)
						state<=ONE;
			TWO:	if(pi_money==1)
						state<=IDLE;
			default: state<=IDLE;
		endcase
	end

always @(posedge sclk_t or negedge rst_n)
	if(rst_n==1)
		po_cola<=0;
	else if ((state==TWO) && (pi_money==1))
		po_cola<=1;
	else
		po_cola<=0;