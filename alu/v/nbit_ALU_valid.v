`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 12:32:21 PM
// Design Name: 
// Module Name: nbit_ALU_valid
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


module nbit_ALU_valid

    # (    parameter N = 32)
    (data_valid, clk, c_in, reg_in0, reg_in1, AOP); 

	

	input [N-1:0] reg_in0, reg_in1;
	input c_in;
	input clk;
	
	input [2:0] AOP;
	
	output [N-1:0] data_valid;
	
	
	wire c_out_to_reg;
	wire [N-1:0] sum_to_reg;
	
	assign {data_valid} = 
	(AOP == 3'b000) ? {reg_in0}:
	(AOP == 3'b001) ? {~reg_in0}:
	(AOP == 3'b011) ? ~(reg_in0&reg_in1):
	(AOP == 3'b100) ? ~{reg_in0|reg_in1}:
	(AOP == 3'b101) ? {reg_in0-reg_in1}:
	(AOP == 3'b110) ? {reg_in0+reg_in1+c_in}:
	0;
	
	
	

endmodule