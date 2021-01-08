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
use ieee.std_logic_unsigned.all;



entity dff is

  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
	d         : in  std_logic;
    q         : out std_logic);

end entity dff;

architecture RTL of dff is

  


begin  -- architecture arch



  
  dff_p: process (clk, rst)
    begin
        if  rst = '1' then   -- Si l'entrée reset a le niveau logique 1
            q <= '0';        -- Alors la sortie q prends le niveau logique 0
        elsif rising_edge (clk) then  -- Sinon, sous condition d'un front montant sur l'entrée clk
            q <= d;                     -- La sortie q prend le niveau logique de l'entrée d
       end if;
  end process;

  

end architecture RTL;
