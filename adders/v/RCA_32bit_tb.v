`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 08:13:49 PM
// Design Name: 
// Module Name: RCA_32bit_tb
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


module RCA_32bit_tb;

    reg [31:0] a, b;
    reg c_in;
    wire [31:0] sum;
    wire c_out;
    
    reg clk;
    
    wire c_out_verify;
    wire [31:0] sum_verify;
    wire error_flag;
    
    RCA_32bit RCA_32_A(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    Verification_32_bits Verification(.a(a), .b(b), .c_in(c_in), .sum(sum_verify), .c_out(c_out_verify));

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
        a = 32'hFFFFFFFF;
        b = 32'hFFFFFFFF;
        c_in = 1;

        #10;
        a = 32'hEFA123FF;
        b = 32'hF1293EFA;
        c_in = 0;
        
        #10;
        a = 32'hAEF1843;
        b = 32'h830A;
        c_in = 1;
        
        #10;
        a = 32'hFF123FA;
        b = 32'hAE24C;
        c_in = 1;
    
    end
endmodule


