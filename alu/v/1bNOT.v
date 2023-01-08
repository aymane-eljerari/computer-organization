`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 12:39:04 PM
// Design Name: 
// Module Name: 1bNOT
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


module bNOT

    # (    parameter N = 32)
    (out1, in1);
    input [N-1:0] in1;
    output [N-1:0] out1;
    
    genvar i;
    
    generate 
        for (i = 0; i < N; i = i + 1) begin
            assign out1[i] = ~in1[i];
        end
    endgenerate
    
    
endmodule
