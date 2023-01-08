`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 02:36:15 PM
// Design Name: 
// Module Name: MUX
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


module MUX
    # (    parameter N = 32)
    (output [N-1:0] out_reg, input [N-1:0] NOT_data, input [N-1:0] adddata, input SELECT);
    


    assign out_reg = SELECT ? NOT_data : adddata;
    
//    case(SELECT)
//        1'b0: assign out_reg = NOT_data;
//        1'b1: assign out_reg = adddata;
//        default: assign out_reg = 0;
//    endcase
    
    
endmodule
