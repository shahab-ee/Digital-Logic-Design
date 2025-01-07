`timescale 1ns/1ns
module DivTB();
logic clk = 1'b0;
logic rst=1'b0;
logic start =1'b0;
logic [7:0] Q, M, Quotient, Remainder;
logic ready;
DivTop cut (clk, rst, start, Q, M, Quotient, Remainder, ready);
always #5 clk <= ~clk;
initial begin
    #3 rst = 1;
    #10 rst = 0;
    #15 Q = 8'd183;
    #15 M = 8'd11;
    #3 start =1;
    #13 start =0;
    #300 $stop;
end
endmodule
