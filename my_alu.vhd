----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 08:41:43 AM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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

entity my_alu is
  Port (A, B, Opcode: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(3 downto 0) );
end my_alu;

architecture Behavioral of my_alu is

--intermediate signals
signal inputA, inputB, alu_out : unsigned(3 downto 0);
begin

        --assign signals
        inputA <= unsigned(A);
        inputB <= unsigned(B);


--alu will be handled by cases in a process
    process(inputA, inputB, Opcode)

        begin

    
        --output cases
        case Opcode is
        when "0000" => alu_out <= inputA + inputB;
        when "0001" => alu_out <= inputA - inputB; --substaction
        when "0010" => alu_out <= inputA + "0001"; -- A + 1
        when "0011" => alu_out <= inputA - "0001"; -- A - 1
        when "0100" => alu_out <= "0000" - inputA; -- 0 - A
        when "0101" => -- A > B comparison
            if(A > B) then
                alu_out <= "0001"; -- 1 if true
            else
                alu_out <= "0000"; -- 0 otherwise
            end if;
        --Note: sll, srl, sra are deemed as incorrect
        -- they have been replaced by functions
        -- unsigned performs logical shift
        -- signed performs arithmetic shifts
        when "0110" => alu_out <= shift_left(inputA, 1); -- shift left logical
        when "0111" => alu_out <= shift_right(inputA, 1); -- shift right logical
        when "1000" => alu_out <= unsigned(shift_right(signed(inputA), 1)); -- right shift arithmetic
        when "1001" => alu_out <= NOT inputA; --not A
        when "1010" => alu_out <= inputA AND inputB; --A and B
        when "1011" => alu_out <= inputA OR inputB; -- A or B
        when "1100" => alu_out <= inputA XOR inputB; -- A xor B
        when "1101" => alu_out <= inputA XNOR inputB; -- A xnor B
        when "1110" => alu_out <= inputA NAND inputB; -- A nand B
        when "1111" => alu_out <= inputA NOR inputB; -- A nor B
        --when others default to 0
        when others => alu_out <= "0000";
        end case;
        
        --assign output
        --output <= std_logic_vector(alu_out);

    end process;
    
output <= std_logic_vector(alu_out);

           
end Behavioral;
