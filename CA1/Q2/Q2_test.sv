`timescale 1ns/1ns
module  passMUXtest();
logic aa;
logic bb;
logic ss;
wire ww;
passMUX cut2(aa,bb,ss,ww);
initial begin
  aa = 0;
  bb = 0;
  ss = 0;
  #50
  #50 aa = 0;
  #50 bb = 1;
  #50 ss = 1;
  #50 ss = 0;
  #50 aa = 1;
  #50 bb = 0;
  #50 ss = 1;
  #50 $stop;  
end
endmodule
