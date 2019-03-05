----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 11:04:23 AM
-- Design Name: 
-- Module Name: alu_tester_TB - Behavioral
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

entity alu_tester_TB is
--  Port ( );
end alu_tester_TB;

architecture Behavioral of alu_tester_TB is

--declare ripple adder component
component alu_tester
  Port ( swt, btn : in std_logic_vector(3 downto 0); 
         clk: in std_logic;
         led : out std_logic_vector(3 downto 0));
end component;

--create intermediate signals/initialize them
signal swt, btn, led : std_logic_vector(3 downto 0);
signal clk : std_logic;


begin

--set signals from design to signals in TB
dut: alu_tester port map(swt => swt,
                           btn => btn,
                           clk => clk,
                           led => led);
                           
                           
--declare process for clock---------------------------------------------------------
process 
    begin
    
    --declare clock
    clk <= '1';
    wait for 4ns;
    clk <= '0';
    wait for 4ns;

end process;
--end clock process------------------------------------------------------------------


--declare process for sim
process
    begin
    
    --case 0 ADD
    --load in A
    swt <= "0100";
    btn(1) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    --let go of button
    btn(1) <= '0';
    wait for 1ms;
    --load in B
    swt <= "0011";
    btn(0) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    
    --let go of button
    btn(0) <= '0'; 
    wait for 1ms;
    --load in Opcode
    swt <= "0000";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ------------------------------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 1 SUB
    --use same A and B values
    --load in Opcode
    swt <= "0001";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ------------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 2 A+1
    --use same A value
    --load in Opcode
    swt <= "0010";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 3 A - 1
    --use same value for a
    --load in Opcode
    swt <= "0011";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 4 0 - A
    --use same value for A
    
    --load in Opcode
    swt <= "0100";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 5 A > B
    --use same values for A and B
    
    --load in Opcode
    swt <= "0101";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ----------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 6 shift left logical
    --use same value for A
    
    --load in Opcode
    swt <= "0110";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 7 shift right logical
    --use same value for A
    
    --load in Opcode
    swt <= "0111";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 8 shift right arithmetic
    --use same value for A
    
    --load in Opcode
    swt <= "1000";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 9 not A
    --use same value for A
    
    --load in Opcode
    swt <= "1001";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 10 A and B
    --same values for A and B
    
    --load in Opcode
    swt <= "1010";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ----------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 11 A or B
    --same values for A and B
    
    --load in Opcode
    swt <= "1011";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    --------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 12 A xor B
    --same values for A and B
    
    --load in Opcode
    swt <= "1100";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 13 A xnor B
    --same values for A and B
    
    --load in Opcode
    swt <= "1101";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 14 A nand B
    --same values for A and B
    
    --load in Opcode
    swt <= "1110";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --case 15 A nor B
    --same values for A and B
    
    --load in Opcode
    swt <= "1111";
    btn(2) <= '1';
    --have to wait for 20ms to register
    wait for 21ms;
    ---------------------------------------------------
    
    --let go of button 
    btn(2) <= '0';
    wait for 1ms;
    
    --reset
    btn(3) <= '1';
    wait;
    
end process;



end Behavioral;