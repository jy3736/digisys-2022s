`timescale 1ns / 1ps

module prob05_tb;

    reg clk;
    reg rst;
    wire [3:0] dout;

    prob05 uut1(.rst(rst),.clk(clk),.dout(dout));

    always #50 clk = ~clk;

    initial begin
        {clk, rst} = 0;
        #100
        rst = 1'b1;
        #1600;
        rst = 1'b0;
        #300;
        rst = 1'b1;
        #1600;
        $finish;
    end

endmodule
