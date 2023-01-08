`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 04:49:45 PM
// Design Name: 
// Module Name: RCA_64bit
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


module RCA_64bit(a, b, c_in, sum, c_out);
    input [63:0] a, b;
    input c_in;
    output [63:0] sum;
    output c_out;
    
    wire  w;
    
    RCA_32bit RCA_32_A(.a(a[31:0]),   .b(b[31:0]),     .c_in(c_in),    .sum(sum[31:0]), .c_out(w));
    RCA_32bit RCA_32_B(.a(a[63:32]),   .b(b[63:32]),     .c_in(w),    .sum(sum[63:32]), .c_out(c_out));
    
endmodule






