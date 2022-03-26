`timescale 1ns / 1ps

module alu4(
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,
    output [3:0] dout
    );
    
    wire [3:0] add;
    wire [3:0] sub1;
    wire [3:0] sub2;
    wire [3:0] op_and;
    wire [3:0] op_or;
    wire [3:0] op_xor;
    
    assign add = a + b;
    assign sub1 = a - b;
    assign sub2 = b - a;
    assign op_and = a & b; 
    assign op_or = a | b; 
    assign op_xor = a ^ b;
    
    assign dout = (op==0)?0:
                  (op==1)?add: 
                  (op==2)?sub1: 
                  (op==3)?sub2: 
                  (op==4)?op_and: 
                  (op==5)?op_or: 
                  (op==6)?op_xor:7; 
    
endmodule

