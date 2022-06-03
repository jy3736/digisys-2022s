`timescale 1ns / 1ps

module prob06_tb;

    reg clk;
    reg rst;
    reg [3:0] din;
    wire [3:0] dout;

    prob06 u1(.clk(clk),.rst(rst),.din(din),.dout(dout));

    reg err;
    reg chk;
    reg fail;

    always #20 clk <= ~clk;

    initial begin
        {chk,err,fail,clk,rst,din} <= 0;
        repeat(2) @(posedge clk);
        chk <= 1;
        err <= (dout!=0);
        @(negedge clk);
        chk <= 0;
        fail <= fail | err;
        repeat(20) begin
            rst <= 1;
            din <= {$random};
            @(posedge clk);
            #5;
            chk <= 1;
            err <= (dout!=din);
            #({$random}%8+3);
            chk <= 0;
            fail <= fail | err;
            rst <= 0;
            @(negedge clk);
            chk <= 1;
            err <= (dout!=0);
            #5;
            chk <= 0;
            fail <= fail | err;
        end
        #50;
        if (~fail) begin
            $display("****************");
            $display("* Test passed. *");
            $display("****************");
        end else begin
            $display("@@@@@@@@@@@@@@@@");
            $display("@ Test failed! @");
            $display("@@@@@@@@@@@@@@@@");
        end
        $finish;
    end

endmodule
