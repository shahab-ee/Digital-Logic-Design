`timescale 1ns/1ns
module norTB();
  logic aa;
  logic bb;
  logic ww;
  mynor CUT1(aa,bb,ww);
  initial begin
  #5 aa = 0; bb = 0;
  #50 aa = 1;
  #50 aa = 0;
  #50 bb = 1;
  #50 aa = 0;
  #50 bb = 0;
  #50 $stop;
  end
endmodule
