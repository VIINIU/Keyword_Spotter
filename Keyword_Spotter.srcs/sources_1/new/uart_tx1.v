//uart_tx
module uart_tx(
    input clk,
    input rst,
    input start,
    input [7:0] Byte_To_Send,
    output reg Tx_Serial,
    output reg Tx_Done
);
    parameter CLK_FREQ = 100_000_000;
    parameter BAUD = 115200;
    localparam BAUD_DIV = CLK_FREQ / BAUD;

    localparam IDLE=3'b000, START=3'b001, DATA=3'b010, STOP=3'b011;

    reg [2:0] state;
    reg [12:0] clk_count;
    reg [2:0] bit_index;
    reg [7:0] data;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            clk_count <=0;
            bit_index <=0;
            Tx_Serial <=1;
            Tx_Done <=0;
            data <=0;
        end else begin
            case(state)
                IDLE: begin
                    Tx_Serial <=1;
                    Tx_Done <=0;
                    clk_count <=0;
                    bit_index <=0;
                    if(start) begin
                        data <= Byte_To_Send;
                        state <= START;
                    end
                end

                START: begin
                    Tx_Serial <=0;
                    if(clk_count < BAUD_DIV-1) clk_count <= clk_count+1;
                    else begin
                        clk_count <=0;
                        state <= DATA;
                    end
                end

                DATA: begin
                    Tx_Serial <= data[bit_index];
                    if(clk_count < BAUD_DIV-1) clk_count <= clk_count+1;
                    else begin
                        clk_count <=0;
                        if(bit_index==7) begin
                            bit_index <=0;
                            state <= STOP;
                        end else bit_index <= bit_index+1;
                    end
                end

                STOP: begin
                    Tx_Serial <=1;
                    if(clk_count < BAUD_DIV-1) clk_count <= clk_count+1;
                    else begin
                        clk_count <=0;
                        Tx_Done <=1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
