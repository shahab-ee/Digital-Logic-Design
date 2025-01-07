module controller(input clk,clken,rst,serIn,co1,co2,coD,
                  output reg cnt1,cnt2,cntD,ldcntD,sh_en,sh_enD,SerOutValid,DONE);
    parameter IDLE = 2'b00 , Port = 2'b01 , DNum = 2'b10 , DTrans = 2'b11;
    reg [1:0] ns,ps;
    always @ (posedge clk,posedge rst)begin
            if(rst)
               ps <= IDLE;
            else
               ps <= ns;
   end
   
    always @(posedge clk,posedge rst)begin
      case(ps) 
        IDLE: ns = serIn ? IDLE : Port;
        Port: ns = co1 ? DNum : Port;
        DNum: ns = co2 ? DTrans : DNum;
        DTrans: ns = coD ? IDLE : DTrans;
        default ns = IDLE;
      endcase
    end
    
    always @(posedge clk , posedge rst) begin
      {cnt1,cnt2,sh_en,sh_enD,ldcntD,cntD,DONE,SerOutValid} = 8'b00000000;
      case(ps)
        Port: begin
        {cnt1,sh_en} = 2'b11;
        sh_enD = co1;
        cnt2 = co1;
      end
        DNum: begin
        {cnt2,sh_enD} = 2'b11;
        ldcntD = co2;
        cntD = co2;
        SerOutValid = co2;
        DONE = coD;
      end
      DTrans:begin
        {ldcntD , cntD} = 2'b11;
        SerOutValid = coD;
    end
    endcase
    end
endmodule
                    
                  
