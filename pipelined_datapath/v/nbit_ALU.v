`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 01:39:54 PM
// Design Name: 
// Module Name: nbit_ALU
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
module nbit_ALU(in1, in2, select, carry_out, out);

    parameter data_width = 32;
    parameter select_width = 3;
    
    input       [data_width-1:0]            in1, in2;
    input       [select_width-1:0]          select;
    output                                  carry_out;
    output      [data_width-1:0]            out;
    
    reg         [data_width-1:0]            ALU_result;
    wire        [data_width:0]              temp_sum;
    
    assign out = ALU_result;
    assign temp_sum = {1'b0, in1} + {1'b0, in2};
    assign carry_out = temp_sum[data_width];
    
    always @(*)
        begin
            case(select)
            3'b000:
                ALU_result = ~in1;
            3'b001:
                ALU_result = in1;
            3'b011:
                ALU_result = (in1 | in2);
            3'b100:
                ALU_result = (in1 & in2);
            3'b110:
                ALU_result = in1 - in2;
            3'b101:
                ALU_result = in1 + in2;
            3'b111:
                ALU_result = (in1 < in2) ? 1 : 0;        
            endcase        
        end
  
endmodule













