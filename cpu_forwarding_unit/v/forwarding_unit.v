`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 12:57:11 PM
// Design Name: 
// Module Name: forwarding_unit
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


//module forwarding_unit(ID_EX_Rs, ID_EX_Rt, EX_MEM_Rd, MEM_WB_Rd, EX_MEM_RegWrite, MEM_WB_RegWrite, Forward_A, Forward_B);

//    input       [4:0]       ID_EX_Rs, ID_EX_Rt, EX_MEM_Rd, MEM_WB_Rd;
//    input                   EX_MEM_RegWrite, MEM_WB_RegWrite;
//    output reg  [1:0]       Forward_A, Forward_B;
      
//    always @ (*) begin 
//        Forward_A = 2'b00;
//        Forward_B = 2'b00;
//        if ((EX_MEM_RegWrite) && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rs)) begin
//            Forward_A = 2'b10;
//        end if ((EX_MEM_RegWrite) && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rt)) begin
//            Forward_B = 2'b10;
//        end if ((MEM_WB_RegWrite) && (MEM_WB_Rd != 0) && (EX_MEM_Rd != ID_EX_Rs) && (MEM_WB_Rd == ID_EX_Rs)) begin
//            Forward_A = 2'b01;
//        end if ((MEM_WB_RegWrite) && (MEM_WB_Rd != 0) && (EX_MEM_Rd != ID_EX_Rt) && (MEM_WB_Rd == ID_EX_Rt)) begin
//            Forward_B = 2'b01;
//        end
    
//    end

//endmodule

module forwarding_unit( Select_A, Select_B, EX_A, EX_B, EXMEM_Dst, EXMEM_RegWrite, MEMWB_Dst, MEMWB_RegWrite);




    
    output reg [1:0]    Select_A;
    output reg [1:0]    Select_B;
    input      [4:0]    EX_A;
    input      [4:0]    EX_B;
    input      [4:0]    EXMEM_Dst;
    input               EXMEM_RegWrite;
    input      [4:0]    MEMWB_Dst;
    input               MEMWB_RegWrite;


    always @(*) begin
        if (EXMEM_Dst == EX_A && EXMEM_RegWrite == 1)
            Select_A = 2;
        else if (MEMWB_Dst == EX_A && MEMWB_RegWrite == 1)
            Select_A = 1;
        else
            Select_A = 0;
    end

    always @(*) begin
        if (EXMEM_Dst == EX_B && EXMEM_RegWrite == 1)
            Select_B = 2;
        else if (MEMWB_Dst == EX_B && MEMWB_RegWrite == 1)
            Select_B = 1;
        else
            Select_B = 0;
    end
    
endmodule

