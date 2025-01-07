`timescale 1ns/1ns
module Data_mem (
    input clk,
    input [31:0] address, writeData,
    input memWrite,
    output [31:0] readData
);

    reg [7:0] memory [0:16383];

    assign readData = {memory[address], memory[address+1], memory[address+2], memory[address+3]};

    always @(posedge clk) if (memWrite) begin
        {memory[address], memory[address+1], memory[address+2], memory[address+3]} <= writeData;
    end

endmodule