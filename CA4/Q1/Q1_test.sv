`timescale 1ns/1ns
module reg4_test;
    logic [3:0] parallel_in;
    logic clk;
    logic rst;
    logic cen;
    logic [3:0] parallel_out;

    reg4 cut (
        .parallel_in(parallel_in),
        .clk(clk),
        .rst(rst),
        .cen(cen),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;
        cen = 0;
        parallel_in = 4'b0000;

        #10 rst = 1;
        #10 rst = 0;

        #10 cen = 1;
        parallel_in = 4'b1010;
        #10;
        parallel_in = 4'b0101;

        #10;
        cen = 0;
        parallel_in = 4'b1011;

        #10;
        cen = 1;
        parallel_in = 4'b0111;
        #10;

        rst = 1;
        #10;
        rst = 0;
        #10;
        $stop;
    end
endmodule
