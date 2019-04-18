----------------------------------------------------------------------------------
-- TEAM ONE
-- 
-- PMOD HYGRO FUNCTIONALITY/IMPLEMENTATION
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Main is
    Port ( 
        mySDA           :   inout std_logic; 
        mySCL           :   inout std_logic;
        myClk           :   in std_logic;
        Reset           :   in std_logic;
        --  Next three ports are for the 7segment display
        Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
        LED_out : out STD_LOGIC_VECTOR (6 downto 0)    
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
    
    signal address              :   std_logic_vector(6 downto 0);
    signal readWrite            :   std_logic;
    signal dataWrite            :   std_logic_vector(7 downto 0);
    signal busySig              :   std_logic;
    signal dataRead             :   std_logic_vector(7 downto 0);
    signal ack                  :   std_logic;
    signal start                :   std_logic := '1';
    signal temp,hum             :   std_logic_vector(15 downto 0) := "0000000000000000";
    signal refresh_counter      :   STD_LOGIC_VECTOR (19 downto 0);
    signal LED_activating_counter:  std_logic_vector(1 downto 0);
    signal LED_num              :   STD_LOGIC_VECTOR (3 downto 0);
    signal output               :   std_logic_vector(15 downto 0);
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

process
begin
    if(start = '1') then
        wait for 15ms;
        --set address
        address <= "1000000";
        start <= '0';
    else -- read temps
        wait for 13ms;
        address <= "0000000";
        ----------------------Read TEMP--------------------------
        temp(15 downto 8) <= dataRead(7 downto 0);
        temp(7 downto 0) <= dataRead(7 downto 0);
        
        -----------------------Read HUM--------------------------
        hum(15 downto 8) <= dataRead(7 downto 0);
        hum(7 downto 0) <= dataRead(7 downto 0);
        
        wait for 1sec;
    end if;
end process;

process(temp)
    variable t : integer := 0;
begin
    t := to_integer(signed(temp));
    t := t / 65536;
    t := (t * 165) - 40;
    output <= std_logic_vector(to_signed(t, 16));
end process;








-----------
process(myClk)
begin 
    if(rising_edge(myClk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
-----------
LED_activating_counter <= refresh_counter(19 downto 18);
-----------
process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "1110"; 
        LED_num <= output(3 downto 0);
    when "01" =>
        Anode_Activate <= "1101";
        LED_num <= output(7 downto 4);    
    when "10" =>
        Anode_Activate <= "1011";
        LED_num <= output(11 downto 8);
    when "11" =>
        Anode_Activate <= "0111";
        LED_num <= output(15 downto 12); 
    end case;
end process;
--------------
--------------
process(LED_num)
begin
case LED_num is
    when "0000" => LED_out <= "0000001"; -- 0
    when "0001" => LED_out <= "1001111"; -- 1
    when "0010" => LED_out <= "0010010"; -- 2
    when "0011" => LED_out <= "0000110"; -- 3
    when "0100" => LED_out <= "1001100"; -- 4
    when "0101" => LED_out <= "0100100"; -- 5
    when "0110" => LED_out <= "0100000"; -- 6
    when "0111" => LED_out <= "0001111"; -- 7
    when "1000" => LED_out <= "0000000"; -- 8
    when "1001" => LED_out <= "0000100"; -- 9
    when "1010" => LED_out <= "0001000"; -- 10
    when "1011" => LED_out <= "1100000"; -- 11
    when "1100" => LED_out <= "0110001"; -- 12
    when "1101" => LED_out <= "1000010"; -- 13
    when "1110" => LED_out <= "0110000"; -- 14
    when "1111" => LED_out <= "0111000"; -- 15
end case;
end process;
--------------
end Behavioral;