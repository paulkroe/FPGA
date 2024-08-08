`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 12:49:49 AM
// Design Name: 
// Module Name: pipeline
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


module pipeline(
	input [3:0]a,
	input [3:0]b,
	output [6:0]D,
	output overflow,
	output [4:0]s,
	output [3:0]AN
    );
    
    FourBitAdder add(
    	.a(a),
        .b(b),
        .s(s)
    );

    assign overflow = s[4];
    assign AN = 4'b1110;

    decoder decode(
        .bin(s[3:0]),
        .D(D)
    );
endmodule
