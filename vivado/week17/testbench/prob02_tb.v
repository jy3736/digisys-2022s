`timescale 1ns / 1ps

module prob02_tb;

    reg [1:0] a,b;
    reg cin;
    wire cout;
    wire [1:0] sum;
    
    prob02 u1(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
    
    reg err;
    reg fail;
    reg chk;
    wire [2:0] ans;
    
    assign ans = a+b+cin;

    initial begin
        {chk,err,fail,a,b} <= 0;
        #50;
        repeat(30) begin
            {a,b,cin} <= {$random()};
            #10;
            chk <= 1'b1;
            err <= ({cout,sum}!=ans);
            #5;
            chk <= 1'b0;
            fail <= fail | err;
            #5;            
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
