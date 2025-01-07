`timescale 1ns / 1ns

module shift_test;
    logic clk;
    logic rst;
    logic shn;
    logic [3:0] si;
    logic [3:0] so;

    shifter cut (
        .clk(clk),
        .rst(rst),
        .shn(shn),
        .si(si),
        .so(so)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        shn = 0;
        si = 4'b1111;
        #100;
        rst = 0;
        #100
        shn = 1;
        #100
        si = 4'b1010;
        #100
        rst=1;
        #100
        rst=0;

        si = 4'b1010;
        #100
        si=4'b0101;
        #100
	rst =1;
	#100
	rst = 0;
        si = 4'b1010;
        #100
        si=4'b1101;
        #100
        si = 4'b1000;
        #100
        si=4'b0011;
        #100
	shn = 0;
	#100
	shn = 1;
        si = 4'b1111;
        #200;
        $stop;
    end

endmodule
