----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 01:20:58 PM
-- Design Name: 
-- Module Name: my_alu_TB - Behavioral
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

entity my_alu_TB is
--  Port ( );
end my_alu_TB;

architecture Behavioral of my_alu_TB is

component my_alu
  Port (A, B, Opcode: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(3 downto 0) );
end component;

--intermediate signals
signal A, B, Opcode, Output: std_logic_vector(3 downto 0);


begin

dut: my_alu port map(A => A,
                     B => B,
                     opcode => opcode,
                     output => output);

--simulation process
process
begin

--case 0 add
--this was failing in top level so as im now im only testing this
A <= "0100";
B <= "0011";
opcode <= "0000";
wait for 20ms;

end process;


end Behavioral;
