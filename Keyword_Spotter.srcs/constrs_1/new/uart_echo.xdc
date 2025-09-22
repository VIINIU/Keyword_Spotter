set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
    create_clock -add -name sys_clk_pin -period 10.000 [get_ports { clk }];
    # clk pin : E3
# 100 MHz

set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports { rst_n }];
# rst : C12

set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports { rxd }];
set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 } [get_ports { txd }];
# rx pin : C4
# tx pin : D4
set_property PACKAGE_PIN H17 [get_ports rx_led]
set_property IOSTANDARD LVCMOS33 [get_ports rx_led]

## RX byte value on LEDs (LD1~LD8)
set_property PACKAGE_PIN K15 [get_ports {rx_byte_leds[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[0]}]

set_property PACKAGE_PIN J13 [get_ports {rx_byte_leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[1]}]

set_property PACKAGE_PIN N14 [get_ports {rx_byte_leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[2]}]

set_property PACKAGE_PIN R18 [get_ports {rx_byte_leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[3]}]

set_property PACKAGE_PIN V17 [get_ports {rx_byte_leds[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[4]}]

set_property PACKAGE_PIN U17 [get_ports {rx_byte_leds[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[5]}]

set_property PACKAGE_PIN U16 [get_ports {rx_byte_leds[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[6]}]

set_property PACKAGE_PIN V16 [get_ports {rx_byte_leds[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_byte_leds[7]}]