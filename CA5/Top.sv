`timescale 1ns/1ns
module DivTop (input clk, rst, start, input[7:0] Q, M, output[7:0] Quotient, Remainder, output ready); 
logic loadA, loadM, loadQ, shiftA, shiftQ, InitA, Asel, A0;
DivDp dp (Q, M, loadM, loadA, loadQ, InitA, Asel, shiftA, shiftQ, clk, rst, Quotient, Remainder, A0);
DivCV cu (clk, rst, start, A0, ready, loadA, loadM, loadQ, shiftA, shiftQ, InitA, Asel);
endmodule
