`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:52:30 PM
// Design Name: 
// Module Name: RCA_64bits_tb
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
`define D           128

module RCA_64bits_tb;

    reg [63:0] a, b;
    reg c_in;
    
    reg clk; 
    
    wire c_out; 
    wire [63:0] sum;
    wire c_out_verify;
    wire [63:0] sum_verify;
    wire error_flag;
    
    
    RCA_64bit RCA(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    Verification_64_bits Verification(.a(a), .b(b), .c_in(c_in), .sum(sum_verify), .c_out(c_out_verify));
    
    assign error_flag = (c_out != c_out_verify || sum != sum_verify);
    
    always@(posedge clk)
		begin
		if(error_flag)
			$display("Error occurs when a = %d, b = %d, c_in = %d\n", a, b, c_in);
		end
		
    always #5 clk = ~clk;
    
    initial begin
    
        clk = 0;
        
        #`D;
        a = 64'hA8937BC62D;
        b = 64'hABCD385E;
        c_in = 0;
        
        #`D;
        a = 64'hA180C9BFC723279F;
        b = 64'hA282AC73ED441906;
        c_in = 0;
        
        #`D;
        a = 64'hA1DC9BFC7AF279F;
        b = 64'hAEFC3DE9D441906;
        c_in = 0;
        
        #`D;
        a = 64'h05BBBE5A4C;
        b = 64'h1579E;
        c_in = 1;
        
        #`D;
        a = 64'hAB37BE91;
        b = 64'hE2814FD;
        c_in = 0;
        
        #`D;
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'hFFFFFFFFFFFFFFFF;
        c_in = 1;
        
        #`D;
        a = 64'hFE1957AC6D;
        b = 64'hDEC5D3868DA079F;
        c_in = 0;
        
    end
    
    
    
endmodule
