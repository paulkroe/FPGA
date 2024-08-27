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

module logicModule#(parameter BITS = 32)(
    input [BITS-1:0] A,
    input [BITS-1:0] B,
    input [3:0] AluOp,
    output [BITS-1:0] Result
    );
    
    wire [BITS-1:0] AandB, AorB, AxorB, AnorB;

    // Perform bitwise operations (TODO: implement gate level module)
    assign AandB = A & B;
    assign AorB = A | B;
    assign AxorB = A ^ B;
    assign AnorB = ~(A | B);
    
    // Instantiate fourToOneMux to select the desired operation
    fourToOneMux #(BITS) mux(
        .A(AandB), //00
        .B(AorB),  //01
        .C(AxorB), //10
        .D(AnorB), //11
        .i0(AluOp[0]),
        .i1(AluOp[1]),
        .Result(Result)
    );
    
endmodule