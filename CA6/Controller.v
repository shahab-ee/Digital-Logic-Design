module Controller(input clk,start,col_carry,row_carry,error,last_carry,empty,reset,
    input [7:0] decoded_col,input [2:0] out_cnt,
    output reg[0:7] rst_regs,ld_regs,output reg [2:0] sel,
    output reg up_col,rst_col,ld_col,up_row,rst_row,ld_row,rst_last,up_last,push,pop,No_Answer,done);

    reg [4:0] next_state , current_state;
    parameter [4:0]
    S0  = 5'd0,
    S1  = 5'd1,
    S2  = 5'd2,
    S3  = 5'd3,
    S4  = 5'd4,
    S5  = 5'd5,
    S6  = 5'd6,
    S7  = 5'd7,
    S8  = 5'd8,
    S9  = 5'd9,
    S10 = 5'd10,
    S11 = 5'd11,
    S12 = 5'd12,
    S13 = 5'd13,
    S14 = 5'd14,
    S15 = 5'd15,
    S16 = 5'd16,
    S17 = 5'd17,
    S18 = 5'd18,
    S19 = 5'd19;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end
    
    always @(*) begin
        rst_regs = 8'b00000000;
        ld_regs = 8'b00000000;
        rst_row = 0;
        up_row = 0;
        rst_col = 0;
        up_col = 0;
        rst_last = 0;
        up_last = 0;
        push = 0;
        pop = 0;
        done = 0;
    
        case (current_state)
            S0: begin
                if (start) next_state = S1;
                else next_state = S0;
            end
            
            S1: begin
                rst_regs = 8'b11111111;
                next_state = S2;
            end
            
            S2: begin
                rst_row = 1;
                rst_col = 1;
                next_state = S3;
            end
    
            S3: begin
                ld_regs = decoded_col;
                next_state = S4;
            end
    
            S4: begin
                if (error) next_state = S5;
                else next_state = S11;
            end
    
            S5: begin
                push = 1;
                next_state = S6;
            end
    
            S6: begin
                up_col = 1;
                rst_row = 1;
                next_state = S7;
            end
    
            S7: begin
                if(col_carry) next_state = S8;
                else next_state = S3;
            end
    
            S8: begin
                done = 1 ;
                next_state = S9;
            end
    
            S9: begin
                rst_last = 1 ;
                next_state = S10;
            end
    
            S10: begin
                sel = out_cnt;
                next_state = S19;
            end
    
            S11: begin
                up_row = 1;
                next_state = S12;
            end
    
            S12: begin
                up_row = 1;
                if (row_carry) next_state = S13;
                else next_state = S3;
            end
    
            S13: begin
                pop = 1;
                rst_regs = 8'b11111111;
                next_state = S14;
            end
    
            S14: begin
                if(empty) next_state = S18;
                else next_state = S15;
            end
    
            S15: begin
                ld_row = 1;
                ld_col = 1;
                next_state = S16;
            end
    
            S16: begin
                up_row = 1;
                next_state = S17;
            end
    
            S17: begin
                next_state = S3;
            end

            S18: begin
                No_Answer = 1;
                next_state = S0;
            end

            S19: begin
                up_last = 1;
                if(last_carry) next_state = S0;
                else next_state = S19;
            end

            default: next_state = S0;
        endcase
    end
endmodule