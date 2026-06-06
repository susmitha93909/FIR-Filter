`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 18:59:33
// Design Name: 
// Module Name: fir_filter
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


module fir_filter (
    input  wire        clk,
    input  wire        reset,
    input  wire signed [7:0] x_in,
    output reg  signed [15:0] y_out
);

    // Coefficients (from MATLAB)
    parameter signed [7:0] h0 = 8'd5;
    parameter signed [7:0] h1 = 8'd10;
    parameter signed [7:0] h2 = 8'd20;
    parameter signed [7:0] h3 = 8'd30;
    parameter signed [7:0] h4 = 8'd20;
    parameter signed [7:0] h5 = 8'd10;
    parameter signed [7:0] h6 = 8'd5;
    parameter signed [7:0] h7 = 8'd2;

    reg signed [7:0] x [0:7];

    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                x[i] <= 0;
            y_out <= 0;
        end
        else begin
            // Shift register
            for (i = 7; i > 0; i = i - 1)
                x[i] <= x[i-1];

            x[0] <= x_in;

            // FIR computation (MAC operation)
            y_out <= (x[0]*h0) + (x[1]*h1) + (x[2]*h2) + (x[3]*h3) +
                     (x[4]*h4) + (x[5]*h5) + (x[6]*h6) + (x[7]*h7);
        end
    end

endmodule
