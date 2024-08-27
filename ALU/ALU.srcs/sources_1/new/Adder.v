`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2024 09:21:57 PM
// Design Name: 
// Module Name: Adder
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


module Adder #(parameter BITS = 32)(
    input ci, // carry in i.e. ALUOP[1]
    input [BITS-1:0]A,
    input [BITS-1:0]B,
    output [BITS-1:0]Result
    );
    wire [BITS-1:0]carry;
    
    bitwiseAdd add0 (
        .a(A[0]),
        .b(B[0]),
        .ci(ci),
        .s(Result[0]),
        .co(carry[0])
    );
    
    // Generate remaining 31 adders
    genvar i;
    generate
        for (i=1; i < BITS; i=i+1) begin : adder_gen
        bitwiseAdd addN(
            .a(A[i]),
            .b(B[i]),
            .ci(carry[i-1]),
            .s(Result[i]),
            .co(carry[i])
        );
        end
    endgenerate
    
    // Handle overflow    
endmodule
