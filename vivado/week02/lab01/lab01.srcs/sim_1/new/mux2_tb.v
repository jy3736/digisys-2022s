`timescale 1ns / 1ps

module mux2_tb;

    reg a,b,s;
    wire f;

    mux2 UUT01 (.a(a),.b(b),.s(s),.f(f));
    
    initial begin
        {a,b,s} = 3'b0;
        #100;
        
        s = 1'b0;
        repeat(10) begin
            {a,b} = {$random}%4;
            #50;
        end
        
        s = 1'b1;
        repeat(10) begin
            {a,b} = {$random}%4;
            #50;
        end
        
        #100;
        $finish;
    end

endmodule
