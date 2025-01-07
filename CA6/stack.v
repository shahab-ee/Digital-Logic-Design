module stack(
    input  clk,
    input  rst,
    input  push,
    input  pop,
    input  [5:0] data_in,
    output reg [5:0] data_out,
    output  empty
);

reg [5:0] stack [7:0];
reg [2:0] top;
integer i,j;
initial begin
    top <= 0;
    for (i = 0; i < 8; i = i + 1) begin
        stack[i] <= 0;
    end
end

always @(posedge clk, posedge rst) begin
    if (rst) begin
        top <= 0;
        for (j = 0; j < 8; j = j + 1) begin
            stack[j] <= 0;
        end
    end else begin
        if (push) begin
            if (top != 7) begin
                stack[top] <= data_in;
                top <= top + 1;
            end
        end else if (pop) begin
            if (top != 0) begin
                top <= top - 1;
                data_out <= stack[top];
            end else begin
                data_out <= 0;
            end
        end
    end
end
assign empty = (top == 0);

endmodule

