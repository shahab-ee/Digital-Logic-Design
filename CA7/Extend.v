`timescale 1ns/1ns
module Extend (
    input [2:0] immSrc,
    input [31:7] instr,
    output reg [31:0] immOut
);

    parameter  ITYPE = 3'b000,
               STYPE = 3'b001,
               JTYPE = 3'b010,
               BTYPE = 3'b011,
               UTYPE = 3'b100;

    always @(*) begin
        case (immSrc)
            ITYPE: immOut = {{20{instr[31]}}, instr[31:20]};
            STYPE: immOut = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            JTYPE: immOut = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
            BTYPE: immOut = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
            UTYPE: immOut = {instr[31:12], 12'b0};
            default: immOut = 32'b0;    
        endcase
    end

endmodule
