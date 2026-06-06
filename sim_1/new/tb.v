`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 19:00:44
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fir;

    reg clk;
    reg reset;
    reg signed [7:0] x_in;
    wire signed [15:0] y_out;

    fir_filter uut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        x_in = 0;

        #20 reset = 0;

        // Input stimulus
        #10 x_in = 8'd10;
        #10 x_in = 8'd20;
        #10 x_in = 8'd30;
        #10 x_in = 8'd40;
        #10 x_in = 8'd50;
        #10 x_in = 8'd40;
        #10 x_in = 8'd20;
        #10 x_in = 8'd10;

        #50 $stop;
    end

endmodule
