`timescale 1ns / 1ps

module cmp4b(
    input [3:0] a,
    input [3:0] b,
    output eq,
    output lt,
    output gt
    );
    
    wire [3:0] i;
    
    assign i = a ~^ b;
    
    assign eq = &i;
    
    assign gt = (a[3] & ~b[3]) | 
                (i[3] & a[2] & ~b[2]) | 
                (i[3] & i[2] & a[1] & ~b[1]) | 
                (i[3] & i[2] & i[1] & a[0] & ~b[0]);
                
    assign lt = ~eq & ~gt; 
         
endmodule


