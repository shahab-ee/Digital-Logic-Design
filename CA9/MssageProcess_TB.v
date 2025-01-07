module MessageProcess_TB();
reg send,clk,rst;
wire msg_bit;
reg [4:0] Msg;

MessageProcess DUT(.send(send), .Msg(Msg), .clk(clk),.rst(rst), .msg_bit(msg_bit));
always #1 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    send = 0;
    #7 rst = 1;
    #14 rst = 0;
    Msg = 5'b11001;
    #5
    send = 1;
    #80000;
    send = 0;
    #15000
    $stop;
    
end
endmodule