module adder1_use(input a0,b0,a1,b1,c0,output s0,s1,c2);
	wire c1;
	adder1_nor k1(a0,b0,c0,s0,c1),
		   k2(a1,b1,c1,s1,c2);
endmodule