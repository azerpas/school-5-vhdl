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


entity mux_sync_2 is
  port (
    clk : in  std_logic;
    rst : in  std_logic;
    a   : in  std_logic_vector(1 downto 0);
    b   : in  std_logic_vector(1 downto 0);
    c   : in  std_logic_vector(1 downto 0);
    d   : in  std_logic_vector(1 downto 0);
    sel : in  std_logic_vector(1 downto 0);
    s   : out std_logic_vector(1 downto 0));
end entity mux_sync_2;

architecture RTL of mux_sync_2 is

begin  -- architecture arch

 process (clk, rst)
  begin
    if rst = '1' then
      s <= (others => '0');
    elsif rising_edge (clk) then
      case sel is
        when "00" => s <= a;
        when "01" => s <= b;
        when "10" => s <= c;
        when "11" => s <= d;             
        when others => null;
      end case;
    end if;
  end process;

end architecture RTL;
