`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 01:21:12 PM
// Design Name: 
// Module Name: mux
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


module mux(in_reg, in_immediate, select, out);
    parameter data_width = 32;
    input       [15:0]                  in_immediate;
    input       [data_width-1:0]        in_reg;
    input                               select;
    output reg  [data_width-1:0]        out;
    
    
    begin
    always @(*) 
        if (select) out <= {{16{in_immediate[15]}}, in_immediate[15:0]};
        else out <= in_reg;
    end
     
     
endmodule
