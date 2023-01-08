`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 09:38:02 AM
// Design Name: 
// Module Name: nbit_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nbit_ALU(out_reg,in_reg0,in_reg1,c_in,AOP,ZERO,OVERFLOW,c_out);
    
    parameter N = 32;
    
    input [N-1:0] in_reg0, in_reg1; 
    input [2:0] AOP;
    input c_in;
    output [N-1:0] out_reg;
    output ZERO,OVERFLOW,c_out;
    
    
    wire [N:0] carry;
    
    // If subtract: assign c_in to be 1 else keep value from c_in.
    assign carry[0] = (AOP == 3'b101) ? 1 : c_in;
    
    
    genvar i; // turn the ALU into a "ripple carry adder" but for all operations 
    generate
        for(i = 0; i < N; i = i + 1) 
            begin: alu
            bALU alu(carry[i+1], out_reg[i], in_reg0[i], in_reg1[i], carry[i], AOP[2:0]); 
            end
    
    endgenerate
    
        // Logic for Zero, Overflow and carru flags
        assign ZERO = out_reg ? 0 : 1;
        assign OVERFLOW = (AOP == 3'b101) ? carry[N] : 0; 
        assign c_out = (AOP == 3'b110) ? carry[N]: 0;
    
endmodule