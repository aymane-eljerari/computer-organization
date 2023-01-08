`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 08:49:59 AM
// Design Name: 
// Module Name: nbitFA
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
    
module nbitFA

    # (    parameter N = 32)

    (output [N-1:0] reg_out, input clk, input [N-1:0] reg_in0, input [N-1:0] reg_in1, input c_in);

    wire [N-1:0] carry_out;
    
    // assign carry_out = 1'b0; // carry out
        
    FA_str FA0(carry_out[0], reg_out[0], reg_in0[0], reg_in1[0], c_in);

    genvar i;
    
    generate 
        for (i = 1; i < N; i = i + 1) begin
            FA_str FA0(carry_out[i], reg_out[i], reg_in0[i], reg_in1[i], carry_out[i-1]);
        end
    endgenerate
            
endmodule
