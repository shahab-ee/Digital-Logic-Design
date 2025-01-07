`timescale 1ns/1ns
module adder_mux(input a0,b0,c0 , output s0,c1);
    not #(5,7) (a00,a0),
               (w11,w1);

    MUX m1(a0, a00, b0, w1),
        m2(w1, w11, c0, s0); 

    MUX m3(a0, b0, a0, w2),
        m4(c0, w1, c0, w3), 
        m5(w2, w3, w3, c1); 
endmodule