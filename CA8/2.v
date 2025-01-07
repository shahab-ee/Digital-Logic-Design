`timescale 1ns/1ns
module test();
reg clk = 0 , rst , x;
wire y ;
sequence cut(clk,rst,x,y);
always #5 clk = ~clk ;
initial begin
    #10 rst = 1;
    #20 rst = 0;

    #10 x = 1; 
    #10 x = 1; 
    #10 x = 0; 
    #10 x = 1; 
    #10 x = 1; 
    #10 x = 0; 
    #10 x = 1; 
    #10 x = 1; 
    #10 x = 0;
    #10 x = 1;
    #10 x = 0; 
    #10 x = 1;
    #10 x = 1;    
    #100 $stop;
end
endmodule