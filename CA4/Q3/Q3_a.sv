module shifter_a (
  input clk,
  input shn,  
  input logic [3:0] si,  
  output logic [3:0] so,
  output logic [3:0] out [0:8]  
);  
  logic [3:0] shift [0:8];
  assign out = shift;
  always @(posedge clk) begin
    integer i;
    if (shn) begin
    for ( i = 0; i < 8; i = i+1) begin
      shift[i+1] <= shift[i];
    end
      shift[0] <= si; 
    end else begin
      shift[i+1] <= shift[i+1]; 
    end
  end
  assign so = shift[8];
endmodule