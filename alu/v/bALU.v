`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 09:03:31 AM
// Design Name: 
// Module Name: bALU
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


module bALU(c_out,out_reg0,in_reg0,in_reg1,c_in,AOP);
    
    input in_reg0, in_reg1, c_in;
    input [2:0] AOP;
    output c_out, out_reg0;
    wire not_out, add_out, sub_out, nor_out, nand_out;
    wire c_out_adder, c_out_sub, not_in_reg1, SELECT;
    
    assign SELECT = (AOP == 3'b110); // select subtract or add depending on AOP
    
    not not1(not_in_reg1, in_reg1); // "two's complement" the individual bit for subtract
    
    
    bNOT Not(not_out, in_reg0);
    bNOR Nor(nor_out, in_reg0, in_reg1);
    bNAND Nand(nand_out,in_reg0,in_reg1);
    bMOV Mov(mov_out, in_reg0);
    FA_str ADD(c_out_adder,add_out,in_reg0, in_reg1, c_in);
    FA_str SUBTRACT(c_out_sub, sub_out, in_reg0, not_in_reg1, c_in); 
    
    MUX mux0(c_out, c_out_adder, c_out_sub, SELECT); 
    ThreeEightMUX mux1(out_reg0, mov_out, not_out, add_out, sub_out, nor_out, nand_out, AOP); 



endmodule

