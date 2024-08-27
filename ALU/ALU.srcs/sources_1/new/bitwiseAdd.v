`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2024 09:30:37 PM
// Design Name: 
// Module Name: bitwiseAdd
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


module bitwiseAdd(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    wire i1, i2, i3;
    
    assign i1 = a ^ b;
    assign i2 = i1 & ci;
    assign i3 = a & b;
    
    assign s = ci ^ i1;
    
    assign co = i2 | i3;
    
endmodule