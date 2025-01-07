	`timescale 1ns/1ns
module DivDp (input [7:0]Q, M, input loadM, loadA, loadQ, InitA, Asel, shiftA, shiftQ, clk, rst, output logic [7:0]Quotient , output logic [7:0] Remainder, output logic A0);

logic [7:0] Qreg, Mreg, Qin, A,Ain, Areg, Ares, SubResult, MUXResult;

always@ (posedge clk, posedge rst) begin
   
    if(rst) begin
       Areg <= 8'b0;
end
else if(InitA) begin
            A <= 8'b0;
		end
    else if(loadA) begin
           Areg <= A;
			end
    else if(shiftA) begin
               Areg <=  Ares;
			end
end

always @ (posedge clk, posedge rst) begin
    if(rst)
       Qreg <= 8'b0;
    else begin
        if(loadQ)
           Qreg <= Q;
        else
           if(shiftQ)
               Qreg <= Qin;
    end
end

always @(posedge clk, posedge rst) begin
    if(rst)
       Mreg <= 8'b0;
    else begin
         if(loadM)
            Mreg <= M;
    end
end

assign SubResult = Ain - M;
assign Ain =  {Areg[6:0] ,Qreg[7]};
assign A0= SubResult[7];
assign MUXResult = Asel ? Ain: SubResult;
assign Ares = MUXResult;
assign Qin ={Qreg[6:0], ~A0};
assign Remainder = A0?Ain:MUXResult;
assign Quotient = Qin;

endmodule