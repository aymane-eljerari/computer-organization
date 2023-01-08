`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 04:49:45 PM
// Design Name: 
// Module Name: RCA_4bit
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


module RCA_4bit(a, b, c_in, sum, c_out);
    input [3:0] a, b;
    input c_in;
    output [3:0] sum;
    output c_out;
    
    wire w1, w2, w3;
    
    fulladder FA1(a[0], b[0], c_in, sum[0], w1);
    fulladder FA2(a[1], b[1], w1, sum[1], w2);
    fulladder FA3(a[2], b[2], w2, sum[2], w3);
    fulladder FA4(a[3], b[3], w3, sum[3], c_out);
    
endmodule
