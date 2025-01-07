`timescale 1ns/1ns
module mux4_2to1 (input a,b,c,d,s0,s1,output w);
  passMUX m1(a,b,s0,y1);
  passMUX m2(c,d,s0,y2);
  passMUX m3(y1,y2,s1,w);
endmodule
