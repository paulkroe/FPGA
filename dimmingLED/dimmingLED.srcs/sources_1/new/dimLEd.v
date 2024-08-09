`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2024 06:15:15 PM
// Design Name: 
// Module Name: dimLEd
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

module dimLED(
    input wire clk,
    output reg [3:0] signal
);

    reg [25:0] counters [2:0];  // Array of counters with different bit widths

    // Initial block to set initial values
    initial begin
        signal <= 4'b0001;  // Initial signal pattern
        counters[0] <= 0;
        counters[1] <= 0;
        counters[2] <= 0;
    end

    always @(posedge clk) begin
        // Counter configurations for different signals
        if (counters[0] >= 25'd1_250_000) begin
            counters[0] <= 0;
            signal[1] <= ~signal[1];
        end else begin
            counters[0] <= counters[0] + 1;
        end

        if (counters[1] >= 25'd1_500_000) begin
            counters[1] <= 0;
            signal[2] <= ~signal[2];
        end else begin
            counters[1] <= counters[1] + 1;
        end

        if (counters[2] >= 25'd1_750_000) begin
            counters[2] <= 0;
            signal[3] <= ~signal[3];
        end else begin
            counters[2] <= counters[2] + 1;
        end
    end

endmodule