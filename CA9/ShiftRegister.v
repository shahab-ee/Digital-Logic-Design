module ShiftRegister #(parameter SIZE = 9) (parallelIN, shEN, ldEN, clk,rst, parallelOUT);
    input [SIZE-1:0] parallelIN;
    input shEN, ldEN;
    input clk,rst;
    output [SIZE-1:0] parallelOUT;

    reg [SIZE-1:0] register;

    always @(posedge clk, posedge rst) begin
        if(rst) register <= {(SIZE){1'b0}};
        else begin
            if(ldEN) register <= parallelIN;
            else if(shEN) register = register << 1;
        end
    end

    assign parallelOUT = register;

endmodule