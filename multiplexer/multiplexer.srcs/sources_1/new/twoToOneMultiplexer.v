`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2024 06:14:53 PM
// Design Name: 
// Module Name: twoToOneMultiplexer
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


module twoToOneMultiplexer(
	input a,
	input [1:0] b,
	output z
    );
	wire not_a, i0, i1;
	not(not_a, a);
	and(i0, b[0], not_a);
	and(i1, b[1], a);
	or(z, i0, i1);
endmodule
