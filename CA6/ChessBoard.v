module datapath (input clk,input[0:7]rst_regs,ld_regs,input [2:0] sel,
    input up_col,rst_col,ld_col,up_row,rst_row,ld_row,rst_last,up_last,push,pop,output reg [2:0] out_cnt,
    output reg [0:7] decoded_col,Po0,Po1,Po2,Po3,Po4,Po5,Po6,Po7,out_last,output reg error,
    output row_carry,col_carry,empty,last_carry);
    wire [33:0] OutOnes;
    wire [0:7] decoded_row,Out_last,decoded_col_reg;
    wire [2:0] out_row,out_col,Out_cnt;
    wire [5:0] stack_out;
    wire [5:0] ones_num;
    wire [0:7] pin [0:7];
    assign Po0 = pin[0];
    assign Po1 = pin[1];
    assign Po2 = pin[2];
    assign Po3 = pin[4];
    assign Po4 = pin[4];
    assign Po5 = pin[5];
    assign Po6 = pin[6];
    assign Po7 = pin[7];
    stack stack(.clk(clk),.rst(rst),.push(push),.pop(pop),.empty(empty),.data_in({out_row,out_col}),.data_out(stack_out));
    DCD row_DCD(out_row,decoded_row);
    DCD col_DCD(out_col,decoded_col_reg);
    assign decoded_col = decoded_col_reg;
   MUX8 m(.in0(Po0),.in1(Po1),.in2(Po2),.in3(Po3),.in4(Po4),.in5(Po5),.in6(Po6),.in7(Po7),.sel(sel),.out(Out_last));
   always @(Out_last) begin
        out_last = Out_last;
   end
    Registers reg0 (
        .clk(clk),
        .rst(rst_regs[0]),
        .ld(ld_regs[0]),
        .ParIn(decoded_row),
        .ParOut(pin[0])
    );

    Registers reg1 (
        .clk(clk),
        .rst(rst_regs[1]),
        .ld(ld_regs[1]),
        .ParIn(decoded_row),
        .ParOut(pin[1])
    );

    Registers reg2 (
        .clk(clk),
        .rst(rst_regs[2]),
        .ld(ld_regs[2]),
        .ParIn(decoded_row),
        .ParOut(pin[2])
    );

    Registers reg3 (
        .clk(clk),
        .rst(rst_regs[3]),
        .ld(ld_regs[3]),
        .ParIn(decoded_row),
        .ParOut(pin[3])
    );

    Registers reg4 (
        .clk(clk),
        .rst(rst_regs[4]),
        .ld(ld_regs[4]),
        .ParIn(decoded_row),
        .ParOut(pin[4])
    );

    Registers reg5 (
        .clk(clk),
        .rst(rst_regs[5]),
        .ld(ld_regs[5]),
        .ParIn(decoded_row),
        .ParOut(pin[5])
    );

    Registers reg6 (
        .clk(clk),
        .rst(rst_regs[6]),
        .ld(ld_regs[6]),
        .ParIn(decoded_row),
        .ParOut(pin[6])
    );

    Registers reg7 (
        .clk(clk),
        .rst(rst_regs[7]),
        .ld(ld_regs[7]),
        .ParIn(decoded_row),
        .ParOut(pin[7])
    );


    UpCounter row(
        .din(stack_out[2:0]),
        .clk(clk),
        .rst(rst_row), 
        .cen(up_row), 
        .ld(ld_row), 
        .dout(out_row),
        .co(row_carry) 
    );
    UpCounter col(
        .din(stack_out[5:3]),
        .clk(clk),
        .rst(rst_col), 
        .cen(up_col), 
        .ld(ld_col), 
        .dout(out_col),
        .co(col_carry) 
    );
    UpCounter last(        
        .din(0),
        .clk(clk),
        .rst(rst_last), 
        .cen(up_last), 
        .ld(0), 
        .dout(Out_cnt),
        .co(last_carry) 
    );
    assign out_cnt = Out_cnt;
    OnesCounter #(2) oc0 (
        .in({Po0[6],Po1[7]}),
        .out(OutOnes[0])
    );
    OnesCounter #(3) oc1 (
        .in({Po0[5],Po1[6],Po2[7]}),
        .out(OutOnes[1])
    );
    OnesCounter #(4) oc2 (
        .in({Po0[4],Po1[5],Po2[6],Po3[7]}),
        .out(OutOnes[2])
    );
    OnesCounter #(5) oc3 (
        .in({Po0[3],Po1[4],Po2[5],Po3[6],Po4[7]}),
        .out(OutOnes[3])
    );
    OnesCounter #(6) oc4 (
        .in({Po0[2],Po1[3],Po2[4],Po3[5],Po4[6],Po5[7]}),
        .out(OutOnes[4])
    );
    OnesCounter #(7) oc5 (
        .in({Po0[1],Po1[2],Po2[3],Po3[4],Po4[5],Po5[6],Po6[7]}),
        .out(OutOnes[5])
    );
    OnesCounter #(8) oc6 (
        .in({Po0[0],Po1[1],Po2[2],Po3[3],Po4[4],Po5[5],Po6[6],Po7[7]}),
        .out(OutOnes[6])
    );                        
    OnesCounter #(7) oc7 (
        .in({Po1[0],Po2[1],Po3[2],Po4[3],Po5[4],Po6[5],Po7[6]}),
        .out(OutOnes[7])
    );
    OnesCounter #(6) oc8 (
        .in({Po2[0],Po3[1],Po4[2],Po5[3],Po6[4],Po7[5]}),
        .out(OutOnes[8])
    );
    OnesCounter #(5) oc9 (
        .in({Po3[0],Po4[1],Po5[2],Po6[3],Po7[4]}),
        .out(OutOnes[9])
    );
    OnesCounter #(4) oc10 (
        .in({Po4[0],Po5[1],Po6[2],Po7[3]}),
        .out(OutOnes[10])
    );
    OnesCounter #(3) oc11 (
        .in({Po5[0],Po6[1],Po7[2]}),
        .out(OutOnes[11])
    );  
    OnesCounter #(2) oc12 (
        .in({Po6[0],Po7[1]}),
        .out(OutOnes[12])
    );   
    OnesCounter #(2) oc13 (
        .in({Po0[1],Po1[0]}),
        .out(OutOnes[13])
    );
    OnesCounter #(3) oc14 (
        .in({Po0[2],Po1[1],Po2[0]}),
        .out(OutOnes[14])
    );
    OnesCounter #(4) oc15 (
        .in({Po0[3],Po1[2],Po2[1],Po3[0]}),
        .out(OutOnes[15])
    );
    OnesCounter #(5) oc16 (
        .in({Po0[4],Po1[3],Po2[2],Po3[1],Po4[0]}),
        .out(OutOnes[16])
    );
    OnesCounter #(6) oc17 (
        .in({Po0[5],Po1[4],Po2[3],Po3[2],Po4[1],Po5[0]}),
        .out(OutOnes[17])
    );
    OnesCounter #(7) oc18 (
        .in({Po0[6],Po1[5],Po2[4],Po3[3],Po4[2],Po5[1],Po6[0]}),
        .out(OutOnes[18])
    );
    OnesCounter #(8) oc19 (
        .in({Po0[7],Po1[6],Po2[5],Po3[4],Po4[3],Po5[2],Po6[1],Po7[0]}),
        .out(OutOnes[19])
    );                        
    OnesCounter #(7) oc20 (
        .in({Po1[7],Po2[6],Po3[5],Po4[4],Po5[3],Po6[2],Po7[1]}),
        .out(OutOnes[20])
    );
    OnesCounter #(6) oc21 (
        .in({Po2[7],Po3[6],Po4[5],Po5[4],Po6[3],Po7[2]}),
        .out(OutOnes[21])
    );
    OnesCounter #(5) oc22 (
        .in({Po3[7],Po4[6],Po5[5],Po6[4],Po7[3]}),
        .out(OutOnes[22])
    );
    OnesCounter #(4) oc23 (
        .in({Po4[7],Po5[6],Po6[5],Po7[4]}),
        .out(OutOnes[23])
    );
    OnesCounter #(3) oc24 (
        .in({Po5[7],Po6[6],Po7[5]}),
        .out(OutOnes[24])
    );  
    OnesCounter #(2) oc25 (
        .in({Po6[7],Po7[6]}),
        .out(OutOnes[25])
    );     
    OnesCounter #(8) oc26 (
        .in({Po0[0],Po0[1],Po0[2],Po0[3],Po0[4],Po0[5],Po0[6],Po0[7]}),
        .out(OutOnes[26])
    );
    OnesCounter #(8) oc27 (
        .in({Po1[0],Po1[1],Po1[2],Po1[3],Po1[4],Po1[5],Po1[6],Po1[7]}),
        .out(OutOnes[27])
    );
    OnesCounter #(8) oc28 (
        .in({Po2[0],Po2[1],Po2[2],Po2[3],Po2[4],Po2[5],Po2[6],Po2[7]}),
        .out(OutOnes[28])
    );
    OnesCounter #(8) oc29 (
        .in({Po3[0],Po3[1],Po3[2],Po3[3],Po3[4],Po3[5],Po3[6],Po3[7]}),
        .out(OutOnes[29])
    );
    OnesCounter #(8) oc30 (
        .in({Po4[0],Po4[1],Po4[2],Po4[3],Po4[4],Po4[5],Po4[6],Po4[7]}),
        .out(OutOnes[30])
    );
    OnesCounter #(8) oc31 (
        .in({Po5[0],Po5[1],Po5[2],Po5[3],Po5[4],Po5[5],Po5[6],Po5[7]}),
        .out(OutOnes[31])
    );
    OnesCounter #(8) oc32 (
        .in({Po6[0],Po6[1],Po6[2],Po6[3],Po6[4],Po6[5],Po6[6],Po6[7]}),
        .out(OutOnes[32])
    );
    OnesCounter #(8) oc33 (
        .in({Po7[0],Po7[1],Po7[2],Po7[3],Po7[4],Po7[5],Po7[6],Po7[7]}),
        .out(OutOnes[33])
    );
    OnesCounter #(34) oc34 (
        .in(OutOnes),
        .out(ones_num)
    );

    always @(ones_num) begin
         error = (ones_num > 6'd1);
    end
endmodule