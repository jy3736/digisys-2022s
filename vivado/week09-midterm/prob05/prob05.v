`timescale 1ns / 1ps

module prob05(
    input rst,
    input clk,
    output [3:0] dout
);

    reg [3:0] dat;
    
    assign dout = dat;
    
    always@(posedge clk) begin
        if (rst==0)
            dat = 0;
        else
            dat = dat + 1;
    end

endmodule
