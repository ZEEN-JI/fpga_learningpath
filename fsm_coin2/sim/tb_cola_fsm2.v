`timescale 1ns/100ps

module tb_cola_fsm2;
input wire rst_n,sclk;
input wire half_,one_;
reg po_cola,po_money;

cola_fsm2 cola_fsm2_inst(
    rst_n.(rst_n),
    sclk. (sclk),
    po_cola. (po_cola),
    po_money. (po_money),
    half_. (half_),
    one_. (one_)
);

initial begin
    half_ = 0;
    one_ = 0;
    #20
    
end

always #(10) sclk = ~sclk;

endmodule