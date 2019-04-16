----------------------------------------------------------------------------------
-- TEAM ONE
-- 
-- PMOD HYGRO FUNCTIONALITY/IMPLEMENTATION
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Main is
    Port ( 
        mySDA           :   inout std_logic; 
        mySCL           :   inout std_logic;
        myClk           :   in std_logic;
        Reset           :   in std_logic;
        --  Next three ports are for the 7segment display
        Clock_100Mhz     :  in STD_LOGIC;
        seg_out          :  out std_logic_vector(6 downto 0);
        AnodeActivate    :  out std_logic_vector(3 downto 0)        
    );
end Main;

architecture Behavioral of Main is
    --I2C master, this will handle controlling the slave (Pmod HYGRO)
    COMPONENT i2c_master IS
      GENERIC(
      input_clk : INTEGER := 50_000_000; --input clock speed from user logic in Hz
      bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
      PORT(
        clk       : IN     STD_LOGIC;                    --system clock
        reset_n   : IN     STD_LOGIC;                    --active low reset
        ena       : IN     STD_LOGIC;                    --latch in command
        addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
        rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
        data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
        busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
        data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
        ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
        sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
        scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
    END COMPONENT;
    
    signal address      :   std_logic_vector(7 downto 0);
    signal readWrite    :   std_logic;
    signal dataWrite    :   std_logic_vector(7 downto 0);
    signal busySig      :   std_logic;
    signal dataRead     :   std_logic_vector(7 downto 0);
    signal ack          :   std_logic;

begin

    Master  :   i2c_master port map(
            clk         =>  myClk,
            reset_n     =>  Reset,
            ena         =>  '1',
            addr        =>  address,
            rw          =>  readWrite,
            data_wr     =>  dataWrite,
            busy        =>  busySig,
            data_rd     =>  dataRead,
            ack_error   =>  ack,
            sda         =>  mySDA,
            scl         =>  mySCL
    );

end Behavioral;
