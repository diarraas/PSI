----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:18:03 04/30/2020 
-- Design Name: 
-- Module Name:    Register_bench - Behavioral 
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
use IEEE.STD_LOGIC_ARITH;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_bench is
    Port ( a_A : in  STD_LOGIC_VECTOR (2 downto 0);
           a_B : in  STD_LOGIC_VECTOR (2 downto 0);
           a_W : in  STD_LOGIC_VECTOR (2 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end Register_bench;

architecture Behavioral of Register_bench is
	type bench is array (0 to 255) of std_logic_vector(7 downto 0);
	signal reg : bench ;

	begin
		process (CLK)
			variable i : integer range 0 to 255;
		begin
			if CLK'event and CLK = '1' then 
					if RST = '0' then
						 for i in 0 to 255 loop
							reg(i) <= x"00";
						end loop;
					else
						 if W = '1' then
							  reg(to_integer(unsigned(a_W))) <= DATA ;
						 end if;
					end if;
			  end if;
		end process;
		QA <= reg(to_integer(unsigned(a_A))) when (a_A /= a_W) or W = '0'  else DATA;
		QB <= reg(to_integer(unsigned(a_B))) when (a_B /= a_W) or W = '0' else DATA ;
end Behavioral;

