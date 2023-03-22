`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2023 10:22:33 AM
// Design Name: 
// Module Name: tb_kaskada_bramek_and
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


module tb_kaskada_bramek_and #
(
    parameter LENGTH = 8
);

wire out;

reg clk=1'b0;
reg [LENGTH-1:0]cnt=8'b0;
initial
begin
    while(1)
    begin
        #1; clk=1'b0;
        #1; clk=1'b1;
    end
end
always @(posedge clk)
begin
    assign cnt =cnt+1;
end

kaskada_bramek_and #
(
    .LENGTH(8)
)
andys
(
    .x(cnt),
    .y(out)
);
endmodule
