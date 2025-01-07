`timescale 1ns / 1ps

module CA_8queen_tb;
    reg clk;
    reg start;
    reg reset;
    wire No_Answer;
    wire done;
    wire [0:7] out_last;
    
    CA_8queen uut (
        .clk(clk),
        .start(start),
        .reset(reset),
        .No_Answer(No_Answer),
        .done(done),
        .out_last(out_last)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        start = 0;
        
        #15;
        reset = 0;
        
        #10;
        start = 1;
        
        #10000;
        
        $stop;
    end
    
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | start: %b | No_Answer: %b | done: %b | out_last: %b", 
                 $time, clk, reset, start, No_Answer, done, out_last);
    end
endmodule

