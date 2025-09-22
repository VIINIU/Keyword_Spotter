`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 00:50:57
// Design Name: 
// Module Name: top
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

// uart_led_top.v
// Top module to control an LED via UART
module uart_led_top (
    input  logic clk,       // 100MHz clock
    input  logic uart_rxd,  // UART RX pin
    output logic led        // LED pin (1개)
);

    logic [7:0] rx_byte;
    logic       rx_dv;
    logic       led_reg = 1'b0; // LED 상태를 저장할 레지스터

    // UART 수신 모듈 인스턴스화
    uart_rx #(
        .CLK_FREQ(100_000_000),
        .BAUD_RATE(9600)
    ) uart_rx_inst (
        .i_clk(clk),
        .i_rx_serial(uart_rxd),
        .o_rx_dv(rx_dv),
        .o_rx_byte(rx_byte)
    );

    // 데이터 수신이 완료되었을 때 (rx_dv가 1일 때)
    always_ff @(posedge clk) begin
        if (rx_dv) begin
            // ASCII '1' (0x31)을 받으면 LED 켜기
            if (rx_byte == 8'h31) begin
                led_reg <= 1'b1;
            // ASCII '0' (0x30)을 받으면 LED 끄기
            end else if (rx_byte == 8'h30) begin
                led_reg <= 1'b0;
            end
        end
    end

    // 레지스터 값을 실제 LED 출력으로 연결
    assign led = led_reg;

endmodule