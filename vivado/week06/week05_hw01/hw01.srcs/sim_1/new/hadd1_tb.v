`timescale 1ns / 1ps

module hadd1_tb;

    reg a,b;
    wire s, co;

    hadd1 uut1(.a(a), .b(b), .s(s), .co(co));

    integer i;

    initial begin
        {a,b} = 2'b00;
        #100;

        i = 0;
        repeat(10) begin
            {a,b} = i;
            #100;
            i = i + 1;
        end
        #100;
        $finish;

    end

endmodule
