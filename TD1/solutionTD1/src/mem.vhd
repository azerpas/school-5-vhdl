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





  process (clk, rst)
  begin  -- process
    if rst = '1' then
      dataout <= (others => '0');
      datav   <= '0';
    elsif rising_edge(clk) then
      datav <= '0';
      -- Ecriture
      if wr = '1' and rd = '0' then

        case addr is
          when "00"   => data(0) <= datain;
          when "01"   => data(1) <= datain;
          when "10"   => data(2) <= datain;
          when "11"   => data(3) <= datain;
          when others => null;
        end case;

      -- Lecture  
      elsif wr = '0' and rd = '1' then
        datav <= '1';
        case addr is
          when "00"   => dataout <= data(0);
          when "01"   => dataout <= data(1);
          when "10"   => dataout <= data(2);
          when "11"   => dataout <= data(3);
          when others => null;
        end case;


      else
        dataout <= (others => '0');

      end if;
    end if;
  end process;


end architecture rtl;
