// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Wed Sep 17 23:03:01 2025
// Host        : VINIBOOK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/vini_dir/Keyword_Spotter/Keyword_Spotter.gen/sources_1/bd/design_1/ip/design_1_UART_0_0/design_1_UART_0_0_stub.v
// Design      : design_1_UART_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_UART_0_0,UART,{}" *) (* CORE_GENERATION_INFO = "design_1_UART_0_0,UART,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=UART,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,CLK_FREQ=50000000,BAUD_RATE=115200,PARITY_BIT=none,USE_DEBOUNCER=True}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "UART,Vivado 2024.2" *) 
module design_1_UART_0_0(CLK, RST, UART_TXD, UART_RXD, DIN, DIN_VLD, DIN_RDY, 
  DOUT, DOUT_VLD, FRAME_ERROR, PARITY_ERROR)
/* synthesis syn_black_box black_box_pad_pin="RST,UART_TXD,UART_RXD,DIN[7:0],DIN_VLD,DIN_RDY,DOUT[7:0],DOUT_VLD,FRAME_ERROR,PARITY_ERROR" */
/* synthesis syn_force_seq_prim="CLK" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_clk_out1, INSERT_VIP 0" *) input CLK /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input RST;
  output UART_TXD;
  input UART_RXD;
  input [7:0]DIN;
  input DIN_VLD;
  output DIN_RDY;
  output [7:0]DOUT;
  output DOUT_VLD;
  output FRAME_ERROR;
  output PARITY_ERROR;
endmodule
