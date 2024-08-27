`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 12:33:11 AM
// Design Name: 
// Module Name: twoToOneMux
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


module twoToOneMux#(parameter BITS = 32)(
    input [BITS-1:0]A, //0
    input [BITS-1:0]B, //1
    input select,
    output [BITS-1:0]Result
    );
    
    assign Result = select ? B : A;
endmodule
