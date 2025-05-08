`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: demultiplexer
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

// Implements 8 bit 1 to 4 demultiplexer with a 2 bit selection line
module demultiplexer(
    input [7:0] data,
    input [1:0] sel,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D

);

    // Always block triggers on any changes to inputs data or sel.
    // And @(*) is used since its a combinational logic block.
    always @(*) begin 
        // Case statement to see which output line would receive data based on the 2 bit selection input sel.
        case(sel)
            // Send data to output A and others get 0, if sel is 2'b00
            2'b00: {D, C, B, A} <= {8'b0, 8'b0, 8'b0, data};
            // Send data to output B and others get 0, if sel is 2'b01
            2'b01: {D, C, B, A} <= {8'b0, 8'b0, data, 8'b0};
            // Send data to output C and others get 0, if sel is 2'b10
            2'b10: {D, C, B, A} <= {8'b0, data, 8'b0, 8'b0};
            // Send data to output D and others get 0, if sel is 2'b11
            2'b11: {D, C, B, A} <= {data, 8'b0, 8'b0, 8'b0};
        endcase
    end

endmodule
