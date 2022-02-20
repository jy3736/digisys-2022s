`timescale 1ns / 1ps

module lab01(
    input a,
    input b,
    output x
    );
    
    reg x;
    
    always@(a or b) begin
        if (a==1 && b==1)
            x = 1'b1;
        else if (a==0 && b==0)
            x = 1'b0; 
    end
    
endmodule
