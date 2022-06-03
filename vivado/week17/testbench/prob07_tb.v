`timescale 1ns / 1ps

module prob07_tb;

    reg clk;
    reg rst;
    reg dec;
    wire [3:0] dout;

    prob07 u1(.clk(clk),.rst(rst),.dec(dec),.dout(dout));

    reg err;
    reg chk;
    reg fail;
    reg [3:0] ans;

    always #20 clk <= ~clk;

    initial begin
        {chk,err,fail,clk,rst,dec,ans} <= 0;
        repeat(2) @(posedge clk);
        chk <= 1;
        err <= (dout!=ans);
        @(negedge clk);
        chk <= 0;
        fail <= fail | err;
        rst <= 1;
        dec <= 0;
        repeat(30) begin
            @(posedge clk);
            ans <= ans + 1;
            #5;
            chk <= 1;
            err <= (dout!=ans);
            @(negedge clk);            
            chk <= 0;
            fail <= fail | err;
        end
        dec <= 1;
        rst <= 0;
        @(posedge clk);
        #5;
        chk <= 1;
        ans <= 15;
        err <= (dout!=15);
        @(negedge clk);
        chk <= 0;
        fail <= fail | err;
        rst <= 1;
        dec <= 1;
        repeat(30) begin
            @(posedge clk);
            ans <= ans - 1;
            #5;
            chk <= 1;
            err <= (dout!=ans);
            @(negedge clk);            
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
