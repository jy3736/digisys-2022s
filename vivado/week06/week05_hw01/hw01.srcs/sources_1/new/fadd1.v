`timescale 1ns / 1ps

module fadd1(
    input a,
    input b,
    input ci,
    output s,
    output co
);

    wire s0, co0, co1;

    assign co = co0 | co1;
    
    hadd1 uut1(.a(a),.b(b),.s(s0),.co(co0));
    hadd1 uut2(.a(s0),.b(ci),.s(s),.co(co1));

endmodule

