`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.Out(Out)
	);

	// Define clk
	always #5 assign clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		InstrIn = 0;
		rst = 1;

		// Wait 10 ns for global reset to finish
		
		#29;
		rst = 0;
		
		#1;
        InstrIn = 32'b011101_00001_00001_0000000000001010;  // I type, ADD r1 with 0000000A => r1 = 0000000A
                 
        #30;
        InstrIn = 32'b011011_00010_00010_0000000000000010;  // I type, OR r2 with 00000002 => r2 = 00000002        
    	
    	#30;
        InstrIn= 32'b010101_00011_00001_00010_00000000000;  // R type, ADD r1(0000000A) with r2(00000002) => r3 = 0000000C        
        
        #30;
        InstrIn= 32'b010110_00100_00001_00010_00000000000;  // R type, SUB r1(0000000A) with r2(00000002) => r4 = 00000008  
                  
        #30
        InstrIn= 32'b011101_00000_00000_0000000000000111; // r0 = r0 + 7 = 7
        #30
        InstrIn= 32'b011000_00011_00011_1111111111111000; // r3 = not r3 = cf
        #30
        InstrIn= 32'b011101_00001_00001_0000000000001010; // r1 = r1 + 10 = 20
        #30
        InstrIn= 32'b011101_00010_00010_1111111110000000; // r2 = r2 + FF80 = FF94
        #30
        InstrIn= 32'b011011_00100_00100_1010101010101010; // r4 = OR(r4, AAAA)
        #30
        InstrIn= 32'b011100_00101_00101_1111111111111111; // r5 = AND(r5, AAAA)
        #30
        InstrIn= 32'b011111_00110_00110_1111111111111000; // r6 = SLT(r6,FFF8) = 1


        #30
        InstrIn= 32'b010000_00111_00001_00000_00000000000; // r7 = not(r1)
        #30
        InstrIn= 32'b010101_01000_00001_00010_00000000000; // r8 = r1 + r2
        #30
        InstrIn= 32'b010101_01001_00001_00011_00000000000; // r9 = r1 + r3
        #30
        InstrIn= 32'b010101_01010_00011_00100_00000000000; // r10 = r3 + r4
        #30
        InstrIn= 32'b010101_01011_00001_00101_00000000000; // r11 = r1 + r5
        #30
        InstrIn= 32'b010101_01100_00001_00111_00000000000; // r12 = r1 + r7
        #30
        InstrIn= 32'b111111_11111_11111_11111_11111111111;

	end
      
endmodule

