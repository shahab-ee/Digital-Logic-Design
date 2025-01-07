`timescale 1ns/1ns
module Instr_mem #(parameter MEMSIZE = 16384)( input  [31:0] address , output [31:0] readData );

    reg [7:0] memory [0:MEMSIZE-1];
    
    initial begin
        $readmemb("Data.mem" , memory); 
    end

    assign readData = {memory[address] , memory[address+1] , memory[address+2] , memory[address+3]};

endmodule