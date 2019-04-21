-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
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
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TOP,Vivado 2017.4";
begin
end;
