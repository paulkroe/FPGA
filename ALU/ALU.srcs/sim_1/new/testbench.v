`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2024 08:01:27 PM
// Design Name: 
// Module Name: testbench
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


module testbench;
    parameter NUM_TESTS = 23;
    integer i; // counter
    
    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] aluop;
    
    // Outputs
    wire [31:0] result;
    wire zero;

    // Test clock
    reg clk; // Clock not used in logic, for test sequencing only
    
    // Expected outputs
    reg [31:0] exp_result;
    reg [NUM_TESTS - 1:0] exp_zeros;
    
    // Vector and Error counts
    reg [10:0] vec_cnt, err_cnt;
    
    // Test vectors array (aluop, a, b, exp_result)
    reg [127:0] testvec[NUM_TESTS - 1:0];
    
    // Test clock generation (100 ns period)
    always begin
        clk = 1; #50; 
        clk = 0; #50; 
    end
    
    // Initialization and loading test vectors
    initial begin
        $readmemh("../../../../testvectors_hex.txt", testvec);
        err_cnt = 0; // Initialize error count
        vec_cnt = 0; // Initialize vector count
        
        // Calculate 'exp_zeros' from the 'exp_result'
        for (i = 0; i < NUM_TESTS; i = i + 1) begin
            exp_zeros[i] = (testvec[i][31:0] == 32'b0);
        end
    end
    
    // Test execution triggered by clock
    always @ (posedge clk) begin
        #20; // Setup time before applying inputs
        
        // Assign signals from the testvec array
        {aluop, a, b, exp_result} = testvec[vec_cnt];
        
        #60; // Additional time to simulate delay
        
        // Check outputs against expected results
        if ((result !== exp_result) || (zero !== exp_zeros[vec_cnt])) begin
            $display("Error at %5d ns: aluop = %b a = %h b = %h result = %h (exp %h), zero = %b (exp %b)", 
                     $time, aluop, a, b, result, exp_result, zero, exp_zeros[vec_cnt]);
            err_cnt = err_cnt + 1; // Increment error count
        end
        
        vec_cnt = vec_cnt + 1;
        
        if (vec_cnt >= NUM_TESTS) begin
            $display("%d tests completed with %d errors", vec_cnt, err_cnt);
            $finish; // Terminate simulation after all tests
        end
    end
    
    // Instantiate the ALU
    ALU uut (
        .A(a),
        .B(b),
        .AluOp(aluop),
        .Result(result),
        .Zero(zero)
    );
    
endmodule

