`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 06:56:56 PM
// Design Name: 
// Module Name: finitStateMachine
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

module finiteStateMachine(
    input wire clk,
    input wire reset,
    input wire left,
    input wire right,
    output reg LC,
    output reg LB,
    output reg LA,
    output reg RA,
    output reg RB,
    output reg RC
    );

    // Define type state_t
    typedef enum logic [5:0] { 
        IDLE    = 6'b000000,
        left_0  = 6'b001000,
        left_1  = 6'b011000,
        left_2  = 6'b111000,
        right_0 = 6'b000100,
        right_1 = 6'b000110,
        right_2 = 6'b000111
    } state_t;

    reg clk_en;
    
    // Instantiate clock divider
    clk_div clock (
        .clk(clk),
        .rst(reset),
        .clk_en(clk_en)
    );

    // State variable
    state_t current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else if (clk_en)
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE, left_2, right_2: begin
                if (left & !right & !reset)
                    next_state = left_0;
                else if (!left & right & !reset)
                    next_state = right_0;
                else
                    next_state = IDLE;
            end
            left_0: begin
                if (reset)
                    next_state = IDLE;
                else 
                    next_state = left_1;
                end
            left_1: begin
                if (reset)
                    next_state = IDLE;
                else 
                    next_state = left_2;
                end
            right_0: begin
                if (reset)
                    next_state = IDLE;
                else 
                    next_state = right_1;
                end
            right_1: begin
                if (reset)
                    next_state = IDLE;
                else 
                    next_state = right_2;
                end
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            IDLE: {LC, LB, LA, RA, RB, RC} = 6'b000000;
            left_0: {LC, LB, LA, RA, RB, RC} = 6'b001000;
            left_1: {LC, LB, LA, RA, RB, RC} = 6'b011000;
            left_2: {LC, LB, LA, RA, RB, RC} = 6'b111000;
            right_0: {LC, LB, LA, RA, RB, RC} = 6'b000100;
            right_1: {LC, LB, LA, RA, RB, RC} = 6'b000110;
            right_2: {LC, LB, LA, RA, RB, RC} = 6'b000111;
            default: {LC, LB, LA, RA, RB, RC} = 6'b000000;
        endcase
    end
    
endmodule
