`timescale 1ns / 1ps

module hw03(a, 
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

AND2  XLXI_1 (.I0(o1), 
.I1(a1), 
.O(f));
AND2  XLXI_2 (.I0(c), 
.I1(b), 
.O(o1));
OR2  XLXI_3 (.I0(b), 
.I1(ab), 
.O(a1));
INV  XLXI_4 (.I(a), 
.O(ab));
endmodule