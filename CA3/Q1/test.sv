`timescale 1ns/1ns
module ALU16(input signed [15:0] inM,inN,input inC,input [2:0] opc,output logic signed[15:0] outF,output zer,neg);
    always @(inM,inN,inC,opc) begin outF = 16'd0;
        case(opc)            3'd0: outF = inM + inN + inC;
            3'd1: outF = inM + (inN>>>1);            3'd2: outF = inM>inN ? inM : inN;
            3'd3: outF = inM + (inM<<<1);            3'd4: outF = inM & inN;
            3'd5: outF = inM | inN;            3'd6: outF = ~inM;
            3'd7: outF = 16'b0;     default: outF = 16'b0;
        endcase    end
    assign neg = outF[15];    assign zer = ~|outF;
endmodule

