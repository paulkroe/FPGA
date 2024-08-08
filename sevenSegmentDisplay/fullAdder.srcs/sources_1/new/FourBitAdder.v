`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2024 01:34:21 AM
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
    );

    wire zero;
    wire w0, w1, w2, w3; // Declare w3 here
    assign zero = 0;
    
    // First adder 
    FullAdder add0(
        .a(a[0]),
        .b(b[0]),
        .ci(zero),
        .s(s[0]),
        .co(w0)
    );
    
    // Second adder
    FullAdder add1(
        .a(a[1]),
        .b(b[1]),
        .ci(w0),
        .s(s[1]),
        .co(w1)
    );
    
    // Third adder
    FullAdder add2(
        .a(a[2]),
        .b(b[2]),
        .ci(w1),
        .s(s[2]),
        .co(w2)
    );
    
    // Fourth adder
    FullAdder add3(
        .a(a[3]),
        .b(b[3]),
        .ci(w2),
        .s(s[3]),
        .co(w3)
    );
    
    // Assign the final carry-out to the most significant bit of the sum
    assign s[4] = w3;
    
endmodule

