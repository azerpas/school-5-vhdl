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


entity mux_sync_0 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    a   : in  std_logic_vector(1 downto 0);
    b   : in  std_logic_vector(1 downto 0);
    c   : in  std_logic_vector(1 downto 0);
    d   : in  std_logic_vector(1 downto 0);
    sel : in  std_logic_vector(1 downto 0);
    s   : out std_logic_vector(1 downto 0));
end entity mux_sync_0;

architecture RTL of mux_sync_0 is

  signal s_sig : std_logic_vector(1 downto 0);

begin  -- architecture arch

  mux_1 : entity work.mux
    port map (
      a   => a,
      b   => b,
      c   => c,
      d   => d,
      sel => sel,
      s   => s_sig);

  dff_1 : entity work.dff
    port map (
      clk => clk,
      rst => rst,
      d   => s_sig(0),
      q   => s(0));

  dff_2 : entity work.dff
    port map (
      clk => clk,
      rst => rst,
      d   => s_sig(1),
      q   => s(1));

end architecture RTL;
