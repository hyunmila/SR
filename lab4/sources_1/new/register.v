`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 20:57:58
// Design Name: 
// Module Name: register
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


module register#
(
    parameter N = 0
)
(
    input clk,
    input ce,
    input [N-1:0]d,
    output [N-1:0]q
);
reg [N-1:0]val=1'b0;
always @(posedge clk)
begin
    if(ce) val<=d;
    else val<=val;
end
assign q=val;
endmodule
