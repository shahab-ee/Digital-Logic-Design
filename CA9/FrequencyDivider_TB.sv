module FrequencyDivider_TB();
reg init, clk, rst, co1,co2;
reg [2:0] SW;
FrequencyDivider DUT1(.init(init), .H_L(0), .SW(SW), .clk(clk), .rst(rst), .co(co1));
FrequencyDivider DUT2(.init(init), .H_L(1), .SW(SW), .clk(clk), .rst(rst), .co(co2));
always #1 clk = ~clk;
initial begin
clk = 0;
rst = 0;
init = 0;
SW = 3'b011;
#5 rst = 1;
#5 rst = 0; init = 1;
#5 init = 0;
#20000
$stop;
end
endmodule
