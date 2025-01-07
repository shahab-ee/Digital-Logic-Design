module datapath_TB();
reg clk, rst, send, init, Mode, out;
reg [2:0] PL;
reg [4:0] Msg;

datapath DUT(
    .clk(clk),
    .rst(rst), 
    .send(send), 
    .Msg(Msg), 
    .init(init), 
    .PL(PL), 
    .Mode(Mode), 
    .out(out)
);

always #1 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    send = 0;
    Msg = 5'b11011;
    init = 0;
    PL = 3'b000;
    Mode = 1;
    #20 rst = 1;
    #50 rst = 0; init = 1;
    #10 init = 0;

    #20 send = 1;
    #4000000 send = 0;
    #20000 Msg = 5'b00110; Mode = 0;
    #20 send = 1;
    #2000000 send = 0;
    #20000
    $stop;
end
endmodule