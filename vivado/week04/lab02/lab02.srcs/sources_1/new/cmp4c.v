`timescale 1ns / 1ps

module cmp4c(
    input [3:0] a,
    input [3:0] b,
    output reg eq,
    output reg lt,
    output reg gt
    );
    
    always@(a or b) begin
        {gt,eq,lt} = 3'b001; 
        if (a==b)
            {gt,eq,lt} = 3'b010;
        else if (a>b) 
            {gt,eq,lt} = 3'b100; 
    end
     
endmodule


