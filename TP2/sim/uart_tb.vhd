----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2019 16:03:08
-- Design Name: 
-- Module Name: uart_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tb is
--  Port ( );

end uart_tb;

architecture Behavioral of uart_tb is

  signal clk         : std_logic := '0';
  signal rst         : std_logic;
  signal uart_rx_out : std_logic;
  signal uart_tx_in  : std_logic;
  signal data_out    : std_logic_vector(7 downto 0);
  signal dv          : std_logic;


  type tab is array(0 to 3) of std_logic_vector(7 downto 0);

  constant c_CLK_PERIOD : time := 10 ns;

  constant c_CLKS_PER_BIT : integer := 10;

  constant c_COM_PERIOD : time := c_CLKS_PER_BIT * c_CLK_PERIOD;

  signal data_tx : tab;


  constant data_tx_0 : std_logic_vector(7 downto 0) := x"B5";
  constant data_tx_1 : std_logic_vector(7 downto 0) := x"AA";
  constant data_tx_2 : std_logic_vector(7 downto 0) := x"38";
  constant data_tx_3 : std_logic_vector(7 downto 0) := x"42";



begin

  data_tx(0) <= data_tx_0;
  data_tx(1) <= data_tx_1;
  data_tx(2) <= data_tx_2;
  data_tx(3) <= data_tx_3;

 -- Déclarer ici le stimuli pour le signal clock (comme le  TP1)
 

 -- Déclarer ici le stimuli pour le signal rst (comme le TP1)
 


  process is
  begin
    uart_tx_in <= '1';
    wait for 20 ns;

    for t in 0 to 3 loop
      -- Start Bit
      uart_tx_in <= '0';
      wait for c_COM_PERIOD;

      -- Data bit
      for i in 0 to 7 loop
        uart_tx_in <= data_tx(t)(i);
        wait for c_COM_PERIOD;
      end loop;  -- i

      -- Stop Bit
      uart_tx_in <= '1';
      wait for c_COM_PERIOD;

    end loop;  --t

    wait;

  end process;

  check_setup : process is
    variable i : integer range 0 to 4 := 0;
  begin

    report "###### Start Checking UART Receiver Data Output ######";

    for i in 0 to 3 loop


      wait until dv = '1';


      
      assert data_out = data_tx(i)
        report "###### Error in UART Receiver ######" 
        severity error;




    end loop;  -- i

    report "###### Stop Checking UART Receiver Data Output ######";
    report "###### everything is OK                        ######";



    wait;

  end process check_setup;

  uart_1 : entity work.uart
    generic map(
      g_CLKS_PER_BIT => c_CLKS_PER_BIT
      )
    port map (
      clk         => clk,
      rst         => rst,
      uart_rx_out => uart_rx_out,
      uart_tx_in  => uart_tx_in,
      data_out    => data_out,
      dv          => dv);

end Behavioral;
