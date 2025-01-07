`timescale 1ns/1ns
module ALU (
    input [31:0] A, B,
    input [2:0] ALUControl,
    output reg [31:0] result,
    output zero
);
    parameter ADD = 0, SUB = 1, AND = 2, OR = 3, SLT = 4, SLTU = 5, XOR = 6;

    assign zero = ~(|result);

    always @(A, B, ALUControl) begin
        case (ALUControl)
            ADD: result = A + B;
            SUB: result = A - B;
            AND: result = A & B; 
            OR: result = A | B; 
            SLT, SLTU: result = (A < B) ? 32'b1 : 32'b0;
            XOR: result = A ^ B;
            default: result = 32'b0;
        endcase
    end
endmodule