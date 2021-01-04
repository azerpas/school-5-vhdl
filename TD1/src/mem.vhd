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

library IEEE;
use IEEE.std_logic_1164.all;



entity mem is
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    datain  : in  std_logic_vector(3 downto 0);
    dataout : out std_logic_vector(3 downto 0);
    addr    : in  std_logic_vector(1 downto 0);
    wr      : in  std_logic;
    rd      : in  std_logic;
    datav   : out std_logic);
end entity mem;





architecture rtl of mem is

  type tab is array (0 to 3) of std_logic_vector(3 downto 0);
  signal data : tab;

begin



end architecture rtl;
