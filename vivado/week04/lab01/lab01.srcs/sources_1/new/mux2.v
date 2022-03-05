`timescale 1ns / 1ps


module mux2(
    input a,
    input b,
    input s,
    output f
    );
    
    assign f = (s)?b:a;
    
endmodule
