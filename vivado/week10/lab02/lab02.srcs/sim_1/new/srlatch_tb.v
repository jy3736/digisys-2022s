`timescale 1ns / 1ps

module srlatch_tb;

    reg Clk, S, R;
    wire Q, QB;

    srlatch uut1(.Clk(Clk),.S(S),.R(R),.Q(Q),.QB(QB));

    always #300 Clk = ~Clk;


    initial begin
        Clk = 0;
        #100;

        repeat(50) begin
            {S,R} = {$random};
            #50;
        end

        #100;
        $finish;
    end

endmodule

