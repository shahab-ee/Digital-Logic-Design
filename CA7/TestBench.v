`timescale 1ns/1ns
module TestBench();
	reg clk = 1, rst = 1;
	Top UUT(clk , rst);
	always #50 clk = ~clk;
	initial begin
	#100 rst = 0;
	#10000 $stop;
	end
endmodule;