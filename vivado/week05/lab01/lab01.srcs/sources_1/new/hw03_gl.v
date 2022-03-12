`timescale 1ns / 1ps

module hw03_gl(
    input a,
    input b,
    input c,
    output f
);

    wire a1,o1,ab;
    
    and (f,a1,o1);
    or  (o1,ab,b);
    not (ab,a);
    and (a1,b,c);

endmodule

