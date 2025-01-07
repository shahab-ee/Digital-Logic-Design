module CA_8queen(
    input clk, start, reset,
    output No_Answer, done,
    output [0:7] out_last
);
    // Define wires for connections between sub-modules
    wire [2:0] out_cnt, sel;
    wire [0:7] decoded_col, Po0, Po1, Po2, Po3, Po4, Po5, Po6, Po7;
    wire [0:7] rst_regs, ld_regs;
    wire error, empty, up_col, rst_col, ld_col, up_row, rst_row, ld_row, rst_last, up_last;
    wire push, pop, row_carry, col_carry, last_carry;

    Controller controller_inst(
        .clk(clk),
        .start(start),
        .col_carry(col_carry),
        .row_carry(row_carry),
        .error(error),
        .last_carry(last_carry),
        .empty(empty),
        .reset(reset),
        .decoded_col(decoded_col),
        .out_cnt(out_cnt),
        .rst_regs(rst_regs),
        .ld_regs(ld_regs),
        .sel(sel),
        .up_col(up_col),
        .rst_col(rst_col),
        .ld_col(ld_col),
        .up_row(up_row),
        .rst_row(rst_row),
        .ld_row(ld_row),
        .rst_last(rst_last),
        .up_last(up_last),
        .push(push),
        .pop(pop),
        .No_Answer(No_Answer),
        .done(done)
    );

    datapath datapath_inst(
        .clk(clk),
        .rst_regs(rst_regs),
        .ld_regs(ld_regs),
        .sel(sel),
        .up_col(up_col),
        .rst_col(rst_col),
        .ld_col(ld_col),
        .up_row(up_row),
        .rst_row(rst_row),
        .ld_row(ld_row),
        .rst_last(rst_last),
        .up_last(up_last),
        .push(push),
        .pop(pop),
        .out_cnt(out_cnt),
        .decoded_col(decoded_col),
        .Po0(Po0),
        .Po1(Po1),
        .Po2(Po2),
        .Po3(Po3),
        .Po4(Po4),
        .Po5(Po5),
        .Po6(Po6),
        .Po7(Po7),
        .out_last(out_last), // `out_last` as wire now
        .error(error),
        .empty(empty),
        .row_carry(row_carry),
        .col_carry(col_carry),
        .last_carry(last_carry)
    );
endmodule
