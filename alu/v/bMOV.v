`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 09:24:21 AM
// Design Name: 
// Module Name: bMOV
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


module bMOV(out, in);
    input in;
    output out;
    wire temp;
    
    not N0(temp,in);
    not N1(out,temp);
    
endmodule
