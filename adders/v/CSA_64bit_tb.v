`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 08:28:57 PM
// Design Name: 
// Module Name: CSA_64bit_tb
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


module CSA_64bit_tb;

    reg     [63:0]  a,b;
    reg             c_in, clk;
    
    wire            c_out;
    wire    [63:0]  sum;
    wire            c_out_verify;
    wire    [63:0]  sum_verify;
    wire            error_flag;
    
    CSA_64bit CSA_64(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
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
        
        #10;
        a = 64'hA8937BC62D;
        b = 64'hABCD385E;
        c_in = 0;
        
        #10;
        a = 64'hA180C9BFC723279F;
        b = 64'hA282AC73ED441906;
        c_in = 0;
        
        #10;
        a = 64'hC095A05BBBE5A4C;
        b = 64'h1579E;
        c_in = 1;
        
        #10;
        a = 64'hFFFFFFFFFFFFFFFF;
        b = 64'hFFFFFFFFFFFFFFFF;
        c_in = 1;
        
        #10;
        a = 64'hFE1957AC6D;
        b = 64'hDEC5D3868DA079F;
        c_in = 0;
        
    end

endmodule
