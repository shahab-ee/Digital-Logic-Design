`timescale 1ns/1ns
module adder_nor_test ();
	logic a00,b00,a11,b11,c00;
	wire s11,s00,c22;
	adder1_use CUT1(a00,b00,a11,b11,c00,s11,s00,c22);
	initial begin
	a00 = 1;b00 = 0;a11 = 1;b11 = 0;c00 = 0;
  	#100 c00 = 1;
  	#100 c00 = 0;
  	#100 a00 = 0;
  	#100 a11 = 0;
  	#100 b11 = 1;
	#100 b00 = 1;
	#100 c00 = 1;
	#100 a00 = 1;
	#100 b00 = 0;
	#100 a11 = 1;
	#100 $stop;	
	end
endmodule