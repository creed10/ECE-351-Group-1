-- fpga4student.com: FPGA Projects, Verilog projects, VHDL projects 
-- VHDL testbench code for PWM Generator 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PWM_Genenrator IS
END tb_PWM_Genenrator;
 
ARCHITECTURE behavior OF tb_PWM_Genenrator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PWM_Generator
    PORT(
         clk : IN  std_logic;
         DUTY_INCREASE : IN  std_logic;
         DUTY_DECREASE : IN  std_logic;
         PWM_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal DUTY_INCREASE : std_logic := '0';
   signal DUTY_DECREASE : std_logic := '0';

  --Outputs
   signal PWM_OUT : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
   uut: PWM_Generator PORT MAP (
          clk => clk,
          DUTY_INCREASE => DUTY_INCREASE,
          DUTY_DECREASE => DUTY_DECREASE,
          PWM_OUT => PWM_OUT
        );

   -- Clock process definitions
   clk_process :process
   begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin  
  DUTY_INCREASE <= '0';
  DUTY_DECREASE <= '0';
      wait for clk_period*10; 
  DUTY_INCREASE <= '1'; 
      wait for clk_period*10;
  DUTY_INCREASE <= '0';
      wait for clk_period*10; 
  DUTY_INCREASE <= '1';
      wait for clk_period*10;
  DUTY_INCREASE <= '0';
      wait for clk_period*10; 
  DUTY_INCREASE <= '1';
      wait for clk_period*10;
  DUTY_INCREASE <= '0';
      wait for clk_period*10; 
  DUTY_DECREASE <= '1'; 
      wait for clk_period*10;
  DUTY_DECREASE <= '0';
      wait for clk_period*10; 
  DUTY_DECREASE <= '1';
      wait for clk_period*10;
  DUTY_DECREASE <= '0';
      wait for clk_period*10; 
  DUTY_DECREASE <= '1';
      wait for clk_period*10;
  DUTY_DECREASE <= '0';
      wait for clk_period*10;  
  
      -- insert stimulus here 

      wait;
   end process;

END;