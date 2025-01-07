module datapath(clk, rst, send, Msg, init, PL, Mode, out);
input clk, rst, send, init, Mode;
input [2:0] PL;
input [4:0] Msg;
output out;

wire coH, coL;
FrequencyDivider FreqDivH(
    .init(init), 
    .H_L(1), 
    .SW(PL), 
    .clk(clk), 
    .rst(rst), 
    .co(coH)
);
FrequencyDivider FreqDivL(
    .init(init), 
    .H_L(0), 
    .SW(PL), 
    .clk(clk), 
    .rst(rst), 
    .co(coL)
);

wire SM;
wire MsgPrcsClk;
assign MsgPrcsClk = coH;
MessageProcess MsgPrcs1(
    .send(send), 
    .Msg(Msg), 
    .clk(MsgPrcsClk), 
    .rst(rst), 
    .msg_bit(SM)
);

wire DDSclk;
two_one_mux #1 FreqMux(
    .a(coH), 
    .b(coL), 
    .s(SM), 
    .c(DDSclk)
);

wire [7:0] magnitude;
DDS DDS1(
    .clk(DDSclk), 
    .rst(rst), 
    .magnitude(magnitude)
);

wire DDSMuxSel;
assign DDSMuxSel = (Mode | SM);
wire [7:0] pwm_in;
two_one_mux #8 DDSMux(
    .a(8'b10000000), 
    .b(magnitude), 
    .s(DDSMuxSel), 
    .c(pwm_in)
);

dac_pwm PWM1(
    .clk(clk), 
    .rst(rst), 
    .pwm_in(pwm_in), 
    .pwm_out(out)
);
endmodule