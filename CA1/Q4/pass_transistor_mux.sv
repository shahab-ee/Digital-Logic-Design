`timescale 1ns/1ns
module passMUX(input a,b,s , output w);
  wire y;
  supply1 vdd;
  supply0 gnd;
  nmos #(3,4,5) n(y,gnd,s);
  pmos #(5,6,7) p(y,vdd,s);
  nmos #(3,4,5) t1(w,a,y);
  nmos #(3,4,5) t2(w,b,s);
endmodule
