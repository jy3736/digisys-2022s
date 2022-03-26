`timescale 1ns / 1ps

module ce1_tb;

    reg a,b;
    wire x;

    ce1 uut1 (.a(a),.b(b),.x(x));
    
    initial begin
        {a,b} = 2'b00;
        #10;     
        {a,b} = 2'b10; #10;
        {a,b} = 2'b01; #10;
        {a,b} = 2'b11; #10;
        {a,b} = 2'b10; #10;
        {a,b} = 2'b01; #10;
        {a,b} = 2'b00; #10;
        #100
        $finish;
    end

endmodule