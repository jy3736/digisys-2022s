`timescale 1ns / 1ps

module srlatch(
    input Clk,
    input S,
    input R,
    output reg Q,
    output reg QB
    );
    
    always@(Clk or S or R) begin
        if (Clk==1'b1) begin
            case({S,R})
                2'b00 : {Q, QB} = {Q, QB}; 
                2'b01 : {Q, QB} = 2'b01; 
                2'b10 : {Q, QB} = 2'b10; 
                2'b11 : {Q, QB} = 2'bxx; 
            endcase
        end  
    end
    
endmodule

