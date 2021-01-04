----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
-- 
-- Create Date:    16:19:05 01/24/2019 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name:  TP1 Logique programmable
-- Target Devices: xc7a200tsbg484
-- Tool versions: 
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
use IEEE.STD_LOGIC_1164.all;

entity top is
  port(
    clk : in std_logic;                 -- 100 MHz Clock

    sw  : in  std_logic_vector(7 downto 0);  -- 8 Switches
    led : out std_logic_vector(7 downto 0);  -- 8 LEDs


    btnc : in std_logic;                -- Center button (sert de reset)
    btnd : in std_logic;                -- Down button
    btnl : in std_logic;                -- Left button
    btnr : in std_logic;                -- Right Button
    btnu : in std_logic                 -- Up Button
    );
end top;

architecture Behavioral of top is

  signal count         : std_logic_vector (7 downto 0);
  signal ld_value      : std_logic;
  signal sync_1s       : std_logic;
  signal uart_data_out : std_logic_vector(7 downto 0);
  signal uart_dv       : std_logic;

begin


  -- On assigne le résultat du ET logique aux sorties LED
  led(0) <= count(0) and ld_value;
  led(1) <= count(1) and ld_value;
  led(2) <= count(2) and ld_value;
  led(3) <= count(3) and ld_value;
  led(4) <= count(4) and ld_value;
  led(5) <= count(5) and ld_value;
  led(6) <= count(6) and ld_value;
  led(7) <= count(7) and ld_value;


  -- Instance du module HeartBeat
  HeartBeat_1 : entity work.HeartBeat
    port map (
      Clock => Clk,
      Reset => btnc,
      LED   => ld_value);

-- Instance du module FSM (Final State Machine)
  fsm_1 : entity work.fsm
    port map (
      clk       => clk,
      rst       => btnc,
      sync_1s   => sync_1s,
      count_out => count,
      count_up  => SW(0));

  -- Instance du module sync
  sync_2 : entity work.sync
    port map (
      Clock   => Clk,
      Reset   => btnc,
      sync_1s => sync_1s);



end Behavioral;

