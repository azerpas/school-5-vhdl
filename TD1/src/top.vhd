----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:   
-- Project Name:  
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity top is
  port(
    clk : in std_logic;
    rst : in std_logic;
    entre  : in  std_logic;
    sortie : out std_logic);
end entity top;


architecture rtl of top is


signal sig : std_logic;

begin

  dff_1: entity work.dff
    port map (
      clk => clk,
      rst => rst,
      d   => entre,
      q   => sig);

  dff_2: entity work.dff
    port map (
      clk => clk,
      rst => rst,
      d   => sig,
      q   => sortie);


end architecture rtl;
