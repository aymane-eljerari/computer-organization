`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 10/16/2015 
// Design Name: 
// Module Name:    S1_Register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module S1_Register(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output reg [4:0]   S1_ReadSelect1,
	output reg [4:0]   S1_ReadSelect2,
	output reg [4:0]   S1_WriteSelect,
	output reg         S1_WriteEnable,
	output reg [15:0]  immediate,
	output reg         data_src,
	output reg [2:0]   ALU_OP
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
			S1_ReadSelect1 <= 5'd0;
			S1_ReadSelect2 <= 5'd0;
			S1_WriteSelect <= 5'd0;
			S1_WriteEnable <= 1'b0;
			immediate <= 16'b0;
			data_src <= 1'b0;
			ALU_OP <= 1'b000;

			end
		else
			begin
			S1_ReadSelect1 <= InstrIn[20:16];
			S1_ReadSelect2 <= InstrIn[15:11];
			S1_WriteSelect <= InstrIn[25:21];
			S1_WriteEnable <= 1;
		    immediate <= InstrIn[15:0];
			data_src <= InstrIn[29];
			ALU_OP <= InstrIn[28:26];
			end
		end

endmodule
