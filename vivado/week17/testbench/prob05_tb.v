`timescale 1ns / 1ps

module prob05_tb;

    reg [2:0] s;
    wire [3:0] dout;

    prob05 u1(.s(s),.dout(dout));

    reg err;
    reg fail;
    reg chk;
    reg [2:0] ans[7:0];

    initial begin
        ans[0] <= 2;
        ans[1] <= 0;
        ans[2] <= 2;
        ans[3] <= 2;
        ans[4] <= 0;
        ans[5] <= 6;
        ans[6] <= 0;
        ans[7] <= 6;
        #10;
    end

    initial begin
        {chk,err,fail,s} <= 0;
        #50;
        repeat(30) begin
            s <= {$random()};
            #10;
            chk <= 1'b1;
            err <= (dout!=ans[s]);
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
