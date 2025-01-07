`timescale 1ns / 1ns
module Q3_a_test;
    logic clk;
    logic shn;
    logic [3:0] si,so;
    logic [3:0] out [0:8];
    shifter_a cut1 (
        .clk(clk),
        .shn(shn),
        .si(si),
        .so(so),
        .out(out)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        shn = 0;
        si = 4'b0000;
        #10 shn = 1;
        #100 si = 4'b0110;
        #100 si = 4'b1011;
        #100 si = 4'b0001;
        #100 si = 4'b1111;
        #100 $stop;  
    end
endmodule