`timescale 1ns / 1ps

module hw03_gl_syn(a,
    b,
    c,
    f);

    input a;
    input b;
    input c;
    output f;

    wire ab;
    wire a1;
    wire o1;

    AND2  XLXI_1 (.I0(a1),
        .I1(o1),
        .O(f));
    AND2  XLXI_2 (.I0(c),
        .I1(b),
        .O(a1));
    OR2  XLXI_3 (.I0(b),
        .I1(ab),
        .O(o1));
    INV  XLXI_4 (.I(a),
        .O(ab));
        
endmodule

