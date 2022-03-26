`timescale 1ns / 1ps

module fadd1(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    
    assign {co,s} = a + b + ci;
    
endmodule

