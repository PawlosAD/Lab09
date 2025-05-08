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

// This module implements a memory system that consists of four 8 bit memory locations,
// and it uses a demultiplexer in order to direct input data to one of four memory locations based on a 2 bit adress and a multiplexer to read data from the addressed memory location.
// And a 1 bit demux controls which memory module's store signal would be active for a write operation.

// Represents 4 location memory unit with controlled read/write
module memory_system(
    input [7:0] data, //8 bit input data to store into memory
    input store, // Control signal to enable storage operation
    input [1:0] addr, // 2 bit address selecting one of 4 memory locations
    output [7:0] memory // 8 bit output data form selected memory location
);

    wire [7:0] demuxData[3:0]; // 4 x 8 bit wires for data inputs to memory units
    wire [7:0] muxData[3:0]; // 4 x 8 bit wires for data outputs from memory units
    wire dmStore[3:0]; // 4 x 1 bit wires for write-enable control lines

// generate block that instantiates four byte memory modules in a loop
genvar i;
generate

for (i = 0; i < 4; i = i + 1) begin

// Each byte memory receives demuxed data inpuut and individual store signal
byte_memory bm_i (
        .data(demuxData[i]),
        .store(dmStore[i]),
        .memory(muxData[i])
        );
end

endgenerate

    // 8 bit demultiplexer that routes inptu data to one of four inputs based on addr
demultiplexer dmux(
    .data(data), // 8 bit input data thats to be routed
    .sel(addr), // 2 bit address to select memory destination
    .A(demuxData[0]), // output to memory location 0
    .B(demuxData[1]), // output to memory location 1
    .C(demuxData[2]), // output to memory location 2
    .D(demuxData[3]) // output to memory location 3
    );

    // 1 bit demultiuplexer that routes store control signal to addressed memory location
demux1 onebitdemux (
    .data(store), // 1 bit store enable signal
    .sel(addr), // 2 bit address to select memory destination
    .A(dmStore[0]), // store control for memory location 0
    .B(dmStore[1]), // store control for memory location 1
    .C(dmStore[2]), // store control for memory location 2
    .D(dmStore[3]) // store control for memory location 3
);

    // Multiplexer that selects output from one of four memory modules based on addr
mux finalMux (
    .data(memory), // Final 8 bit output from selected memory location
    .sel(addr), // 2 bit address to select which memory output to read
    .A(muxData[0]), // Data output from memory location 0
    .B(muxData[1]), // Data output from memory location 1
    .C(muxData[2]), // Data output from memory location 2
    .D(muxData[3]) // Data output from memory location 3
);






 endmodule
