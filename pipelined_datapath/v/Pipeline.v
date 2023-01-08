`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:01 10/16/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
	input clk,
	input rst,
	input [31:0] InstrIn,
	output [31:0] Out
   );

    
	// The naming format for wire: Source_Destination_portname
	wire [4:0]     S1_Reg_ReadSelect1;
	wire [4:0]     S1_Reg_ReadSelect2;
	wire [4:0]     S1_S2_WriteSelect;
	wire           S1_S2_WriteEnable;
	wire [31:0]    Reg_S2_ReadData1;
	wire [31:0]    Reg_S2_ReadData2;
	wire [4:0]     S2_Reg_WriteSelect;
	wire           S2_Reg_WriteEnable;
	
	wire [15:0]    S1_S2_immediate;
	wire [2:0]     S1_S2_ALU_OP;
	wire           S1_S2_data_src;
	
	wire [15:0]    S2_S3_immediate;
	wire [2:0]     S2_S3_ALU_OP;
	wire           S2_mux_data_src;
	
	wire [4:0]     S2_S3_WriteSelect;
	
	wire [31:0]    mux_out;
	wire [31:0]    alu_out;
	
	wire [4:0]     S3_Reg_WriteSelect;
	wire           S3_Reg_WriteEnable;
	
	wire           carry;
	           
	
	// Wires for increment
	wire [31:0] R2, R3;
	

	S1_Register S1_Reg(
		.clk(clk),
		.rst(rst),
		.InstrIn(InstrIn),
		.S1_ReadSelect1(S1_Reg_ReadSelect1),
		.S1_ReadSelect2(S1_Reg_ReadSelect2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.immediate(S1_S2_immediate),
		.ALU_OP(S1_S2_ALU_OP),
		.data_src(S1_S2_data_src)
   );


	nbit_register_file Register_File (
		.write_data(Out),								
		.read_data_1(Reg_S2_ReadData1),
		.read_data_2(Reg_S2_ReadData2),
		.read_sel_1(S1_Reg_ReadSelect1),
		.read_sel_2(S1_Reg_ReadSelect2),
		.write_address(S3_Reg_WriteSelect),
		.RegWrite(S3_Reg_WriteEnable),
		.clk(clk)
	);
		
	
	S2_Register S2_Reg(
		.clk(clk),
		.rst(rst),
		.Reg_ReadData1(Reg_S2_ReadData1),
		.Reg_ReadData2(Reg_S2_ReadData2),
		.S1_WriteSelect(S1_S2_WriteSelect),
		.S1_WriteEnable(S1_S2_WriteEnable),
		.S1_immediate(S1_S2_immediate),
		.S1_data_src(S1_S2_data_src),
		.S1_ALU_OP(S1_S2_ALU_OP),
		.S2_ReadData1(R2),
		.S2_ReadData2(R3),
		.S2_WriteSelect(S2_Reg_WriteSelect),
		.S2_WriteEnable(S2_Reg_WriteEnable),
		.S2_immediate(S2_S3_immediate),
		.S2_data_src(S2_mux_data_src),
		.S2_ALU_OP(S2_S3_ALU_OP)
   );
   
   S3_Register S3_Reg(
        .clk(clk),
        .rst(rst),
        .S2_write_enable(S2_Reg_WriteEnable),
        .S2_write_select(S2_Reg_WriteSelect),
        .S2_alu_out(alu_out),
        .S3_write_enable(S3_Reg_WriteEnable),
        .S3_write_select(S3_Reg_WriteSelect),
        .S3_alu_out(Out)
   );
   
   nbit_ALU ALU(
        .in1(R2),
        .in2(mux_out),
        .select(S2_S3_ALU_OP),
        .carry_out(carry),
        .out(alu_out)
   );

    mux mux(
        .in_reg(R3),
        .in_immediate(S2_S3_immediate),
        .select(S2_mux_data_src),
        .out(mux_out)   
    );

//	Increment Increment(
//		.in1(R2),
//		.in2(R3),
//		.out(Out)
//	);

endmodule
