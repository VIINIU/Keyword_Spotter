// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module design_1 (
  CLK_IN1_D_0_clk_n,
  CLK_IN1_D_0_clk_p,
  UART_TXD_0,
  UART_RXD_0,
  ext_reset_in_0
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_N" *)
  (* X_INTERFACE_MODE = "slave CLK_IN1_D_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK_IN1_D_0, CAN_DEBUG false, FREQ_HZ 200000000" *)
  input CLK_IN1_D_0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_P" *)
  input CLK_IN1_D_0_clk_p;
  (* X_INTERFACE_IGNORE = "true" *)
  output UART_TXD_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input UART_RXD_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_0 RST" *)
  (* X_INTERFACE_MODE = "slave RST.EXT_RESET_IN_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_0, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  input ext_reset_in_0;

  // stub module has no contents

endmodule
