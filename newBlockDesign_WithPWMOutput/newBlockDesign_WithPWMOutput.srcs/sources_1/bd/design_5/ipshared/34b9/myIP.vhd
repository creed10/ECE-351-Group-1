library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TOP is
  Port ( 
        data : in std_logic_vector(31 downto 0);
        output : out std_logic_vector(15 downto 0)
        );
end TOP;

architecture Behavioral of TOP is

begin
output <= data(15 downto 0);
end Behavioral;