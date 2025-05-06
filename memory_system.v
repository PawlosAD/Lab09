`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 02:26:07 PM
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
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

wire [7:0] demuxData[3:0];
wire [7:0] muxData[3:0];
wire dmStore[3:0];

genvar i;
generate

for (i = 0; i < 4; i = i + 1) begin

byte_memory bm_i (
        .data(demuxData[i]),
        .store(dmStore[i]),
        .memory(muxData[i])
        );
end

endgenerate

demultiplexer dmux(
    .data(data),
    .sel(addr),
    .A(demuxData[0]),
    .B(demuxData[1]),
    .C(demuxData[2]),
    .D(demuxData[3])
    );

demux1 onebitdemux (
    .data(store),
    .sel(addr),
    .A(dmStore[0]),
    .B(dmStore[1]),
    .C(dmStore[2]),
    .D(dmStore[3])
);

mux finalMux (
    .data(memory),
    .sel(addr),
    .A(muxData[0]),
    .B(muxData[1]),
    .C(muxData[2]),
    .D(muxData[3])
);






 endmodule
