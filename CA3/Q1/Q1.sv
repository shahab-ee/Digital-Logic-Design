`timescale 1ns/1ns
module ALU_test();
    logic signed [15:0] MM,NN; 
    logic [2:0] opc;
    logic signed [15:0] outF,outF_y;     
    logic cc = 1;
    logic zer,neg,zery,negy; 
    ALU16 t2(MM,NN,cc,opc,outF,zer,neg);
    ALU16_y t3(MM,NN,cc,opc,outF_y,zery,negy); 
initial begin
    repeat(10) begin
    #50 MM = $random;
    NN = $random; opc = $random;
end 
#500 $stop;
$display($realtime); 
end
endmodule

