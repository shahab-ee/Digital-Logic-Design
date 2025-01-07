`timescale 1ns/1ns

module DivCV (input clk, rst, start, A0, output logic ready, loadA, loadM, loadQ, shiftA, shiftQ, InitA, Asel);
logic Co;
logic Init_Counter, Inc_Counter;
logic [1:0]pstate, nstate;
logic [2:0] Count;

parameter [1:0]
Idle = 0, Init =1, Load =2, Shift=3;
always @ (pstate , start, A0, Co) begin
    nstate =0;
    {loadA, loadM, loadQ, shiftA, shiftQ, InitA, Asel,ready} = 8'b0;
    {Init_Counter, Inc_Counter} = 2'b0;
    case (pstate)
    Idle: begin nstate = start ? Init : Idle; ready = 1'b1; end
    Init: begin nstate = start ? Init:Load; Init_Counter= 1'b1; InitA= 1'b1; end
    Load: begin nstate = Shift; InitA= 1'b0;loadM=1'b1; loadQ = 1'b1; loadA = 1'b1; end
    Shift:begin nstate = Co ?Idle :Shift; shiftQ= 1'b1; shiftA= 1'b1; Inc_Counter= 1'b1; Asel= A0; end
    default: nstate=Idle;
endcase
end

always @(posedge clk, posedge rst) begin
    if(rst)
       pstate <= Idle;
    else
       pstate <= nstate;
end

always @(posedge clk, posedge rst) begin
    if(rst) Count<=3'b0;
    else
    if(Init_Counter) Count <= 3'b1;
    else
    if(Inc_Counter) Count <= Count+1'b1;
end

assign Co = &Count;

endmodule
