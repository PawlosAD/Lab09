`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 09:40:44 AM
// Design Name: 
// Module Name: memory_system
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


module memory_system(
    input clk,
    input store,
    input [7:0] data_in,
    input [1:0] address,
    output [7:0] data_out
    );

    wire [3:0] store_out;
    wire [7:0] mem0, mem1, mem2, mem3;

    demultiplexer demux(
        .store(store),
        .sel(address),
        .store_out(store_out)
    );

    byte_memory mem_a(.data(data_in), .clk(clk), .store(store_out[0]), .memory(mem0));
    byte_memory mem_b(.data(data_in), .clk(clk), .store(store_out[1]), .memory(mem1));
    byte_memory mem_c(.data(data_in), .clk(clk), .store(store_out[2]), .memory(mem2));
    byte_memory mem_d(.data(data_in), .clk(clk), .store(store_out[3]), .memory(mem3));

    multiplexer mux(
        .in0(mem0),
        .in1(mem1),
        .in2(mem2),
        .in3(mem3),
        .sel(address),
        .out(data_out)
    );

endmodule

