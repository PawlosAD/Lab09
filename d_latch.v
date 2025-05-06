`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 02:25:42 PM
// Design Name: 
// Module Name: d_latch
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


module d_latch(
    input D,
    input E,
    output reg Q,
    output NotQ
);

    always @(D, E) begin 
        if (E)
            Q <= D; 
    end

    assign NotQ = ~Q; 

endmodule
