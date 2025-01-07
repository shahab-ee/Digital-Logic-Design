module onepulser(input clkPb,clk,rst,output reg clkEn);
  parameter A = 2'b00 ,B = 2'b01 , C = 2'b10;
  reg [1:0] ns,ps;
  always @(posedge clk , posedge rst) begin
    if(rst)
      ps = A;
    else
      ps = ns;
   end
      
    always @(posedge clk,posedge rst)begin
      clkEn = 1'b0;
      case(ps)
          A : ns = clkPb ? B:A;
          B : begin
            ns = C;
            clkEn = 1'b1;
            end
          C: ns = clkPb ? C : A;
          endcase
      end
endmodule
