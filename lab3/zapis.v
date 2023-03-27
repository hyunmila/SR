`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 17:30:43
// Design Name: 
// Module Name: zapis
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


module zapis #(
    parameter LENGTH = 16
    )(
    input data_s
    );
    integer file_2;
    reg [7:0]i;
    initial
    begin
        #2
        file_2 = $fopen("C:/Users/ja/Desktop/mamdosc/text_out.txt", "wb");
        for(i=0;i<LENGTH*12;i=i+1)
        begin
            #2;
            $fwrite(file_2,"%d",data_s);
        end
        $fclose(file_2);
    end

endmodule
