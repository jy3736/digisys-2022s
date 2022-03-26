`timescale 1ns / 1ps

module rcadd4(
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] s,
    output co
    );
    
    wire [2:0] xco;
    
    fadd1 uut1(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]),.co(xco[0]));
    fadd1 uut2(.a(a[1]),.b(b[1]),.ci(xco[0]),.s(s[1]),.co(xco[1]));
    fadd1 uut3(.a(a[2]),.b(b[2]),.ci(xco[1]),.s(s[2]),.co(xco[2]));
    fadd1 uut4(.a(a[3]),.b(b[3]),.ci(xco[2]),.s(s[3]),.co(co));

endmodule
