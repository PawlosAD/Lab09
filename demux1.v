`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: demux1
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

// Implements 1 bit 1 to 4 demultiplexer with a 2 bit selection line
module demux1(
    input data,
    input [1:0] sel,
    output reg  A,
    output reg  B,
    output reg  C,
    output reg  D

);

    // Always block triggers whenever data or sel changes.
    always @(*) begin 
        // case statement uses sel to figure with output line would receive data while others are reset to 0.
        case(sel)
            // Send data to output A, and others get 0 if sel is 2'b00
            2'b00: {D, C, B, A} <= {1'b0, 1'b0, 1'b0, data};
            // Send data to output B, and others get 0 if sel is 2'b01
            2'b01: {D, C, B, A} <= {1'b0, 1'b0, data, 1'b0};
            // Send data to output C, and others get 0 if sel is 2'b10
            2'b10: {D, C, B, A} <= {1'b0, data, 1'b0, 1'b0};
            // Send data to output D, and others get 0 if sel is 2'b11
            2'b11: {D, C, B, A} <= {data, 1'b0, 1'b0, 1'b0};
        endcase
    end

endmodule
