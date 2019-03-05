----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2019 03:10:12 PM
-- Design Name: 
-- Module Name: ripple_TB - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_TB is
--  Port ( );
end ripple_TB;

architecture Behavioral of ripple_TB is

--declare ripple adder component
component ripple_adder
  Port (A, B: in std_logic_vector(3 downto 0);
      Cin: std_logic;
      Cout: out std_logic;
      S: out std_logic_vector(3 downto 0));
end component;

--create intermediate signals/initialize them
signal A, B, S : std_logic_vector(3 downto 0) := (others => '0');
signal Cin, Cout : std_logic := '0';


begin

--set signals from design to signals in TB
dut: ripple_adder port map(A => A,
                           B => B,
                           Cin => Cin,
                           Cout => Cout,
                           S => S);
                           
                           
--declare process for sim
process 
    begin
    
        A <= "0011";
        B <= "0100";
        Cin <= '1';

        --note: expect S = "1000" = 8
        wait for 1ms;
        
        Cin <= '0';
        A <= "0101";
        B <= "1010";

        --note: expect S = "1111" = 15 -> f
        wait for 1ms;
        
        
        A <= "0111";
        B <= "0001";

        --note: expect S = "1000" = 8
        wait for 1ms;
        
        
        
        A <= "1000";
        B <= "0010";

        --note: expect S = "1010" = 10 -> a
        wait for 1ms;
        
        --lets try to overload
         A <= "1111";
         B <= "0011";
       
         --note: expect S = 15 + 3 = 18 -> 2 
         --this happens because it cycles back through the set 0 to 15
         -- carry out should be 1 at this point
         wait for 1ms;
        
        
        --do nothing/ reset
        A <= "0000";
        B <= "0000";
        wait;

end process;

end Behavioral;
