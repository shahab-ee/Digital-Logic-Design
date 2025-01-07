module Registers(input clk,rst,ld,input [7:0] ParIn,output reg [7:0] ParOut);

    always @(posedge clk ,posedge rst) begin
        if(rst)
        ParOut <= 8'b0;
        else 
        ParOut <= (ld)?ParIn : ParOut;
    end
endmodule