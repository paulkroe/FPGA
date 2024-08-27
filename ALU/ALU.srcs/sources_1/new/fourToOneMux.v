`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 11:07:23 PM
// Design Name: 
// Module Name: fourToOneMux
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

//Note: this is not really a mux since it operates on 32bit inputs
module fourToOneMux #(parameter BITS = 32)(
        input [BITS-1:0] A, // 00
        input [BITS-1:0] B, // 01
        input [BITS-1:0] C, // 10
        input [BITS-1:0] D, // 11
        input i0,
        input i1,
        output reg [BITS-1:0] Result
    );
    
    always @(*) begin
        case({i1, i0})
            2'b00: Result = A;
            2'b01: Result = B;
            2'b10: Result = C;
            2'b11: Result = D;
            default: Result = 32'b0; // Default case to handle any other situation
        endcase
    end
    
endmodule


