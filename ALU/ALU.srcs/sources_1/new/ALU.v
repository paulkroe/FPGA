`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2024 12:27:20 AM
// Design Name: 
// Module Name: ALU
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

// partition ALU into arithmetic Part and logic Part.
// use a multiplexer at the end of the alu

// OP Codes:
// 0000 add
// 0010 sub
// 0100 and
// 0101 or
// 0110 xor
// 0111 nor
// 1010 slt

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] AluOp,
    output [31:0] Result,
    output wire Zero
    );
    wire [31:0] arithRes, logRes; 
    
    // Arithmetic module
    arithmeticModule #(32) arithMod (
        .A(A),
        .B(B),
        .AluOp(AluOp),
        .Result(arithRes)
    );     
    
    // Logic module
    logicModule #(32) logicMod (
        .A(A),
        .B(B),
        .AluOp(AluOp),
        .Result(logRes)
    );

    // Mux
    twoToOneMux #(32) mux (
        .A(arithRes),
        .B(logRes),
        .select(AluOp[2]),
        .Result(Result)
    );
    
    // Set Zero bit if the result is zero
    assign Zero = (Result == 32'b0);
    
endmodule