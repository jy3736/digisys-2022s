`timescale 1ns / 1ps

module prob04_tb;

    reg [2:0] w;
    wire [4:0] y;

    prob04 u1(.w(w),.y(y));

    reg err;
    reg fail;
    reg chk;
    reg [4:0] ans[7:0];

    initial begin
        ans[0] <= 1;
        ans[1] <= 16;
        ans[2] <= 2;
        ans[3] <= 16;
        ans[4] <= 4;
        ans[5] <= 16;
        ans[6] <= 8;
        ans[7] <= 16;
    end

    initial begin
        {chk,err,fail,w} <= 0;
        #50;
        repeat(30) begin
            w <= {$random()};
            #10;
            chk <= 1'b1;
            err <= (y!=ans[w]);
            #5;
            fail <= fail | err;
            #5;            
            chk <= 1'b0;
        end
        if (~fail) begin
            $display("****************");
            $display("* Test passed. *");
            $display("****************");
        end else begin
            $display("@@@@@@@@@@@@@@@@");
            $display("@ Test failed! @");
            $display("@@@@@@@@@@@@@@@@");
        end
        #50;
        $finish;
    end

endmodule
