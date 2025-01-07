module shifter (
    input logic clk,
    input logic rst,
    input logic shn,
    input logic [3:0]  si,
    output logic [3:0] so
);

logic [3:0] stage_input[8:0];
logic [3:0] stage_output[8:0];

reg4 stage[8:0](
    .clk(clk),
    .rst(rst),
    .cen(shn),
    .parallel_in(stage_input),
    .parallel_out(stage_output)
);
assign stage_input[0] = si;

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : shift_stages
        assign stage_input[i + 1] = stage_output[i];
    end
endgenerate

assign so = stage_output[8];
endmodule