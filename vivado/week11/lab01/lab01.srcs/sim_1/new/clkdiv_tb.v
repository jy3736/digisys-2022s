`timescale 1ns / 1ps

module clkdiv_tb;

    reg iclk;
    reg en;
    wire oclk;

    clkdiv uut0(.iclk(iclk),.en(en),.oclk(oclk));

    always #5 iclk = ~iclk;

    initial begin
        {en, iclk} = 0;
        #20;
        en=1;
        
        #300;
        $finish;
    end

endmodule

