module OnesCounter #(parameter N = 8)(input [N-1:0] in,
                    output reg [2:0] out);
    integer  i;
    reg [2:0] count;
    always @(*) begin
        count = 0;
        for (i = 0; i < N; i = i + 1) begin
            count = count + in[i];
        end
        out = count;
    end

endmodule
