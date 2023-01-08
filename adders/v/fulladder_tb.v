`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 04:57:32 PM
// Design Name: 
// Module Name: fulladder_tb
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

module fulladder_tb;

    reg a, b, c_in;
    wire sum, c_out;
    
    reg clk;
    
    fulladder fa(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		
		a = 0;
		b = 0;
		c_in = 0;
		
		#10;
		a = 0;
		b = 0;
		c_in = 1;
		
		#10;
		a = 0;
		b = 1;
		c_in = 0;
		
		#10;
		a = 0;
		b = 1;
		c_in = 1;
		
		#10;
		a = 1;
		b = 0;
		c_in = 0;

		#10;
		a = 1;
		b = 0;
		c_in = 1;
		
		#10;
		a = 1;
		b = 1;
		c_in = 0;
		
		#10;
		a = 1;
		b = 1;
		c_in = 1;

	end
    
endmodule
