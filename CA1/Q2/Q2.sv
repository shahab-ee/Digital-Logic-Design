`timescale 1ns/1ns
module MUX(input a,b,s , output w);
	assign #(12) w = ~s ? a : b;
endmodule