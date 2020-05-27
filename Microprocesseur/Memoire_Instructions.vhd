----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:08 04/22/2020 
-- Design Name: 
-- Module Name:    Memoire_Instructions - Behavioral 
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
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memoire_Instructions is
    Port ( IP : in  INTEGER; 
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end Memoire_Instructions;

 architecture Behavioral of Memoire_Instructions is
	 type Memoire_Instructions is array (natural range 0 to 255) of std_logic_vector(31 downto 0);
	 signal ROM : Memoire_Instructions;
	 
begin
ROM(0) <= X"06050F00"; -- AFC R5 15
ROM(6) <= X"06060A00"; -- AFC R6 10
ROM(12) <= X"05010500"; -- COP R1 R5 
ROM(18) <= X"05020600"; -- COP R2 R6 
ROM(24) <= X"01030102"; -- ADD R3 R1 R2 
ROM(40) <= x"08040300"; -- STORE @4 R3
ROM(46) <= X"07070400"; -- LOAD 7 @4

process (CLK)	
	begin
	if CLK'event and CLK = '1' then 
		DATA_OUT <= ROM(IP);	
	end if;
	end process;
	
end Behavioral;



