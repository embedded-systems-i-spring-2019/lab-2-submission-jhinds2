----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2019 02:48:08 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
  Port (A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        Cout: out std_logic;
        S: out std_logic_vector(3 downto 0));
end ripple_adder;

architecture Behavioral of ripple_adder is

--declare component
component adder 
  Port (A, B, Cin: in std_logic;
      S, Cout: out std_logic );
end component;


--intermediate Signals
signal C_out: std_logic_vector(3 downto 0) := (others => '0');


begin

Adder_1 : adder port map(A => A(0),
                         B => B(0),
                         Cin => Cin,
                         Cout => C_out(0),
                         S => S(0));
                         
Adder_2 : adder port map(A => A(1),
                         B => B(1),
                         Cin => C_out(0),
                         Cout => C_out(1),
                         S => S(1));                        

Adder_3 : adder port map(A => A(2),
                         B => B(2),
                         Cin => C_out(1),
                         Cout => C_out(2),
                         S => S(2));


Adder_4 : adder port map(A => A(3),
                         B => B(3),
                         Cin => C_out(2),
                         Cout => C_out(3),
                         S => S(3));

--declare Final Carry out
Cout <= C_out(3);


end Behavioral;
