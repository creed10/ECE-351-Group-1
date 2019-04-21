// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Apr 21 18:10:34 2019
// Host        : Ryan-pc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Ryan/Desktop/Spring
//               2019/ECE351/newBlockDesign_WithPWMOutput/newBlockDesign_WithPWMOutput.srcs/sources_1/bd/design_5/ip/design_5_TOP_0_0/design_5_TOP_0_0_stub.v}
// Design      : design_5_TOP_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TOP,Vivado 2017.4" *)
module design_5_TOP_0_0(data, \output )
/* synthesis syn_black_box black_box_pad_pin="data[31:0],\output [15:0]" */;
  input [31:0]data;
  output [15:0]\output ;
endmodule
