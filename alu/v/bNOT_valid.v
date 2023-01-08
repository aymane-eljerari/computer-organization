`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 02:54:47 PM
// Design Name: 
// Module Name: bNOT_valid
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


module bNOT_valid
    # (    parameter N = 32)
    (out1, in1);
    input [N-1:0] in1;
    output [N-1:0] out1;
    
    assign out1 = ~in1;

endmodule
