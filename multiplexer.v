`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: mux
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

// Implements 4 to 1 multiplexer for 8 bit ddata values and selects one of four 8 bit inputs (A,B,C,D)
// based on 2 bit select signal(sel) and it outputs the selected data on data.
module mux(
    output reg [7:0] data, // 8 bit output from selected input
    input [1:0] sel, // 2 bit select line
    input [7:0] A, // 8 bit input A
    input [7:0] B, // 8 bit input B
    input [7:0] C, // 8 bit input C
    input [7:0] D // 8 bit input D

);

    //Always block triggered by any input change
    always @(*) begin 
        // select input based on 2 bit sel value
        case(sel)
            2'b00: data <= A; // Output A if sel is 00
            2'b01: data <= B; // Output B if sel is 01
            2'b10: data <= C; // Output C if sel is 10
            2'b11: data <= D; // Output D if sel is 11
        endcase
    end

endmodule

