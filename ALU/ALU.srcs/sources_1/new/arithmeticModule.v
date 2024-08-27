`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2024 10:04:11 PM
// Design Name: 
// Module Name: arithmeticModule
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


module arithmeticModule#(parameter BITS = 32)(
    input [BITS-1:0] A,
    input [BITS-1:0] B,
    input [3:0] AluOp,
    output [BITS-1:0] Result  
    );

    wire [BITS-1:0] NotB;
    wire [BITS-1:0] muxOut;
    wire [BITS-1:0] adderOut;
    
    assign NotB = ~B;
    
    twoToOneMux #(BITS) negMux (
        .A(B),
        .B(NotB),
        .select(AluOp[1]),
        .Result(muxOut)
    );
    
    Adder #(BITS) adder (
        .ci(AluOp[1]),
        .A(A),
        .B(muxOut),
        .Result(adderOut)
    );
    
    wire bit;
    wire [BITS-1:0] extended_bit;
    assign bit = adderOut[BITS-1];
    
    extend #(BITS) extender (
        .bit_in(bit),
        .extended_out(extended_bit)
    );
    
    twoToOneMux #(BITS) extendMux (
        .A(adderOut),
        .B(extended_bit),
        .select(AluOp[3]),
        .Result(Result)
    );
    
endmodule
