`timescale 1ns / 1ps

module shr4(
    input [1:0] s,
    input [3:0] w,
    output reg [3:0] y
    );
    
    always@(s,w) begin
        if (s==2'b01)
            y = {w[0],w[3:1]};
        else if (s==2'b10)
            y = {w[1:0],w[3:2]};
        else if (s==2'b11)
            y = {w[2:0],w[3]};
        else
            y = w;    
    end    
    
endmodule

