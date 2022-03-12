`timescale 1ns / 1ps

module hw03_timing;

    reg a,b,c;
    wire f;

    hw03_df     uut1(.a(a),.b(b),.c(c),.f(f));

    initial begin
        {a,b,c} = 3'b000;
        #100;

        repeat(100) begin
            {a,b,c} = {$random};
            #100;
        end

        #100;
        $finish;

    end

endmodule

