`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 14:54:15
// Design Name: 
// Module Name: tb_maszyna_stanow
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


module tb_maszyna_stanow 
    // #(
    // parameter LENGTH = 16
    // )
    (
    );
    localparam LENGTH = 16;
    wire [7:0] data_ms; //?
    wire send;
    wire y_out;
    reg clk = 1'b0;
    wire rst = 1'b0;
    initial
    begin
        while(1)
        begin
            #1; 
            clk=1'b0;
            #1; 
            clk=1'b1;
        end
    end
    odczyt #(
        .LENGTH(LENGTH)
    )
    read(
        .data(data_ms),
        .send(send)
    );
    maszyna_stanow conn_ms(
    .clk(clk),
    .rst(rst),
    .send(send),
    .data(data_ms),
    .txd(y_out)
    );
    zapis #(
        .LENGTH(LENGTH)
    )
    save(
        .data_s(y_out)
    );
endmodule
