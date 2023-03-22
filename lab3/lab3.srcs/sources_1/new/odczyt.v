`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 15:35:58
// Design Name: 
// Module Name: odczyt
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


module odczyt #(
    parameter LENGTH = 16
    )(
    output [7:0] data,
    output send
    );
    integer file_1;
    reg [7:0]data_i;
    reg [7:0]i;
    reg send_r = 1'b0;
    initial
    begin
        file_1 = $fopen("C:/Users/ja/Desktop/mamdosc/text.txt", "rb");
        for(i=0;i<LENGTH;i=i+1)
        begin
            
            data_i=$fgetc(file_1);
            #24;
        end
        $fclose(file_1);
    end

    always 
    begin
        #2
        send_r = 1'b1;
        #2;
        send_r = 1'b0;
        #20;
    end
    assign data = data_i;
    assign send = send_r;
endmodule
