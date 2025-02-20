`timescale 1ns/1ns
module mux_compare();
  logic aa,bb,cc,dd,s0s,s1s,ww1,ww2;
  mux4_nor cut5(aa,bb,cc,dd,s0s,s1s,ww1);
  mux4_2to1 cut6(aa,bb,cc,dd,s0s,s1s,ww2);
  initial begin
    	aa = 0;
    	bb = 0;
    	cc = 0;
    	dd = 0;
    	s0s = 0;
    	s1s = 0;
    	#50
	#50 aa = 1;
    	#93 s0s = 1;
  	#93 bb = 1;
	#93 s0s = 0;
	#93 s1s = 1;
	#93 cc = 1;
	#93 cc = 0;
	#93 s0s = 1;
	#93 dd = 1;
	#93 dd = 0;
	#93 cc = 0;
	#93 bb = 0;
	#93 s1s = 0;
	#93 s0s = 0;
    end
endmodule
