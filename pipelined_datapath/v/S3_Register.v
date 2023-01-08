`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 07:07:50 PM
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(

    input                       clk,
    input                       rst,
    input       [4:0]           S2_write_select,
    input                       S2_write_enable,
    input       [31:0]          S2_alu_out,
    
    output reg                  S3_write_enable,
    output reg  [4:0]           S3_write_select,
    output reg  [31:0]          S3_alu_out
    
);


    always @(posedge clk)
        begin 
            if (rst) 
                begin
                S3_alu_out          <= 32'b0;
                S3_write_enable     <= 1'b0;
                S3_write_select     <= 5'b0;
                end
            else
                begin
                S3_alu_out          <= S2_alu_out;
                S3_write_enable     <= S2_write_enable;
                S3_write_select     <= S2_write_select;
                end
        end
              

endmodule
