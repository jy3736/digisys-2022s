`timescale 1ns / 1ps

module alu4_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] op;
    wire [3:0] dout;
    reg [3:0] chk;
    reg err;

    alu4 uut1(.a(a),.b(b),.op(op),.dout(dout));
    
    initial begin
        {a,b,op} = 0;
        #50; 
              
        op = 1;
        repeat(10) begin
            err = 0;
            {a,b} = {$random};
            #50;
            chk = a + b;
            err = (dout != chk);
            #50;
        end  
           
        op = 2;
        repeat(10) begin
            err = 0;
            {a,b} = {$random};
            #50;
            chk = a - b;
            err = (dout != chk);
            #50;
        end
  
        #100;
        $finish;
    end
endmodule

