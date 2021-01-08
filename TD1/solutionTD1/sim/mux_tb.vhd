----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux_tb is

end mux_tb;

architecture Behavioral of mux_tb is

  signal a   : std_logic_vector(1 downto 0);
  signal b   : std_logic_vector(1 downto 0);
  signal c   : std_logic_vector(1 downto 0);
  signal d   : std_logic_vector(1 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal s   : std_logic_vector(1 downto 0);

begin

  -- Génération du stimuli A
  process is
  begin

    sel <= "00";
    a   <= "00";
    b   <= "00";
    c   <= "00";
    d   <= "00";
    wait for 10 ns;

    sel <= "00";
    a   <= "00";
    wait for 10 ns;
    a   <= "01";
    wait for 10 ns;
    a   <= "10";
    wait for 10 ns;
    a   <= "11";
    wait for 10 ns;

    sel <= "01";
    b   <= "00";
    wait for 10 ns;
    b   <= "01";
    wait for 10 ns;
    b   <= "10";
    wait for 10 ns;
    b   <= "11";
    wait for 10 ns;

    sel <= "10";
    c   <= "00";
    wait for 10 ns;
    c   <= "01";
    wait for 10 ns;
    c   <= "10";
    wait for 10 ns;
    c   <= "11";
    wait for 10 ns;

    sel <= "11";
    d   <= "00";
    wait for 10 ns;
    d   <= "01";
    wait for 10 ns;
    d   <= "10";
    wait for 10 ns;
    d   <= "11";
    wait for 10 ns;

    wait;                               -- fin du process
  end process;

  mux_1 : entity work.mux
    port map (
      a   => a,
      b   => b,
      c   => c,
      d   => d,
      sel => sel,
      s   => s);

end Behavioral;
