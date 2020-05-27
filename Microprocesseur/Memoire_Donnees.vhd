----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:14 04/22/2020 
-- Design Name: 
-- Module Name:    Memoire_Donnees - Behavioral 
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
use IEEE.STD_LOGIC_ARITH;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memoire_Donnees is
    Port ( IP : in  STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0); -- IN 
           RW : in  STD_LOGIC; 
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DATA_OUT: out  STD_LOGIC_VECTOR (7 downto 0));
end Memoire_Donnees;

architecture Behavioral of Memoire_Donnees is
	 type Memoire_Donnees is array (0 to 255) of std_logic_vector(7 downto 0);
    signal reg : Memoire_Donnees ;
	 signal aux : std_logic_vector(7 downto 0);
begin
	process (CLK)	
	begin
	if CLK'event and CLK = '1' then 
			
		-- RW = 1 for reading
		if(RW = '1') then aux <= reg(to_integer(unsigned(IP)));
		end if;
		
		-- RW = 0 for writing
		if(RW = '0') then reg(to_integer(unsigned(IP)))(7 downto 0) <= DATA_IN(7 downto 0);
		end if;
		
		if(RST = '0') then
			for i in 0 to 255 loop
				reg(i) <= "00000000";
			end loop;
			aux <= reg(to_integer(unsigned(IP)));
		end if;
	end if;
	
	end process;
	DATA_OUT<= aux;

end Behavioral;

