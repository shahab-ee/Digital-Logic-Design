module sequence(input clk,rst,x,output reg y);
    reg[2:0] ps,ns;
    parameter  [2:0] A = 3'b000,B = 3'b001 , C = 3'b010 , D = 3'b011 , E = 3'b100;
    always @(posedge clk,posedge rst)begin
        if(rst)
            ps <= A;
        else
            ps <= ns;
    end
    always @(ps)begin
        if(ps == E)
            y = 1'b1;
        else
            y = 1'b0;
    end
    always @(ps,x) begin
        ns = 3'b000;
        case(ps)
       A : ns = x ? B : A;
       B : ns = x ? B : C;
       C : ns = x ? D : A;
       D : ns = x ? E : C;
       E : ns = x ? B : C;
        endcase
    end
endmodule
