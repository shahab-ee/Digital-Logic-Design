`timescale 1ns/1ns
module Q5_test ();
	logic a00,b00,a11,b11,c00;
	wire s11,s00,c22,s111,s000,c222;
	adder3_mux CUT5(a00,b00,a11,b11,c00,s11,s00,c22);
	adder1_use CUT7(a00,b00,a11,b11,c00,s111,s000,c222);
  initial begin
  	a00 = 0;b00 = 0;a11 = 0;b11 = 1;c00 = 1;
    	#100 a00 = 1;
 	#100 a11 = 1;
	#100 b11 = 0;
	#100 c00 = 0;
  	#100 c00 = 1;
	#100 b00 = 1;
	#100 b11 = 1;
	#100 a11 = 0;
    	#100 $stop;  
  end
endmodule