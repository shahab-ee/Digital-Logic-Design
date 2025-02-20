 `timescale 1ns/1ns
module adder1_nor(input a0,b0,c0,output s0,c1);
	nor #(10,14)(a00,a0,a0),
		    (b00,b0,b0),
		    (c00,c0,c0),
		    (a11,a1,a1),
		    (b11,b1,b1);
	nor #(15,21)(w1,a0,b0,c0),
		    (w2,a00,b00,c0),
		    (w3,a0,b00,c00),
		    (w4,a00,b0,c00);
	nor #(10,14)(w5,a0,b0),
		    (w6,a0,c0),
		    (w7,b0,c0);
	nor #(15,21)(c1,w5,w6,w7);
	nor #(20,28)(s0,w1,w2,w3,w4);
endmodule