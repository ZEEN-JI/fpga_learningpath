module decoder_1
(
    input wire [2:0] a,
    input wire rst_n,
    output reg [7:0] Y
    output reg Ys,Yex
);

always @(*) begin
    if(rst_n == 0)
        Y = 8'hff;
    else begin
        case (a)
            3'b000: Y<= 8'b00000001;
            3'b001: Y<= 8'b00000010;
            3'b010: Y<= 8'b00000100;
            3'b011: Y<= 8'b00001000;
            3'b100: Y<= 8'b00010000;
            3'b101: Y<= 8'b00100000;
            3'b110: Y<= 8'b01000000;
            3'b111: Y<= 8'b10000000;
            default: Y<=8'hff;
        endcase
    end
end



endmodule