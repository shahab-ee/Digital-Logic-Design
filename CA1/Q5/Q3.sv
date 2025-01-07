`timescale 1ns/1ns
module mux4_nor(input a,b,c,d,s1,s0,output w);

  nor #(10,14) (a_bar,a,a),
         (b_bar,b,b),
         (c_bar,c,c),
         (d_bar,d,d),
         (s0_bar,s0,s0),
         (s1_bar,s1,s1);

  nor #(15,21) (a1,a_bar,s0,s1),
         (b1,b_bar,s0,s1_bar),
         (c1,c_bar,s0_bar,s1),
         (d1,d_bar,s0_bar,s1_bar);

  nor #(20,28) (w_bar,a1,b1,c1,d1);
  nor #(10,14) (w,w_bar,w_bar);
endmodule
