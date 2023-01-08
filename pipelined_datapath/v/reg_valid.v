module reg_valid 
            (reg_file_error, ALUOut_valid, S3_WS, S3_WE, clk, register_file);
            
            
            input [31:0] ALUOut_valid;
            input [4:0] S3_WS;
            input S3_WE, clk;
            input reg register_file;
            
            output reg reg_file_error;


    always @ (posedge clk) begin
            if (S3_WE) 
	           reg_file_error = ( ALUOut_valid != register_file[S3_WS]) ? 1 : 0;
        end
        
        
 endmodule
