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


module mux(
    output reg [7:0] data,
    input [1:0] sel,
    input [7:0] A,
    input [7:0] B,
    input [7:0] C,
    input [7:0] D

);

    always @(*) begin 
        case(sel)
            2'b00: data <= A;
            2'b01: data <= B;
            2'b10: data <= C;
            2'b11: data <= D;
        endcase
    end

endmodule

