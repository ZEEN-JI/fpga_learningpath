`timescale 1ns/100ps

module tb_decoder_1 ();

wire rst_n;
reg [2:0] a;
reg [7:0] Y;



initial begin
    rst_n = 0;
    // sclk = 0;
    #100
    rst_n = 1;
    // sclk = 1;
    a = 0;
    integer i;

    for(i=0;i < 8; i = i + 1) begin
        a = a + i * 1;
    end
end

// always #(10) sclk = ~sclk;

decoder_1 decoder_1_inst(
    .a (a),
    .Y (Y),
    .rst_n (rst_n)
    // .sclk (sclk)
);


endmodule