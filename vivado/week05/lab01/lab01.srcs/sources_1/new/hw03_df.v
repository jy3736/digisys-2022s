`timescale 1ns / 1ps

module hw03_df(
    input a,
    input b,
    input c,
    output f
);

    assign f = (~a | b) & (b & c);

endmodule

