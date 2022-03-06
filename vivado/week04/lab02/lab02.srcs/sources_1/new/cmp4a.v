`timescale 1ns / 1ps

module cmp4a(
    input [3:0] a,
    input [3:0] b,
    output eq,
    output lt,
    output gt
    );
    
    wire [3:0] i;
    wire [3:0] g;
    wire [3:0] bb;
    
    xnor (i[3],a[3],b[3]);
    xnor (i[2],a[2],b[2]);
    xnor (i[1],a[1],b[1]);
    xnor (i[0],a[0],b[0]);
    
    and (eq, i[3], i[2], i[1], i[0]);
    
    not (bb[3],b[3]);
    not (bb[2],b[2]);
    not (bb[1],b[1]);
    not (bb[0],b[0]);
    
    and (g[3],a[3],bb[3]);
    and (g[2],i[3],a[2],bb[2]);
    and (g[1],i[3],i[2],a[1],bb[1]);
    and (g[0],i[3],i[2],i[1],a[0],bb[0]);
    
    or (gt,g[3],g[2],g[1],g[0]);
    
    nor (lt,eq,gt);
     
endmodule


