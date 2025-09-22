//uart_rx
module uart_rx(    
    input clk,
    input rst,
    input Rx_Serial,
    output reg Rx_Done,
    output reg [7:0] Rx_Out
);

    parameter CLK_FREQ = 100_000_000;   // 100 MHz
    parameter BAUD = 115200;
    localparam BAUD_DIV = CLK_FREQ / BAUD; // 868

    localparam IDLE = 3'b000, RX_START = 3'b001, RX_DATA = 3'b010, RX_STOP = 3'b011;

    // 2-stage synchronizer
    reg rx_sync_0, rx_sync_1;
    wire rx = rx_sync_1;

    always @(posedge clk) begin
        rx_sync_0 <= Rx_Serial;
        rx_sync_1 <= rx_sync_0;
    end

    reg [12:0] clk_count;
    reg [2:0] bit_index;
    reg [2:0] state;
    reg rx_done_int;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            clk_count <= 0;
            bit_index <= 0;
            Rx_Out <= 0;
            rx_done_int <= 0;
        end else begin
            rx_done_int <= 0; // 기본적으로 0 유지
            case(state)
                IDLE: begin
                    clk_count <= 0;
                    bit_index <= 0;
                    if(rx == 0) state <= RX_START; // start bit detect
                end

                RX_START: begin
                    if(clk_count == (BAUD_DIV>>1)) begin // mid start bit
                        clk_count <= 0;
                        state <= RX_DATA;
                    end else clk_count <= clk_count+1;
                end

                RX_DATA: begin
                    if(clk_count == BAUD_DIV-1) begin
                        clk_count <= 0;
                        Rx_Out[bit_index] <= rx; // mid-bit sampling
                        if(bit_index == 7) begin
                            bit_index <= 0;
                            state <= RX_STOP;
                        end else bit_index <= bit_index+1;
                    end else clk_count <= clk_count+1;
                end

                RX_STOP: begin
                    if(clk_count == BAUD_DIV-1) begin
                        clk_count <= 0;
                        rx_done_int <= 1;   // 최소 1clk high
                        state <= IDLE;
                    end else clk_count <= clk_count+1;
                end

                default: state <= IDLE;
            endcase
        end
    end

    // rx_done edge detect + 2clk latch
    reg rx_done_d;
    reg rx_done_latch;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            rx_done_d <= 0;
            rx_done_latch <= 0;
            Rx_Done <= 0;
        end else begin
            rx_done_d <= rx_done_int;
            if(rx_done_int & ~rx_done_d) rx_done_latch <= 2'b11; // 2clk 유지
            else if(rx_done_latch != 0) rx_done_latch <= rx_done_latch - 1'b1;

            Rx_Done <= |rx_done_latch;
        end
    end

endmodule
