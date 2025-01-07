`timescale 1ns/1ns
module RegisterFile (
    input clk,
    input rst,
    input [4:0] readRegister1,
    input [4:0] readRegister2,
    input [4:0] writeRegister,
    input [31:0] writeData,
    input regWrite,
    output [31:0] readData1,
    output [31:0] readData2
);
    reg [31:0] registers [31:0];

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (regWrite && (writeRegister != 5'b0)) begin
            registers[writeRegister] <= writeData;
        end
    end

    assign readData1 = registers[readRegister1];
    assign readData2 = registers[readRegister2];

endmodule