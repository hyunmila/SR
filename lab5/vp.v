`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 10:53:27 AM
// Design Name: 
// Module Name: vp
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


//module vp(
//    input clk,
//    input de_in,
//    input hsync_in,
//    input vsync_in,
//    input [23:0]pixel_in,
//    input [2:0] sw,
    
//    output de_out,
//    output hsync_out,
//    output vsync_out,
//    output [23:0] pixel_out
//    );
    
//    assign pixel_out = pixel_in;
//    assign hsync_out = hsync_in;
//    assign vsync_out = vsync_in;
//    assign de_out = de_in;
//endmodule


module vp(
    input clk,
    input de_in,
    input hsync_in,
    input vsync_in,
    input [23:0]pixel_in,
////    input [2:0] sw,
    output de_out,
    output hsync_out,
    output vsync_out,
    output [23:0] pixel_out
);
wire [7:0]r;
wire [7:0]g;
wire [7:0]b;

reg r_de = 0;
reg r_hsync = 0;
reg r_vsync = 0;
//reg [23:0]r_rgb = 0;

LUT lut_r(
    .clk(clk),
    .a(pixel_in[23:16]),
    .qspo(r)
);
LUT lut_g(
    .clk(clk),
    .a(pixel_in[15:8]),
    .qspo(g)
);
LUT lut_b(
    .clk(clk),
    .a(pixel_in[7:0]),
    .qspo(b)
);

always @(posedge clk)
begin
    r_de <= de_in;
    r_hsync <= hsync_in;
    r_vsync <= vsync_in;
//    r_rgb <= {r&&g&&b, r&&g&&b, r&&g&&b};
//    r_rgb <= {r&g&b, r&g&b, r&g&b};
end

assign de_out = r_de;
assign hsync_out = r_hsync;
assign vsync_out = r_vsync;
//assign pixel_out = r_rgb;
assign pixel_out = {r&g&b, r&g&b, r&g&b};
//assign pixel_out = r&&g&&b; // nie
//assign pixel_out = {r,g,b};
endmodule

