`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2024 06:42:33 PM
// Design Name: 
// Module Name: fourToOneMultiplexer
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


module fourToOneMultiplexer(
    input [1:0]a,
    input [3:0]b,
    output z
    );
    wire i0, i1;
    twoToOneMultiplexer mux0(
        .a(a[0]),
        .b(b[1:0]),
        .z(i0) 
    );
    
    twoToOneMultiplexer mux1(
        .a(a[0]),
        .b(b[3:2]),
        .z(i1) 
    );
    
    twoToOneMultiplexer mux2(
        .a(a[1]),
        .b({i0,i1}),
        .z(z)
    );
    
    
endmodule
