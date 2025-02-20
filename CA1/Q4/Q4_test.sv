`timescale 1ns/1ns
module mux4_2to1_test();
  logic aa,bb,cc,dd,s0s,s1s,ww;
  mux4_2to1 cut4(aa,bb,cc,dd,s0s,s1s,ww);
  initial begin
  	aa = 1;
    	bb = 0;
    	cc = 0;
    	dd = 0;
    	s0s = 0;
    	s1s = 0;
    	#50
    	#50 s0s = 1;
  	#50 bb = 1;
	#50 s0s = 0;
	#50 s1s = 1;
	#50 cc = 1;
	#50 cc = 0;
	#50 s0s = 1;
	#50 dd = 1;
	#50 dd = 0;
	#50 cc = 0;
	#50 bb = 0;
	#50 s1s = 0;
	#50 s0s = 0;
  	#50 $stop;
  end
endmodule
