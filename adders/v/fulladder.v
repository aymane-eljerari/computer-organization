`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 04:49:45 PM
// Design Name: 
// Module Name: fulladder
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
`define D           1

module fulladder(a, b, c_in, sum, c_out);
    input a, b, c_in;
    output sum, c_out;
    
wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out;
wire		and5_out, and6_out, and7_out, and8_out;

not	   not1		(not_a, a);
not	   not2		(not_b, b);
not	   not3		(not_c, c_in);

// get sum
and	#`D		and1       (and1_out, a, not_b, not_c);
and	#`D		and2       (and2_out, not_a, b, not_c);
and	#`D		and3       (and3_out, not_a, not_b, c_in);
and	#`D		and4       (and4_out, a, b, c_in);
or	#`D		or1		   (sum, and1_out, and2_out, and3_out, and4_out);

// get c_out							
and	#`D		and5       (and5_out, a, b);
and	#`D		and6       (and6_out, b, c_in);
and	#`D		and7       (and7_out, a, c_in);
and	#`D		and8       (and8_out, a, b, c_in);
or	#`D		or2        (c_out, and5_out, and6_out, and7_out, and8_out);
endmodule
