`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:17:57 PM
// Design Name: 
// Module Name: RCA_4bit_tb
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


module RCA_4bit_tb;

    reg [3:0] a, b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
    
    reg clk;
    
    RCA_4bit RCA_4_A(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    always #5 clk = ~clk;
    
    initial begin
    
        clk = 0;
        
        #10;
        a = 15;
        b = 15;
        c_in = 1;
        
        
        #10;
        a = 10;
        b = 1;
        c_in = 1;
        
        #10; 
        a = 5; 
        b = 7; 
        c_in = 0;
        
        #10;
        a = 3;
        b = 4;
        c_in = 1;
    
    end
endmodule
