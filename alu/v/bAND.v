`timescale 1ns / 1ps
module bNAND(out, in0, in1);
    input in0, in1;
    wire temp;
    output out;
    
        and and1(temp, in0, in1);
        not not1(out, temp);

endmodule
