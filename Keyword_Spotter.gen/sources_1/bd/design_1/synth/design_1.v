//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Wed Sep 17 23:02:09 2025
//Host        : VINIBOOK running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (CLK_IN1_D_0_clk_n,
    CLK_IN1_D_0_clk_p,
    UART_RXD_0,
    UART_TXD_0,
    ext_reset_in_0);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK_IN1_D_0, CAN_DEBUG false, FREQ_HZ 200000000" *) input CLK_IN1_D_0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 CLK_IN1_D_0 CLK_P" *) input CLK_IN1_D_0_clk_p;
  input UART_RXD_0;
  output UART_TXD_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.EXT_RESET_IN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.EXT_RESET_IN_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input ext_reset_in_0;

  wire CLK_IN1_D_0_clk_n;
  wire CLK_IN1_D_0_clk_p;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]UART_0_DOUT;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire UART_0_DOUT_VLD;
  wire UART_RXD_0;
  wire UART_TXD_0;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire ext_reset_in_0;
  wire [0:0]proc_sys_reset_0_peripheral_reset;

  design_1_UART_0_0 UART_0
       (.CLK(clk_wiz_0_clk_out1),
        .DIN(UART_0_DOUT),
        .DIN_VLD(UART_0_DOUT_VLD),
        .DOUT(UART_0_DOUT),
        .DOUT_VLD(UART_0_DOUT_VLD),
        .RST(proc_sys_reset_0_peripheral_reset),
        .UART_RXD(UART_RXD_0),
        .UART_TXD(UART_TXD_0));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1_n(CLK_IN1_D_0_clk_n),
        .clk_in1_p(CLK_IN1_D_0_clk_p),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(ext_reset_in_0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_system_ila_0_0 system_ila_0
       (.clk(clk_wiz_0_clk_out1),
        .probe0(UART_0_DOUT),
        .probe1(UART_0_DOUT_VLD));
endmodule
