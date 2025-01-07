`timescale 1ns/1ns

module PC_Counter (input clk, input rst, input [31:0] PC_in, output reg [31:0] PC_out);

    reg [31:0] current_PC;

    always @(posedge clk or posedge rst) begin
        current_PC <= rst ? 32'b0 : PC_in;
    end

    always @(*) begin
        PC_out = current_PC;
    end
endmodule