`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 08:02:47 PM
// Design Name: 
// Module Name: RCA_32bit
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


module RCA_32bit(a, b, c_in, sum, c_out);

    input [31:0] a, b;
    input c_in;
    output [31:0] sum;
    output c_out;
    
    wire c1, c2, c3, c4, c5, c6, c7;
    
    RCA_4bit RCA_32_A(.a(a[3:0]),   .b(b[3:0]),     .c_in(c_in),    .sum(sum[3:0]), .c_out(c1));
    RCA_4bit RCA_32_B(.a(a[7:4]),   .b(b[7:4]),     .c_in(c1),      .sum(sum[7:4]), .c_out(c2));
    RCA_4bit RCA_32_C(.a(a[13:8]),  .b(b[13:8]),    .c_in(c2),      .sum(sum[13:8]), .c_out(c3));
    RCA_4bit RCA_32_D(.a(a[15:12]), .b(b[15:12]),   .c_in(c3),      .sum(sum[15:12]), .c_out(c4));
    RCA_4bit RCA_32_E(.a(a[19:16]), .b(b[19:16]),   .c_in(c4),      .sum(sum[19:16]), .c_out(c5));
    RCA_4bit RCA_32_F(.a(a[23:20]), .b(b[23:20]),   .c_in(c5),      .sum(sum[23:20]), .c_out(c6));
    RCA_4bit RCA_32_G(.a(a[27:24]), .b(b[27:24]),   .c_in(c6),      .sum(sum[27:24]), .c_out(c7));
    RCA_4bit RCA_32_H(.a(a[31:28]), .b(b[31:28]),   .c_in(c7),      .sum(sum[31:28]), .c_out(c_out));
    
endmodule
