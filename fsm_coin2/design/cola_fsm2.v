module cola_fsm2(
    input wire rst_n,sclk,
    input wire half_,one_,
    output reg po_money, po_cola
);

reg [4:0] state;
parameter [4:0] STAT [4:0] = {5'b00001, 5'b00010,5'b00100,5'b01000,5'b10000};
assign state = STAT[0];


task coin_in:
begin
    if(half_ == 1)
        state <= (state << 1);
    else if(one_ == 1)
        state <= (state << 2);
    else
        state <= state;
end
endtask

always @(posedge sclk or negedge rst_n) begin
    if(rst_n == 1)
        state <= STAT[0];
    else begin
        case (state)
            STAT[0]:coin_in;
            STAT[1]:coin_in;
            STAT[2]:coin_in;
            STAT[3]:if((half_==0) && (one_ == 1))
                        state <= STAT[0];
                    else if ((half_==1)&&(one_==0))
                        state <= STAT[4];
            STAT[4]:if((half_==1) || (one_==1))
                        state <= STAT[0];
            default: state <= STAT[0]; 
        endcase
    end
end

always @(posedge sclk or negedge rst_n) begin
    if(rst_n == 1)
        po_cola <= 0;
    else if ((state==STAT[3])&&(one_==1))
        po_cola <= 1;
    else if ((state==STAT[4])&&(one_==1||half_==1))
        po_cola <= 1;
end


always @(posedge sclk or negedge rst_n) begin
    if(rst_n == 1)
        po_money <= 0;
    else if((state==STAT[4])&&(one_==1))
        po_money <= 1;
    else
        po_money <= 0;
end


endmodule