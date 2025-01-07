module DCD(input [2:0] A , output[0:7] I);
    assign I=
    (A==0)?8'b10000000:
    (A==1)?8'b01000000:
    (A==2)?8'b00100000:
    (A==3)?8'b00010000:
    (A==4)?8'b00001000:
    (A==5)?8'b00000100:
    (A==6)?8'b00000010:
    (A==7)?8'b00000001:
    8'bxxxxxxxx;
endmodule 

module MUX8(input[0:7] in0,in1,in2,in3,in4,in5,in6,in7,[2:0]sel,output reg [0:7]out);
    assign out = 
        sel == 3'b000 ? in0 :
        sel == 3'b001 ? in1 :
        sel == 3'b010 ? in2 :
        sel == 3'b011 ? in3 :
        sel == 3'b100 ? in4 :
        sel == 3'b101 ? in5 :
        sel == 3'b110 ? in6 :
        in7;
endmodule
