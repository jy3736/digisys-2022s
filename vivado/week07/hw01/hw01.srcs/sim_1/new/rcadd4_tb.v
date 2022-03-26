`timescale 1ns / 1ps

module rcadd4_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg ci;
    wire [3:0] s;
    wire co;
    wire [4:0] result;
    reg err;

    rcadd4 uut1(.a(a),.b(b),.ci(ci),.s(s),.co(co));

    assign result = a + b + ci;
    
    initial begin
        {a,b,ci} = 0;
        #50;   
        repeat(30) begin
            err = 0;
            {a,b,ci} = {$random};
            #50;
            if ({co,s}!=result) begin
                $display("Error @ %t %b %b %b [%3b] != [%3b]",
                    $time,a,b,ci,{co,s},result);
                err = 1;
            end
            #50;
        end
        #100;
        $finish;
    end
    
endmodule
