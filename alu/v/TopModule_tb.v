`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 09:11:16 AM
// Design Name: 
// Module Name: TopModule_tb
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


module TopModule_tb
	# ( parameter N = 32);
	
	reg clk;
	reg [N-1:0] input_reg0;
	reg [N-1:0] input_reg1;
	reg c_in;
	reg [2:0] SELECT;
	
	wire [N-1:0] out;
	wire [N-1:0] out_valid;
	wire ZERO, OVERFLOW, c_out;
	
	wire error;
	
	
	TopModule uut (
		.out(out), 
		.out_valid(out_valid),
		.clk(clk), 
		.reg_in0(input_reg0), 
		.reg_in1(input_reg1), 
		.c_in(c_in),
		.AOP(SELECT),
		.ZERO(ZERO),
		.OVERFLOW(OVERFLOW),
		.c_out(c_out)
	);
	
	
	assign error = ( out != out_valid);
	
	
	// Verification logic
	always@(posedge clk)
		begin
		if(error)
			$display("Error occurs when input0 = %d, input1 = %d, c_in = %d\n", input_reg0, input_reg1, c_in);
		end
	

    always #5 clk = ~clk;
        initial begin
            // Initialize Inputs
            clk = 0;
            SELECT = 0;
            input_reg0 = 32'b0;
            input_reg1 = 32'b0;
            c_in = 0;
            
            #50;
            input_reg0 = 32'b101010101;
            input_reg1 = 32'h123213213;
            c_in = 0;
            
            #50;
            SELECT = 3'b110;
            input_reg0 = 32'hFFFFFFFF;
		    input_reg1 = 32'hFFFFFFFF;
            c_in = 0;
            
            #50;
            SELECT = 3'b101;
            input_reg0 = 32'hFFFFFFFF;
		    input_reg1 = 32'hFFFFFFFF;
            c_in = 0;
            
            #50;
            SELECT = 3'b101;
            input_reg0 = 32'hABCDFFFF;
		    input_reg1 = 32'hFFFFFFFF;
            c_in = 0;
            
            #50;
            SELECT = 3'b001;
            input_reg0 = 32'hFFFFFFFF;
		    input_reg1 = 32'hABDFFFFF;
            c_in = 1;
            
            #50;
            SELECT = 3'b100;
            input_reg0 = 0;
		    input_reg1 = 32'hFFFFFFFF;
            c_in = 1;
            
            #50;
            SELECT = 3'b100;
            input_reg0 = 32'hABDBCBDB;
		    input_reg1 = 0;
            c_in = 1;
            
            #50;
            SELECT = 3'b011;
            input_reg0 = 32'hABCBABCB;
		    input_reg1 = 32'hABCDE102;
            c_in = 1;
        
        
            
        end
            
	
	
	
endmodule
