`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 05:32:04 PM
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


module mux(a, b, select, out);

    input   a, b, select;
    output  out;
    
    reg out;
    
    always @ (a, b, select)
   
        begin 
        if (select == 0)
            begin 
            out = a;
            end
        else
            begin
            out = b;
            end 
        end

endmodule
