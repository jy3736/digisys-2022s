`timescale 1ns / 1ps

module fadd1_tb;

    reg a, b, ci;
    wire s, co;
    
    fadd1 uut1(.a(a),.b(b),.ci(ci),.s(s),.co(co));

    integer i;

    initial begin
        {a,b,ci} = 3'b000;
        #100;
        
        i = 0;
        repeat(16) begin
            {a,b,ci} = i;
            #100;
            i = i + 1;
        end
        
        #100;
        $finish;
        
    end

endmodule
