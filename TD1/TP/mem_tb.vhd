-------------------------------------------------------------------------------
-- Title      : Testbench for design mem
-- Project    : 
-------------------------------------------------------------------------------
-- File       : 
-- Author     : 
-- Company    : 
-- Created    : 2020-06-11
-- Last update: 2020-11-02
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-06-11  1.0      griotre Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_tb is

end entity mem_tb;


architecture arch of mem_tb is

  -- component ports
  signal datain  : std_logic_vector(3 downto 0);
  signal dataout : std_logic_vector(3 downto 0);
  signal addr    : std_logic_vector(1 downto 0);
  signal wr      : std_logic;
  signal rd      : std_logic;
  signal datav   : std_logic;

  signal clk : std_logic := '0';
  signal rst : std_logic;
  signal sim : std_logic := '1';

  constant data_0 : std_logic_vector(3 downto 0) := x"A";
  constant data_1 : std_logic_vector(3 downto 0) := x"B";
  constant data_2 : std_logic_vector(3 downto 0) := x"C";
  constant data_3 : std_logic_vector(3 downto 0) := x"D";

  type tab is array(0 to 3) of std_logic_vector(3 downto 0);
  signal data : tab;

begin  -- architecture arch

  data(0) <= data_0;
  data(1) <= data_1;
  data(2) <= data_2;
  data(3) <= data_3;

  mem_1 : entity work.mem
    port map (
      clk     => clk,
      rst     => rst,
      datain  => datain,
      dataout => dataout,
      addr    => addr,
      wr      => wr,
      rd      => rd,
      datav   => datav);


  -- clock generation
  clk <= not clk after 10 ns when sim = '1' else
         '0';

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    rst    <= '1';
    wr     <= '0';
    rd     <= '0';
    datain <= (others => '0');
    addr   <= (others => '0');

    wait for 19 ns;
    rst <= '0';

    wait for 30 ns;

    -- WRITE
    for t in 0 to 3 loop
      wait for 20 ns;
      addr   <= std_logic_vector(to_unsigned(t, addr'length));
      wr     <= '1';
      datain <= data(t);
    end loop;  --t

    wait for 20 ns;
    wr <= '0';

    wait for 40 ns;

    -- READ
    for t in 0 to 3 loop
      wait for 20 ns;
      addr <= std_logic_vector(to_unsigned(t, addr'length));
      rd   <= '1';
    end loop;  --t

    wait for 20 ns;
    rd <= '0';

    wait for 40 ns;
    sim <= '0';

    wait;
  end process WaveGen_Proc;





end architecture arch;

