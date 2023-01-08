`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 08:27:28 PM
// Design Name: 
// Module Name: CSA_64bit
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


module CSA_64bit(a, b, c_in, sum, c_out);
    
    input [63:0]    a, b;
    input           c_in;
    output [63:0]   sum;
    output          c_out;
    
    wire            c_out_1, c_out_2, cselect;
    wire    [31:0]  sum1, sum2;
    wire    [31:0]  csa_sum;      
    wire            on, off;
 
    
    assign on = 1'b0;
    assign off = 1'b1;
    
    genvar i;
    
    RCA_32bit rca32_A(.a(a[31:0]), .b(b[31:0]), .c_in(c_in), .sum(sum[31:0]), .c_out(cselect));
    
    RCA_32bit rca32_B(.a(a[63:32]), .b(b[63:32]), .c_in(on), .sum(sum1), .c_out(c_out_1));
    RCA_32bit rca32_C(.a(a[63:32]), .b(b[63:32]), .c_in(off), .sum(sum2), .c_out(c_out_2));
    
    
    generate
        for(i = 0; i < 32; i = i + 1)
            mux Mux(.a(sum1[i]), .b(sum2[i]),  .select(cselect), .out(csa_sum[i]));
    endgenerate
    
    mux Mux2(.a(c_out_1), .b(c_out_2), .select(cselect), .out(c_out));
    
    assign sum[63:32] = csa_sum;
endmodule
