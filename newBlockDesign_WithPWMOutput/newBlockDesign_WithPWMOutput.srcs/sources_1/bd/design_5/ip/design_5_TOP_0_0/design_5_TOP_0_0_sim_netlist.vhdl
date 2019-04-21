-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sun Apr 21 18:10:34 2019
-- Host        : Ryan-pc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/Ryan/Desktop/Spring
--               2019/ECE351/newBlockDesign_WithPWMOutput/newBlockDesign_WithPWMOutput.srcs/sources_1/bd/design_5/ip/design_5_TOP_0_0/design_5_TOP_0_0_sim_netlist.vhdl}
-- Design      : design_5_TOP_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_5_TOP_0_0 is
  port (
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    output : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_5_TOP_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_5_TOP_0_0 : entity is "design_5_TOP_0_0,TOP,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_5_TOP_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_5_TOP_0_0 : entity is "TOP,Vivado 2017.4";
end design_5_TOP_0_0;

architecture STRUCTURE of design_5_TOP_0_0 is
  signal \^data\ : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  \^data\(15 downto 0) <= data(15 downto 0);
  output(15 downto 0) <= \^data\(15 downto 0);
end STRUCTURE;
