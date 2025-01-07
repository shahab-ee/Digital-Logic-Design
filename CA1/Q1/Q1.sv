`timescale 1ns/1ns
module mynor(input a ,b , output w);
  supply1 vdd;
  supply0 Gnd;
  wire y;
  nmos #(3,4,5) G1(w,Gnd,a);
  nmos #(3,4,5) G2(w,Gnd,b);
  pmos #(5,6,7) G3(y,vdd,a);
  pmos #(5,6,7) G4(w,y,b);

endmodule
