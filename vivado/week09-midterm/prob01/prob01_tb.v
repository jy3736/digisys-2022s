`timescale 1ns / 1ps

module prob01_tb;

    reg a,b,c,d;
    wire f;
    wire x1,x2,x3,fx;
    reg err;

    assign x1 = a | b;
    assign x2 = ~a & c;
    assign x3 = x1 | ~x2;
    assign fx = ~d | x3;

    prob01 uut1(.a(a),.b(b),.c(c),.d(d),.f(f));
    
    integer i;
    initial begin
        {a,b,c,d,err} = 0;
        #100;
        for(i=0; i<16; i=i+1) begin
            err = 1'b0;
            {a,b,c,d} = i;
            #50;
            err = (f!=fx);
            #50;
        end
        #100;
        $finish;
    end

endmodule
