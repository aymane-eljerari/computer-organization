`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 01:32:22 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
    
    parameter data_width = 32;
    
    
    reg     [15:0]                  in_immediate;
    reg     [data_width-1:0]        in_reg;      
    reg                             select;      
    wire    [data_width-1:0]        out;   
    
    
    mux #(data_width) mux1(
        .in_immediate(in_immediate),
        .in_reg(in_reg),
        .select(select), 
        .out(out)
    );
    
    
    initial begin 
    
    #10;
    in_immediate = 15'd4096;
    in_reg = 32'd94035;
    select = 0;
    
    #10;
    in_immediate = 15'd4096;
    in_reg = 32'd94035;
    select = 1;
    
    
    end      
    
endmodule
