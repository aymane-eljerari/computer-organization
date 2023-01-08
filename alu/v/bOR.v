`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 09:09:29 AM
// Design Name: 
// Module Name: bOR
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


module bNOR(out, in0, in1);
    input in0, in1;
    wire temp;
    output out;
    
    or or1(temp, in0, in1);
    not not1(out, temp);
    
endmodule
