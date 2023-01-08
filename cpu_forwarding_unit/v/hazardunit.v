module hazardunit(OpCode, IFIDWrite, PCWrite, HazardMux, IDEX_Rt, IFID_Rs, IFID_Rt, MemRead, MemDest, WriteBackDest);

	output 	IFIDWrite, PCWrite, HazardMux;
	
	input [5:0] OpCode;
	input [4:0] IDEX_Rt; // First operand of incoming instruction
	input [4:0] IFID_Rs; // Second operand of incoming instruction
	input [4:0] IFID_Rt; // 
	input [4:0] MemDest;
	input [4:0] WriteBackDest;
	
	input MemRead;
	
    assign IFIDWrite = ((MemRead) && ((IDEX_Rt == IFID_Rs) || (IDEX_Rt == IFID_Rt))) ? 0 : 1;
    assign PCWrite   = ((MemRead) && ((IDEX_Rt == IFID_Rs) || (IDEX_Rt == IFID_Rt))) ? 0 : 1;
    assign HazardMux = ((MemRead) && ((IDEX_Rt == IFID_Rs) || (IDEX_Rt == IFID_Rt))) ? 1 : 0;

//	 Check if inbound Rs is the same as older Rt OR if inbound Rt is the same as older Rt AND MemRead is on. This is a hazard and bubble should be inserted.
//	assign IFIDWrite = (( IDEX_Rt == IFID_Rs || IDEX_Rt == IFID_Rt || IDEX_Rt == MemDest) && MemRead ) ? 0 : ((MemDest == IFID_Rs || MemDest == IFID_Rt) && MemDest != 0 ) ? 0 : 1; 
	
//    // Same as above.
//	assign PCWrite = (( IDEX_Rt == IFID_Rs || IDEX_Rt == IFID_Rt || IDEX_Rt == MemDest) && MemRead ) ? 0 : ((MemDest == IFID_Rs || MemDest == IFID_Rt ) && MemDest != 0) ? 0 : 1; 
	
//	// Same as above. 
//	assign HazardMux = (( IDEX_Rt == IFID_Rt || IDEX_Rt == IFID_Rs | IDEX_Rt == MemDest) && MemRead ) ? 1 : ((MemDest == IFID_Rs|| MemDest == IFID_Rt ) && MemDest != 0) ? 1 : 0;  // : (( WriteBackDest == IFID_Rt || WriteBackDest == IFID_Rs) && WriteBackDest != 0 ) ? 1 :
	
//	assign IFIDWrite = 1;
	
//	assign PCWrite = 1;
	
//	assign HazardMux = 0;
	
endmodule
