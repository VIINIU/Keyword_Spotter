// uart_echo_top.v
module uart_echo_top(
    input clk,
    input rst_n,
    input rxd,
    output txd,
    output rx_led
);
    wire rst = ~rst_n;

    wire [7:0] rx_byte;
    wire rx_done;
    wire tx_done;

    reg tx_start;
    reg [7:0] tx_byte;

    uart_rx u_rx(
        .clk(clk),
        .rst(rst),
        .Rx_Serial(rxd),
        .Rx_Done(rx_done),
        .Rx_Out(rx_byte)
    );

    uart_tx u_tx(
        .clk(clk),
        .rst(rst),
        .start(tx_start),
        .Byte_To_Send(tx_byte),
        .Tx_Serial(txd),
        .Tx_Done(tx_done)
    );
    assign rx_led = rx_done;
    reg rx_done_d;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            tx_start <=0;
            tx_byte <=0;
            rx_done_d <=0;
        end else begin
            rx_done_d <= rx_done;
            if(rx_done & ~rx_done_d) begin
                tx_byte <= rx_byte;
                tx_start <=1;
            end else if(tx_done) begin
                tx_start <=0;
            end
        end
    end
endmodule
