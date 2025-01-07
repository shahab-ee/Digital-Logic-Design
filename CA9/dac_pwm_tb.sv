module dac_pwm_tb();
logic clk, rst;
logic [7:0] pwm_in;
logic pwm_out;
dac_pwm DUT(.clk(clk),.rst(rst),.pwm_in(pwm_in),.pwm_out(pwm_out));
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 0;
pwm_in = 8'b00000000;
#5 rst = 1;
#10 rst = 0;
pwm_in = 8'b00000101;
#10240
pwm_in = 8'b01111111;
#10240
pwm_in = 8'b11111101;
#10240
$stop;
end
endmodule
