`timescale 1ns / 1ps

module clkdiv(
    input iclk,
    input en,
    output oclk
);

    parameter MSB = 24;

    reg [MSB:0] cnt;

    assign oclk = cnt[MSB];

    always@(posedge iclk) begin
        if (en==0)
            cnt = 0;
        else
            cnt = cnt + 1;

    end

endmodule

