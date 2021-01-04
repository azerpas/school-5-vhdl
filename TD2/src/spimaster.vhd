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



entity spimaster is

   -- to complete

end entity spimaster;

architecture RTL of spimaster is


  type state_t is (idle_state, start_state, data_state, stop_state);
  signal state : state_t;

  signal shiftreg : std_logic_vector(7 downto 0); -- registre à décalage
  signal count    : std_logic_vector(2 downto 0); -- compteur servant dans
                                                  -- l'état data_state

begin  -- architecture arch

  mosi <= shiftreg(7);

  fsm_p : process (clk, rst) is
  begin  -- process fsm_p
    if rst = '1' then
      -- to complete

    elsif rising_edge(clk) then


      case state is

        when idle_state =>
          -- To complete

        when start_state =>
          -- to complete

        when data_state =>
          if tick_sclk = '1' then
            if count < "111" then
              -- to complete
            else
              -- to complete
            end if;
          end if;

        when stop_state =>
          -- to complete

        when others =>
          -- to complete

      end case;


    end if;
  end process fsm_p;

end architecture RTL;
