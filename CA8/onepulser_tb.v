module onepulser_tb();
  reg clkPb,clk,rst;
  wire clkEn;
  
  onepulser cut(clkPb,clk,rst,clkEn);
  

  always #10 clk = ~clk;
 initial begin
  clk = 0;
  clkPb = 0;
  rst = 1;
  #20 rst = 0;
  #50 clkPb = 1;
  #50 clkPb = 0;
 end
 endmodule