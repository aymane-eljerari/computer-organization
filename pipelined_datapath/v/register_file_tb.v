`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2022 05:25:47 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
    
    parameter data_width = 32;
    parameter select_width = 5;

    reg                             clk, write_enable;
    reg     [data_width-1:0]        write_data;
    reg     [4:0]                   read_sel_1, read_sel_2, write_address;
    wire    [data_width-1:0]        read_data_1, read_data_2;
    
    
    nbit_register_file #(data_width, select_width) Nreg(
        .write_data(write_data),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .read_sel_1(read_sel_1),
        .read_sel_2(read_sel_2),
        .write_address(write_address),
        .RegWrite(write_enable),
        .clk(clk)
    );
        
    
    
    always #5 assign clk = ~clk;
    
    initial begin 
        clk = 0;
        write_enable = 1; 
    
        #10;
        write_data = 32'd935;
        read_sel_1 = 5'd10;
        read_sel_2 = 5'd12;
        write_address = 5'd30;
        
        #10;
        write_data = 32'd34;
        read_sel_1 = 5'd30;
        read_sel_2 = 5'd10;
        write_address = 5'd29;
        
        
    end
    
endmodule
