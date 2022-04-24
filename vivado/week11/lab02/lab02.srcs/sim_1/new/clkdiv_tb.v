`timescale 1ns / 1ps

module clkdiv_tb;

    reg iclk;
    reg en;
    wire div2, div4, div8;

    clkdiv #(.MSB(0)) uut0(.iclk(iclk),.en(en),.oclk(div2));
    clkdiv #(.MSB(1)) uut1(.iclk(iclk),.en(en),.oclk(div4));
    clkdiv #(.MSB(2)) uut2(.iclk(iclk),.en(en),.oclk(div8));

    always #5 iclk = ~iclk;

    initial begin
        {en, iclk} = 0;
        #20;
        en=1;
        
        #300;
        $finish;
    end

endmodule
