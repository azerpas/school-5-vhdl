----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    
-- Project Name:  
-- Target Devices: xc7a200tsbg484
-- Tool versions: 
-- Description: 
-- 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity spimaster_tb is

end entity spimaster_tb;

architecture bench of spimaster_tb is

  signal clk       : std_logic := '0';
  signal rst       : std_logic;
  signal send      : std_logic;
  signal tick_sclk : std_logic;
  signal data2send : std_logic_vector(7 downto 0);
  signal cs        : std_logic;
  signal mosi      : std_logic;
  signal sim       : std_logic := '1';

begin  -- architecture arch

  clk <= not clk after 10 ns when sim = '1' else
         '0';



  spimaster_1 : entity work.spimaster
    port map (
      clk       => clk,
      rst       => rst,
      send      => send,
      tick_sclk => tick_sclk,
      data2send => data2send,
      cs        => cs,
      mosi      => mosi);

  tick_sclk_gen: process
  begin
    if sim='1' then
      tick_sclk <= '1';
      wait for 20 ns;
      tick_sclk <= '0';
      wait for 80 ns;
    else
      wait;
    end if;
  end process;        

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    rst <= '1';
    data2send <= x"9A";
    sim <= '1';
    send <= '0';
    wait for 20 ns;
    rst <= '0';
    send <= '1';
    wait for 800 ns;

    
    wait for 40 ns;
    sim <= '0';

    wait;
  end process WaveGen_Proc;






end architecture bench;
