module reg4 (
    input logic [3:0] parallel_in,
    input logic clk,
    input logic rst,
    input logic cen,
    output logic [3:0] parallel_out
);

always @(posedge clk, posedge rst) begin
    if (rst)
        parallel_out <= 4'b0;
    else if (cen)
        parallel_out <= parallel_in;
    else parallel_out = 4'bz;
end
endmodule
