`timescale 1ns / 1ps

module lab01_tb;

    reg a,b;
    wire x;

    lab01 UUT01 (.a(a),.b(b),.x(x));
    
    initial begin
        {a,b} = 2'b00;
        #10;
        
        {a,b} = 2'b10;
        #10;
        {a,b} = 2'b01;
        #10;
        {a,b} = 2'b11;
        #10;
        {a,b} = 2'b10;
        #10;
        {a,b} = 2'b01;
        #10;
        {a,b} = 2'b00;
        #10;
        
        #100
        $finish;
    end

endmodule
