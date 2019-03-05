----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2019 05:42:24 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--declare entity
entity debounce is
  Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
end debounce;

architecture DB of debounce is


--use 22 bits to be able to count to 2.5 million 
  signal counter: std_logic_vector (21 downto 0) := (others => '0');
  --create 2 bit long shift register
  signal sft_Reg: std_logic_vector(1 downto 0);
begin


--declare process  
  process(clk, btn) begin
  --check on rising edge
    if rising_edge(clk) then
    --bit 1 gets value from bit 0
    sft_Reg(1) <= sft_Reg(0);
    --bit 0 gets value from button
    sft_Reg(0) <= btn;
    
    --need to count to 2.5 million
    --at the sample rate of 125MHZ this will give 20ms debounce time
        if(unsigned(counter) < 2499999) then
        --while less than 2.5 million output 0
        dbnc <= '0';
           if(sft_Reg(1) = '1' ) then 
           --if bit 1 is high, add to counter
            counter <= std_logic_vector( unsigned(counter) + 1 );
            else
            --reset counter
            counter <= (others => '0');
            end if;
        else
        -- if we reach 2.5M output high
        dbnc <= '1';
        --once the button is released, reset the output and counter
            if(btn = '0') then
               dbnc <= '0';
               counter <= (others => '0');
            end if;   
        end if;
      end if;
  end process;

end DB;
