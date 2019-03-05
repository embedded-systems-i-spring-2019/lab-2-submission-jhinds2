----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 10:07:50 AM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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


entity alu_tester is
  Port ( sw, btn : in std_logic_vector(3 downto 0);
         clk: in std_logic;
         led : out std_logic_vector(3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

--declare components
component my_alu
  Port (A, B, Opcode: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(3 downto 0) );
end component;

component debounce
  Port (clk: in std_logic;
        btn: in std_logic;
        dbnc: out std_logic );
end component;

--intermediate signals
signal db_btn : std_logic_vector(3 downto 0);
signal inA, inB, OP, led_out : std_logic_vector(3 downto 0);
signal tempA, tempB, tempOP : std_logic_vector(3 downto 0);
signal test : integer;

begin

--portmaps---------------------------------------------------------------------------------

     
--opcode                
Button2: debounce port map(clk => clk,
                           btn => btn(2),
                           dbnc => db_btn(2));
                     
 --A                
Button1: debounce port map(clk => clk,
                           btn => btn(1),
                           dbnc => db_btn(1));                  

--B               
Button0: debounce port map(clk => clk,
                           btn => btn(0),
                           dbnc => db_btn(0));


--reset                
Button3: debounce port map(clk => clk,
                           btn => btn(3),
                           dbnc => db_btn(3));
                           
ALU: my_alu port map(A => inA,
                     B => inB,
                     Opcode => OP,
                     output => led);
                           
--end port maps-----------------------------------------------------------------------------



--declare process

    process(clk)

        begin
        --on rising edge clock
        if(rising_edge(clk)) then
        --declare respective loads
            --load opcode
            if(db_btn(2) = '1') then
                tempOP <= sw;            
            
            end if;
            --loadA
            if(db_btn(1) = '1') then
                tempA <= sw;
            --report "in A";
           end if;
            --loadB    
            if(db_btn(0) = '1') then
                tempB <= sw;
            --report "in B";
            end if;
            --reset values    
            if(db_btn(3) = '1') then
                tempA <= "0000";
                tempB <= "0000";
                tempOP <= "0000";
            end if;
          end if;
        
   end process;
   
 inA <= tempA;
 inB <= tempB;
 OP <= tempOP;
 
 
   
end Behavioral;
