`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 09:01:49 AM
// Design Name: 
// Module Name: TopModule
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


module TopModule
    # (    parameter N = 32)
    (output [N-1:0] out, output [N-1:0] out_valid, input clk, input [N-1:0] reg_in0, input [N-1:0] reg_in1, input c_in, input [2:0] AOP, output ZERO, output OVERFLOW, output c_out);
    
    wire [N-1:0] data;
    wire [N-1:0] data_valid;
    
    // ALU and ALU Verification Modules
    nbit_ALU #(.N(32)) ALU0(data, reg_in0, reg_in1, c_in, AOP, ZERO, OVERFLOW, c_out);
    nbit_ALU_valid #(.N(32)) ALU0_valid(data_valid, clk, c_in, reg_in0, reg_in1, AOP);     
    // Registers for both modules
    nbitreg #(.N(32)) register(out, clk, data);
    nbitreg #(.N(32)) reg_valid(out_valid, clk, data_valid); 
    
    
    
    
    
endmodule





