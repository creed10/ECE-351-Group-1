// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr 17 16:38:05 2019
// Host        : Ryan-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Ryan/Desktop/Spring
//               2019/ECE351/FinalProject/new_HYGRO_BD_HDL/new_HYGRO_BD_HDL.srcs/sources_1/bd/new_design_1/ip/new_design_1_clk_wiz_0_0/new_design_1_clk_wiz_0_0_stub.v}
// Design      : new_design_1_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module new_design_1_clk_wiz_0_0(clk_out1, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,locked,clk_in1" */;
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;
endmodule
