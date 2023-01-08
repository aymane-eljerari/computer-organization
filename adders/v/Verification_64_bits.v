`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:46:17 PM
// Design Name: 
// Module Name: Verification_64_bits
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


module Verification_64_bits(a, b, c_in, sum, c_out);
    
    input  [63:0]   a, b;
	input           c_in;
	output [63:0]   c_out, sum;

	assign {c_out, sum} = a + b + c_in;

endmodule
