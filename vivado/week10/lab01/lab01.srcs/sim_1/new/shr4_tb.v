`timescale 1ns / 1ps

module shr4_tb;

    reg [1:0] s;
    reg [3:0] w;

    wire [3:0] y;

    shr4 uut1(.s(s),.w(w),.y(y));

    integer i;

    initial begin
        s = 0;
        w = 4'b0000;
        #50;

        for(i=0; i<4; i=i+1) begin
            s = i;
            repeat(8) begin
                w = {$random};
                #50;
                // add you tests here 
                #50;
            end
        end

        #100;
        $finish;

    end

endmodule


