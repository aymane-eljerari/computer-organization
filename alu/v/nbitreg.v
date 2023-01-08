`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 08:32:03 AM
// Design Name: 
// Module Name: nbitreg
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


module nbitreg


    # (    parameter N = 32)
    (output [N-1:0] reg_out, input clk, input [N-1:0] reg_in);
    
    genvar i;
    
    generate 
        for (i = 0; i < N; i = i + 1) begin
            dff D0 (reg_out[i], reg_in[i], clk);
        end
    endgenerate
            
endmodule



// genvar loop through length of input bit request that the elements all equal each other. Doesn't really work with the clock. Hm. 