----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:58 04/22/2020 
-- Design Name: 
-- Module Name:    UAL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end UAL;

architecture Behavioral of UAL is
	-- SIGNALS
	signal aux : STD_LOGIC_VECTOR(15 downto 0);
	
begin
	process(A, B, Ctrl_Alu, aux)

	begin 
		--INITIALIZATION
		O <= '0';
		C <= '0';
		N <= '0';
		
		case (Ctrl_Alu) is

		--ADD
		-- 8 bits + 8 bits = 8 bits
		when "001" => aux <= std_logic_vector(to_signed((conv_integer(A)+ conv_integer(B)),16));
			-- Carry C
			if (aux(15 downto 8) /= "00000000") then C <= '1';
			end if;
			-- Overflow O
			if (aux(15 downto 8) /= "00000000") then O <= '1';
				N <= '0';
			end if;
			if (aux(15 downto 8) = "00000000") then O <= '0';
				N <= aux(7);
			end if;
			
			
		--MUL
		when "010" => aux <= std_logic_vector(to_signed((conv_integer(A)* conv_integer(B)),16));
			-- Overflow O
			if (aux(15 downto 8) /= "00000000") then O <= '1';	
			end if;
			-- Negative Result N
			N <= (A(7) XOR B(7));

		--SOU
		when others => aux <= std_logic_vector(to_signed((conv_integer(A)- conv_integer(B)),16));
		-- Negative Result N
		if (aux(15 downto 8) /= "00000000") then O <= '1';
				N <= '1';
		end if;
		end case;
		
	end process;
	
	S<= aux(7 downto 0);

end Behavioral;
