`timescale 1ns / 1ps

module prob03_tb;

    reg [2:0] a,b;
    wire lt,eq,gt;
    
    prob03 u1(.a(a),.b(b),.lt(lt),.eq(eq),.gt(gt));
    
    reg err;
    reg fail;
    reg chk;
    wire [2:0] ans;
    
    assign ans = {a<b,a==b,a>b};

    initial begin
        {chk,err,fail,a,b} <= 0;
        #50;
        repeat(30) begin
            {a,b} <= {$random()};
            #10;
            chk <= 1'b1;
            err <= ({lt,eq,gt}!=ans);
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
