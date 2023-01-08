`timescale 1ns / 1ns

module control(
		input [5:0] instruction,
		output reg [2:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch, 
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite,
		output reg Jump,
		output reg JumpRegSel,
		output reg BNE,
		output reg LUI
		);


always @(*) begin
        if (instruction == 6'b00_1111) begin				                //IType LUI
		ALUOp = 3'bx;                                                       // No ALU Op
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		BNE = 1'b0;
		LUI = 1'b1;
        end else if (instruction == 6'b00_0101) begin				                //IType BNE
		ALUOp = 3'b111;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		BNE = 1'b1;
        end else if (instruction == 6'b00_0010) begin				        //JType Jump
		ALUOp = 3'b000;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b1;
		JumpRegSel = 1'b0;
        end else if (instruction == 6'b11_0000) begin			            //IType SUBI
		ALUOp = 3'b011;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b11_1000) begin		               //IType ANDI
		ALUOp = 3'b100;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
	    end else if (instruction == 6'b11_1100) begin			           //IType XORI
		ALUOp = 3'b101;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		end else if (instruction == 6'b11_1110) begin			          //IType SLTIU
		ALUOp = 3'b110;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		LUI = 1'b0;
		end else if (instruction == 6'b00_0000) begin				     //RType
		ALUOp = 3'b00;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b1;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b1;
		end else if (instruction == 6'b00_0100) begin                     //branch
		ALUOp = 3'b01;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b1;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		end else if (instruction == 6'b10_1011) begin                     // sw
		ALUOp = 3'b10;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b1;
		RegWrite = 1'b0;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		end else if (instruction == 6'b10_0011) begin                     // lw
		ALUOp = 3'b10;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		Jump = 1'b0;
		JumpRegSel = 1'b0;
		end else begin
		ALUOp = 3'b00;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		Jump = 1'b0;
		end
        end
endmodule

