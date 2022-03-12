`timescale 1ns / 1ps

module hadd1(
    input a,
    input b,
    output s,
    output co
);

    assign {co,s} = a + b;

endmodule
