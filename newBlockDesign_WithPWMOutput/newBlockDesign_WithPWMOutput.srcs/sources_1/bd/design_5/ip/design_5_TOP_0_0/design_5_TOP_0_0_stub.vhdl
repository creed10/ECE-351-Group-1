-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sun Apr 21 18:10:34 2019
-- Host        : Ryan-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/Ryan/Desktop/Spring
--               2019/ECE351/newBlockDesign_WithPWMOutput/newBlockDesign_WithPWMOutput.srcs/sources_1/bd/design_5/ip/design_5_TOP_0_0/design_5_TOP_0_0_stub.vhdl}
-- Design      : design_5_TOP_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_5_TOP_0_0 is
  Port ( 
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    output : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end design_5_TOP_0_0;

architecture stub of design_5_TOP_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data[31:0],output[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TOP,Vivado 2017.4";
begin
end;
