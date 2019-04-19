--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Thu Apr 18 14:25:25 2019
--Host        : Ryan-pc running 64-bit major release  (build 9200)
--Command     : generate_target design_2_wrapper.bd
--Design      : design_2_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_2_wrapper is
  port (
    jc_pin10_io : inout STD_LOGIC;
    jc_pin1_io : inout STD_LOGIC;
    jc_pin2_io : inout STD_LOGIC;
    jc_pin3_io : inout STD_LOGIC;
    jc_pin4_io : inout STD_LOGIC;
    jc_pin7_io : inout STD_LOGIC;
    jc_pin8_io : inout STD_LOGIC;
    jc_pin9_io : inout STD_LOGIC;
    reset : in STD_LOGIC;
    seven_seg_led_an_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seven_seg_led_disp_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end design_2_wrapper;

architecture STRUCTURE of design_2_wrapper is
  component design_2 is
  port (
    sys_clock : in STD_LOGIC;
    jc_pin1_o : out STD_LOGIC;
    jc_pin7_i : in STD_LOGIC;
    jc_pin2_o : out STD_LOGIC;
    jc_pin8_i : in STD_LOGIC;
    jc_pin3_o : out STD_LOGIC;
    jc_pin9_i : in STD_LOGIC;
    jc_pin10_o : out STD_LOGIC;
    jc_pin4_o : out STD_LOGIC;
    jc_pin3_i : in STD_LOGIC;
    jc_pin4_i : in STD_LOGIC;
    jc_pin1_i : in STD_LOGIC;
    jc_pin2_i : in STD_LOGIC;
    jc_pin10_t : out STD_LOGIC;
    jc_pin8_t : out STD_LOGIC;
    jc_pin9_t : out STD_LOGIC;
    jc_pin4_t : out STD_LOGIC;
    jc_pin9_o : out STD_LOGIC;
    jc_pin10_i : in STD_LOGIC;
    jc_pin7_t : out STD_LOGIC;
    jc_pin1_t : out STD_LOGIC;
    jc_pin2_t : out STD_LOGIC;
    jc_pin7_o : out STD_LOGIC;
    jc_pin3_t : out STD_LOGIC;
    jc_pin8_o : out STD_LOGIC;
    seven_seg_led_an_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    seven_seg_led_disp_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    reset : in STD_LOGIC
  );
  end component design_2;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal jc_pin10_i : STD_LOGIC;
  signal jc_pin10_o : STD_LOGIC;
  signal jc_pin10_t : STD_LOGIC;
  signal jc_pin1_i : STD_LOGIC;
  signal jc_pin1_o : STD_LOGIC;
  signal jc_pin1_t : STD_LOGIC;
  signal jc_pin2_i : STD_LOGIC;
  signal jc_pin2_o : STD_LOGIC;
  signal jc_pin2_t : STD_LOGIC;
  signal jc_pin3_i : STD_LOGIC;
  signal jc_pin3_o : STD_LOGIC;
  signal jc_pin3_t : STD_LOGIC;
  signal jc_pin4_i : STD_LOGIC;
  signal jc_pin4_o : STD_LOGIC;
  signal jc_pin4_t : STD_LOGIC;
  signal jc_pin7_i : STD_LOGIC;
  signal jc_pin7_o : STD_LOGIC;
  signal jc_pin7_t : STD_LOGIC;
  signal jc_pin8_i : STD_LOGIC;
  signal jc_pin8_o : STD_LOGIC;
  signal jc_pin8_t : STD_LOGIC;
  signal jc_pin9_i : STD_LOGIC;
  signal jc_pin9_o : STD_LOGIC;
  signal jc_pin9_t : STD_LOGIC;
begin
design_2_i: component design_2
     port map (
      jc_pin10_i => jc_pin10_i,
      jc_pin10_o => jc_pin10_o,
      jc_pin10_t => jc_pin10_t,
      jc_pin1_i => jc_pin1_i,
      jc_pin1_o => jc_pin1_o,
      jc_pin1_t => jc_pin1_t,
      jc_pin2_i => jc_pin2_i,
      jc_pin2_o => jc_pin2_o,
      jc_pin2_t => jc_pin2_t,
      jc_pin3_i => jc_pin3_i,
      jc_pin3_o => jc_pin3_o,
      jc_pin3_t => jc_pin3_t,
      jc_pin4_i => jc_pin4_i,
      jc_pin4_o => jc_pin4_o,
      jc_pin4_t => jc_pin4_t,
      jc_pin7_i => jc_pin7_i,
      jc_pin7_o => jc_pin7_o,
      jc_pin7_t => jc_pin7_t,
      jc_pin8_i => jc_pin8_i,
      jc_pin8_o => jc_pin8_o,
      jc_pin8_t => jc_pin8_t,
      jc_pin9_i => jc_pin9_i,
      jc_pin9_o => jc_pin9_o,
      jc_pin9_t => jc_pin9_t,
      reset => reset,
      seven_seg_led_an_tri_o(3 downto 0) => seven_seg_led_an_tri_o(3 downto 0),
      seven_seg_led_disp_tri_o(7 downto 0) => seven_seg_led_disp_tri_o(7 downto 0),
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
jc_pin10_iobuf: component IOBUF
     port map (
      I => jc_pin10_o,
      IO => jc_pin10_io,
      O => jc_pin10_i,
      T => jc_pin10_t
    );
jc_pin1_iobuf: component IOBUF
     port map (
      I => jc_pin1_o,
      IO => jc_pin1_io,
      O => jc_pin1_i,
      T => jc_pin1_t
    );
jc_pin2_iobuf: component IOBUF
     port map (
      I => jc_pin2_o,
      IO => jc_pin2_io,
      O => jc_pin2_i,
      T => jc_pin2_t
    );
jc_pin3_iobuf: component IOBUF
     port map (
      I => jc_pin3_o,
      IO => jc_pin3_io,
      O => jc_pin3_i,
      T => jc_pin3_t
    );
jc_pin4_iobuf: component IOBUF
     port map (
      I => jc_pin4_o,
      IO => jc_pin4_io,
      O => jc_pin4_i,
      T => jc_pin4_t
    );
jc_pin7_iobuf: component IOBUF
     port map (
      I => jc_pin7_o,
      IO => jc_pin7_io,
      O => jc_pin7_i,
      T => jc_pin7_t
    );
jc_pin8_iobuf: component IOBUF
     port map (
      I => jc_pin8_o,
      IO => jc_pin8_io,
      O => jc_pin8_i,
      T => jc_pin8_t
    );
jc_pin9_iobuf: component IOBUF
     port map (
      I => jc_pin9_o,
      IO => jc_pin9_io,
      O => jc_pin9_i,
      T => jc_pin9_t
    );
end STRUCTURE;
