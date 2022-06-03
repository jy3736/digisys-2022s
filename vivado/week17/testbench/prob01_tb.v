`timescale 1ns / 1ps

module prob01_tb;

    reg a,b,s;
    wire x,y;

    prob01 u1(.a(a),.b(b),.s(s),.x(x),.y(y));

    reg chk;
    reg err;
    reg fail;
    
    initial begin
        {chk,err,fail} <= 0;
        {a,b,s} <= 0;
        #50;
        repeat(30) begin
            chk <= 0;
            {a,b,s} <= {$random()%8};
            #10;
            chk <= 1;
            if (s)
                err <= ({x,y}!={b,a});
            else
                err <= ({x,y}!={a,b});            
            #10;
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
