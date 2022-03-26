`timescale 1ns / 1ps

module rcadd2_tb;
    reg [1:0] a;
    reg [1:0] b;
    reg ci;
    wire [1:0] s;
    wire co;
    wire [2:0] result;

    rcadd2 uut1(.a(a),.b(b),.ci(ci),.s(s),.co(co));
    
    assign result = a+b+ci;
    
    initial begin
        {a,b,ci} = 5'b00000;
        #50;   
        repeat(4) begin
            #50;
            if ({co,s}!=result) 
                $display("Error @ %t %b %b %b [%3b] != [%3b]",
                    $time,a,b,ci,{co,s},result);
            #50;
            a = a + 1;
            b = b + 1;    
        end
        {a,b,ci} = 5'b00001;
        #50;
        repeat(4) begin
            #50;
            if ({co,s}!=result) 
                $display("Error @ %t %b %b %b [%3b] != [%3b]",
                    $time,a,b,ci,{co,s},result);
            #50;
            a = a + 1;
            b = b + 1;    
        end
        #100;
        $finish;
    end
endmodule
