----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2019 11:17:48
-- Design Name: 
-- Module Name: fsm_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_tb is
--  Port ( );
end fsm_tb;

architecture Behavioral of fsm_tb is

  signal clk       : std_logic:= '0';
  signal rst       : std_logic;
  signal sync_1s   : std_logic := '0';
  signal count_out : std_logic_vector(7 downto 0);
  signal count_up  : std_logic;

  constant clk_period : time := 10 ns;

begin
  
  -- Génération du stimuli clk. 
  -- Signal de période clk_period (10 ns), duty cycle 50%
  --clk <= not clk after clk_period/2;
  process
  begin
    clk <= not clk;
    wait for clk_period/2;

    if NOW > 4 us then
    wait;
  end if;
end process;

  -- Génération du stimuli sync_1s
  -- Passe à 1 pendant clk_period, puis reste à 0 pendant 90 ns
  process is
  begin
  --  To Complete
  --  
  --  
  --
  --  
  --  
  --  
    
    
    wait; -- fin du process
  end process;        
 
  -- Génération du stimuli rst et count_up
  -- count_up et rst passe à 1 pendant 20 ns
  -- rst passe à 0 pendant 1 us (count_up reste à 1)
  -- count_up passe à 0 pendant 1 us
  process is
  begin
    rst <= '1';
    count_up <= '1';
    wait for 20 ns;

    rst <= '0';
    wait for 1 us;

    count_up <= '0';
    wait for 1 us;

    wait; -- fin du process
  end process;        
 
  
  fsm_1: entity work.fsm
    port map (
      clk       => clk,
      rst       => rst,
      sync_1s   => sync_1s,
      count_out => count_out,
      count_up  => count_up);


  

end Behavioral;
