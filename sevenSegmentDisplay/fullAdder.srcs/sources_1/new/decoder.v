`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2024 10:34:07 PM
// Design Name: 
// Module Name: decoder
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


module decoder (
    input [3:0] bin,  // 4-bit binary input
    output reg [6:0] D  // 7-segment display output (active low)
);

    always @(*) begin
        case (bin)
            4'b0000: D = 7'b1000000;  // Display 0
            4'b0001: D = 7'b1111001;  // Display 1
            4'b0010: D = 7'b0100100;  // Display 2
            4'b0011: D = 7'b0110000;  // Display 3
            4'b0100: D = 7'b0011001;  // Display 4
            4'b0101: D = 7'b0010010;  // Display 5
            4'b0110: D = 7'b0000010;  // Display 6
            4'b0111: D = 7'b1111000;  // Display 7
            4'b1000: D = 7'b0000000;  // Display 8
            4'b1001: D = 7'b0010000;  // Display 9
            4'b1010: D = 7'b0001000;  // Display A
            4'b1011: D = 7'b0000011;  // Display B
            4'b1100: D = 7'b1000110;  // Display C
            4'b1101: D = 7'b0100001;  // Display D
            4'b1110: D = 7'b0000110;  // Display E
            4'b1111: D = 7'b0001110;  // Display F
            default: D = 7'b0000000;  // Turn off all segments
        endcase
    end
endmodule 

