`timescale 1ns / 1ps

module hw03_tb;

    reg a,b,c;
    wire [2:0] f;
    wire err;

    hw03_gl     uut1(.a(a),.b(b),.c(c),.f(f[2]));
    hw03_df     uut2(.a(a),.b(b),.c(c),.f(f[1]));
    hw03_gl_syn uut3(.a(a),.b(b),.c(c),.f(f[0]));

    assign err = (f!=3'b000) && (f!=3'b111); 

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

