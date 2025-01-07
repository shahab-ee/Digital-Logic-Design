`timescale 1ns/1ns
module DivTestBoth();
logic clk = 1'b0;
logic rst=1'b0;
logic start =1'b0;
logic [7:0] Q, M, Quotient, Remainder, QuotientQ , RemainderQ;
logic ready,readyQ;
DivTop cut (clk, rst, start, Q, M, Quotient, Remainder, ready);
top cut2 (clk, rst, start, Q, M, QuotientQ, RemainderQ, readyQ);
always #5 clk <= ~clk;
initial begin
    #3 rst = 1;
    #10 rst = 0;
    #15 Q = 8'd183;
    #15 M = 8'd11;
    #3 start = 1;
    #13 start = 0;
    #300 $stop;
end
endmodule

