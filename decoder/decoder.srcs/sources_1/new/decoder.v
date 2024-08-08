`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2024 03:00:57 AM
// Design Name: 
// Module Name: decoder
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


module decoder(
    inout [1:0] a,
    output [3:0] b
    );

    wire not_a0, not_a1;

    not(not_a0, a[0]);
    not(not_a1, a[1]);

    and(b[0], not_a0, not_a1);
    and(b[1], a[0], not_a1);
    and(b[2], not_a0, a[1]);
    and(b[3], a[0], a[1]);


endmodule
