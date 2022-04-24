`timescale 1ns / 1ps

module clkdiv(
    input iclk,
    input en,
    output oclk
);

    reg [1:0] cnt;

    assign oclk = cnt[1];

    always@(posedge iclk) begin
        if (en==0)
            cnt = 0;
        else
            cnt = cnt + 1;
    end

endmodule

