module UpCounter(
    input [2:0] din,
    input clk, rst, cen, ld,
    output reg [2:0] dout,
    output wire co
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        dout <= 3'b0;
    end else if (ld) begin
        dout <= din;
    end else if (cen) begin
        dout <= dout + 1;
    end
end
assign co = (cen && dout == 3'b111);

endmodule