--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:22:29 04/22/2020
-- Design Name:   
-- Module Name:   C:/Users/hajar/Bureau/PSI/Test_UAL.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UAL
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_UAL IS
END Test_UAL;
 
ARCHITECTURE behavior OF Test_UAL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UAL
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic;
         C : OUT  std_logic;
         N : OUT  std_logic;
         S: OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic;
   signal C : std_logic;
   signal N : std_logic;
   signal S: std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UAL PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          O => O,
          C => C,
          N => N,
          S=> S
        );
		
		--ADD 2+1 = 3 BON
		--Ctrl_Alu <= "001";
		--A <= "00000010";
		--B <= "00000001";
		
		--SOU 2-1 = 1 BON
		--Ctrl_Alu <= "011";
		--A <= "00000010";
		--B <= "00000001";
		
		--MUL 2*1 = 2 BON
		--Ctrl_Alu <= "010";
		--A <= "00000010";
		--B <= "00000001";
		
		--OVERFLOW O = 1 BON 
		--Ctrl_Alu <= "010";
		--A <= "11111111";
		--B <= "11111111";
		
		--CARRY C = 1 et O = 1 BON
		Ctrl_Alu <= "001";
		A <= "11111111";
		B <= "11111111";
		
		--NEGATIF N = 1 O = 1 BON
		--Ctrl_Alu <= "011";
		--A <= "00000001";
		--B <= "11111111";
		
		--NEGATIF N = 1 
		--Ctrl_Alu <= "010";
		--A <= "11001111";
		--B <= "00000001";
	

END;