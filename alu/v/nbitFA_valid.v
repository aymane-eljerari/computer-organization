`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 09:13:38 AM
// Design Name: 
// Module Name: nbitFA_valid
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


module nbitFA_valid

    # (    parameter N = 32)

    (output [N-1:0] out, input clk, input [N-1:0] reg_in0, input [N-1:0] reg_in1, input c_in);

    assign out = reg_in0 + reg_in1 + c_in;


endmodule
