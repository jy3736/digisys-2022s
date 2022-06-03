`timescale 1ns / 1ps

module prob08_tb;

    parameter [1:0] sunny=0, cloudy=1, raining=2;

    reg clk;
    reg rst;
    reg [1:0] sensor;
    wire sun, cloud, rain;

    prob08 u1(.clk(clk),.rst(rst),.sensor(sensor),.sun(sun),.cloud(cloud),.rain(rain));

    reg err;
    reg chk;
    reg fail;
    reg [2:0] ans[3:0];
    wire [2:0] led;


    assign led = {sun,cloud,rain};

    always #20 clk <= ~clk;

    initial begin
        ans[sunny] <= 3'b100;
        ans[cloudy] <= 3'b010;
        ans[raining] <= 3'b001;
        ans[3] <= 0;
        #5;
    end

    initial begin
        {chk,err,fail,clk,rst,sensor} <= 0;
        repeat(2) @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[sunny]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b01;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[cloudy]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b11;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[raining]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b00;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[sunny]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b00;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[sunny]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b10;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[raining]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b11;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[raining]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b01;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[cloudy]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b10;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[cloudy]);
        #5;
        chk <= 0;
        fail <= fail | err;
        @(negedge clk);
        rst <= 1;
        sensor <= 2'b00;
        @(posedge clk);
        #5;
        chk <= 1;
        err <= (led!=ans[sunny]);
        #5;
        chk <= 0;
        fail <= fail | err;  
        #50;
        if (~fail) begin
            $display("****************");
            $display("* Test passed. *");
            $display("****************");
        end else begin
            $display("@@@@@@@@@@@@@@@@");
            $display("@ Test failed! @");
            $display("@@@@@@@@@@@@@@@@");
        end
        $finish;
    end

endmodule
