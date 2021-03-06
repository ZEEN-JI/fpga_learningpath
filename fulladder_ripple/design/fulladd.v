module fulladd(
    input x,y,cin,
    output res,cout
);

parameter o1 = 1;
parameter o2 = 1;
parameter c = 1;

assign x = o1;
assign y = o2;
assign cin = c;

assign res = x^y^cin;
assign cout = x&y|(cin&(x^y));
// always @(c) begin
//     $display("%b",res);
// end
endmodule