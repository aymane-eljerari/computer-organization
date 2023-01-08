// Vikrant Sharma

module hazardunit(IFIDWrite, PCWrite, HazardMux, IDEX_Rt, IFID_Rs, IFID_Rt, MemRead, MemDest, WriteBackDest);

	output 	IFIDWrite, PCWrite, HazardMux;
	
	input [4:0] IDEX_Rt; // First operand of incoming instruction
	input [4:0] IFID_Rs; // Second operand of incoming instruction
	input [4:0] IFID_Rt; // 
	input [4:0] MemDest;
	input [4:0] WriteBackDest;
	
	input MemRead;
	
//	 Check if inbound Rs is the same as older Rt OR if inbound Rt is the same as older Rt AND MemRead is on. This is a hazard and bubble should be inserted.
	assign IFIDWrite = (( IDEX_Rt == IFID_Rs || IDEX_Rt == IFID_Rt || MemDest == IDEX_Rt || MemDest == IDEX_Rt) && MemRead ) ? 0 : ((MemDest == IFID_Rs || MemDest == IFID_Rt) && MemDest != 0 ) ? 0 : 1; 
	
//    // Same as above.
	assign PCWrite = (( IDEX_Rt == IFID_Rs || IDEX_Rt == IFID_Rt || MemDest == IDEX_Rt || MemDest == IDEX_Rt) && MemRead ) ? 0 : ((MemDest == IFID_Rs || MemDest == IFID_Rt ) && MemDest != 0) ? 0 : 1; 
	
//	// Same as above. 
	assign HazardMux = (( IDEX_Rt == IFID_Rt || IDEX_Rt == IFID_Rs || MemDest == IDEX_Rt || MemDest == IDEX_Rt) && MemRead ) ? 1 : ((MemDest == IFID_Rs|| MemDest == IFID_Rt ) && MemDest != 0) ? 1 : 0;  // : (( WriteBackDest == IFID_Rt || WriteBackDest == IFID_Rs) && WriteBackDest != 0 ) ? 1 :
	
//	assign IFIDWrite = 1;
	
//	assign PCWrite = 1;
	
//	assign HazardMux = 0;
	
endmodule
