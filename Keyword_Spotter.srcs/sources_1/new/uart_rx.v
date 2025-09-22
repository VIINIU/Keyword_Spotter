`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 00:46:58
// Design Name: 
// Module Name: uart_rx
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
// uart_rx.v
// UART Receiver Module
module uart_rx #(
    parameter CLK_FREQ = 100_000_000, // Nexys A7의 기본 클럭: 100MHz
    parameter BAUD_RATE = 9600        // 통신 속도: 9600bps
)(
    input  logic i_clk,
    input  logic i_rx_serial,
    output logic o_rx_dv,
    output logic [7:0] o_rx_byte
);

    // Baud Rate에 맞는 클럭 카운트 값 계산
    localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    // 상태를 나타내기 위한 FSM(Finite State Machine) 변수
    typedef enum logic [2:0] {
        IDLE,
        START_BIT,
        DATA_BITS,
        STOP_BIT,
        CLEANUP
    } state_e;

    state_e r_state = IDLE;

    // 내부 레지스터
    logic [15:0] r_clk_counter = 0;
    logic [2:0]  r_bit_index = 0;
    logic [7:0]  r_rx_byte = 0;
    logic        r_rx_dv = 0;

    assign o_rx_byte = r_rx_byte;
    assign o_rx_dv = r_rx_dv;

    always_ff @(posedge i_clk) begin
        r_rx_dv <= 1'b0; // 기본적으로 Data Valid 신호는 0

        case (r_state)
            IDLE: begin
                if (i_rx_serial == 1'b0) begin // Start Bit (LOW) 감지
                    r_clk_counter <= 0;
                    r_state <= START_BIT;
                end
            end

            START_BIT: begin
                // 비트의 중앙에서 샘플링하기 위해 절반 비트 시간만큼 대기
                if (r_clk_counter == (CLKS_PER_BIT / 2) - 1) begin
                    r_clk_counter <= 0;
                    r_bit_index   <= 0;
                    r_state       <= DATA_BITS;
                end else begin
                    r_clk_counter <= r_clk_counter + 1;
                end
            end

            DATA_BITS: begin
                // 한 비트 시간만큼 대기
                if (r_clk_counter == CLKS_PER_BIT - 1) begin
                    r_clk_counter <= 0;
                    r_rx_byte[r_bit_index] <= i_rx_serial; // 데이터 비트 저장

                    if (r_bit_index == 7) begin
                        r_state <= STOP_BIT;
                    end else begin
                        r_bit_index <= r_bit_index + 1;
                    end
                end else begin
                    r_clk_counter <= r_clk_counter + 1;
                end
            end

            STOP_BIT: begin
                // 한 비트 시간만큼 대기
                if (r_clk_counter == CLKS_PER_BIT - 1) begin
                    r_clk_counter <= 0;
                    r_state       <= CLEANUP;
                end else begin
                    r_clk_counter <= r_clk_counter + 1;
                end
            end

            CLEANUP: begin
                r_rx_dv <= 1'b1; // 데이터 수신 완료 신호 (1 클럭 동안)
                r_state <= IDLE;
            end

            default:
                r_state <= IDLE;
        endcase
    end
endmodule