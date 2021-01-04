----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: dff_tb - Behavioral
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

entity dff_tb is

end dff_tb;

architecture Behavioral of dff_tb is

  signal clk       : std_logic:= '0';
  signal rst       : std_logic;
  signal d         : std_logic := '0';
  signal q  : std_logic;

  constant clk_period : time := 10 ns;

begin
  
  -- Génération du stimuli clk. 
  -- Signal de période clk_period (10 ns), duty cycle 50%
  --clk <= not clk after clk_period/2;
  process
  begin
    clk <= not clk;
    wait for clk_period/2;

    if NOW > 100 ns then
    wait;
    end if;
end process;
       
 
  -- Génération du stimuli rst
  process is
  begin
    rst <= '1';

    wait for 10 ns;

    rst <= '0';
    

    wait; -- fin du process
  end process;

  -- Génération du stimuli D
  process is
  begin
   
   d <= '0';
   wait for 25 ns;
   
   d <= '1';
   wait for 15 ns;
   d <= '0';
   wait for 13 ns;
   d <= '1';
   wait for 14 ns;
   d <= '0';
   wait for 13 ns;
   d <= '1';

    wait; -- fin du process
  end process;        
 
  
  dff_1: entity work.dff
    port map (
      clk       => clk,
      rst       => rst,
      d         => d,
      q         => q);


  

end Behavioral;
