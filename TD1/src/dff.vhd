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

entity dff is
  port (
    clk : in  std_logic;
    rst : in  std_logic;
    d   : in  std_logic;
    q   : out std_logic);
end entity dff;

architecture RTL of dff is

begin  -- architecture arch

  process(clk, rst)
  begin
    if rst ='1'
      q <= '0'; 
    elsif rising_edge(clk) then
      q <= d; 
end architecture RTL;
