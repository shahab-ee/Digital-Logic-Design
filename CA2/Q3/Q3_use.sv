`timescale 1ns/1ns
module adder3_mux(input a0,b0,a1,b1,c0,output s1,s0,c2);
  adder_mux k1(a0,b0,c0,s0,c1),
            k2(a1,b1,c1,s1,c2);
endmodule