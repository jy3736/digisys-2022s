`timescale 1ns / 1ps

module rcadd2(
    input [1:0] a,
    input [1:0] b,
    input ci,
    output [1:0] s,
    output co
    );
    
    wire co0;
    
    fadd1 uut1(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]),.co(co0));
    fadd1 uut2(.a(a[1]),.b(b[1]),.ci(co0),.s(s[1]),.co(co));
    
endmodule

