`timescale 1ns / 1ps

module ThreeEightMUX(out_reg0, mov_out, not_out, add_out, sub_out, nor_out, nand_out, AOP);


    input mov_out, not_out, add_out, sub_out, nor_out, nand_out;
    input [2:0] AOP;
    output reg out_reg0;
    

    always@(*)
        begin
        case(AOP)
        
            3'b000: out_reg0 = mov_out;  
            3'b001: out_reg0 = not_out;
            3'b011: out_reg0 = nand_out;
            3'b100: out_reg0 = nor_out;
            3'b101: out_reg0 = sub_out;
            3'b110: out_reg0 = add_out;
            default: out_reg0 = 0;
            
        endcase
    end    
    
endmodule