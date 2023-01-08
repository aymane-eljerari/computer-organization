`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:07:48 AM
// Design Name: 
// Module Name: reg_tb
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


module reg_tb; // tests reg and ensures it's actually writing/reading
    
    reg clk;
	reg write_enable;
	reg [31:0] write_data;
	reg [4:0] read_select1, read_select2, write_select;
	
	wire [31:0] read_data1, read_data2;
	
	wire error_flag;

	
	nbit_register_file uut (
		.read_data_1(read_data1), 
		.read_data_2(read_data2), 
		.read_sel_1(read_select1), 
		.read_sel_2(read_select2),
		.write_select(write_select),
		.write_enable(write_enable),
		.write_data(write_data),
		.clk(clk)
	);
	
	
	assign error_flag = ((write_data != read_data1) & (read_select1 == write_select));  // note that error flags are expected with 1 clock cycle delay; that behavior is expected
	
    always #5 assign clk = ~clk;
    
        initial begin
            // Initialize Inputs
            clk = 0;
            write_enable = 1;
            #100
            read_select1 = 5'b01010;
            read_select2 = 5'b01001;
            write_select = 5'b01010;
            write_data = 32'b00101010110101;
            
            #30
            read_select1 = 5'b01010;
            read_select2 = 5'b01001;
            write_select = 5'b01010;
            write_data = 32'b00101010110101;
 
            #30
            read_select1 = 5'b01111;
            read_select2 = 5'b01001;
            write_select = 5'b01111;
            write_data = 32'b00101010110101;
 
            
    end
	


endmodule
