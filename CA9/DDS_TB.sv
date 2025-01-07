module DDS_TB();
logic clk, rst;
logic [7:0] magnitude;
DDS DUT(.clk(clk), .rst(rst), .magnitude(magnitude));
always #5 clk = ~clk;
initial begin
    clk = 1;
    #5 rst = 1;
    #25 rst = 0;
    #1000
    $stop;
end
endmodule