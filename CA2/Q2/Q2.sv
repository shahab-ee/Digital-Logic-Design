`timescale 1ns/1ns
module adder_nor_assign (input a0,b0,a1,b1,c0,output s1,s0,c2);
	assign #(86){c2,s1,s0} = {a1,a0} + {b1,b0} + {c0};
endmodule