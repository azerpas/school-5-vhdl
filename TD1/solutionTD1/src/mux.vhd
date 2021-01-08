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




entity mux is

  port (
    a   : in  std_logic_vector(1 downto 0);
    b   : in  std_logic_vector(1 downto 0);
    c   : in  std_logic_vector(1 downto 0);
    d   : in  std_logic_vector(1 downto 0);
    sel : in  std_logic_vector(1 downto 0);
    s   : out std_logic_vector(1 downto 0));
end entity mux;

architecture RTL of mux is

begin  -- architecture arch

  s <= a when sel = "00" else
       b when sel = "01" else
       c when sel = "10" else
       d;

end architecture RTL;
