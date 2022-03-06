`timescale 1ns / 1ps

module cmp4_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire gt_a, gt_b, gt_c;
    wire eq_a, eq_b, eq_c;
    wire lt_a, lt_b, lt_c;
    
    cmp4a uut1(.a(a), .b(b), .eq(eq_a), .gt(gt_a), .lt(lt_a));
    cmp4b uut2(.a(a), .b(b), .eq(eq_b), .gt(gt_b), .lt(lt_b));
    cmp4c uut3(.a(a), .b(b), .eq(eq_c), .gt(gt_c), .lt(lt_c));
    
    integer seed;
    
    initial begin
        seed = 2;
        {a,b} = 8'b0;
        #100;
        
        repeat(30) begin
            {a,b} = {$random(seed)};
            #100;
        end
        
        #100;
        $finish;    
    end
   
endmodule

