`timescale 1ns/1ns
module mux4_nor_test();
  logic aa,bb,cc,dd,s0s,s1s,ww;
  mux4_nor cut3(aa,bb,cc,dd,s0s,s1s,ww);
  initial begin
    aa = 0;
    bb = 0;
    cc = 0;
    dd = 0;
    s0s = 0;
    s1s = 0;
    #50
    #100 aa = 1;
    #100 aa = 0;
    #100 s0s = 1;
    #100 bb = 1;
    #100 bb = 0;
    #100 s0s = 0;
    #100 s1s = 1;
    #100 cc = 1;
    #100 cc = 0;
   #100 s0s = 1;
    #100 dd = 1;
    #100 dd = 0;
    #100 $stop;
    end
endmodule
