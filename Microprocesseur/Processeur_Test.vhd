--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:28:45 05/19/2020
-- Design Name:   
-- Module Name:   C:/Users/hajar/Bureau/PSI/Processeur_Test.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processeur
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
 
ENTITY Processeur_Test IS
END Processeur_Test;
 
ARCHITECTURE behavior OF Processeur_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         P_QA : OUT  std_logic_vector(7 downto 0);
         P_QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal P_QA : std_logic_vector(7 downto 0);
   signal P_QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          RST => RST,
          CLK => CLK,
          P_QA => P_QA,
          P_QB => P_QB
        );

   -- Clock process definitions

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		RST <= '1';
		wait for CLK_period/2;
   end process;
		
	--RST <= '0';
	-- simu of processsor
	--process
	--begin
		--RST <= '0';
		--wait for CLK_period*10;
		--RST <= '1';
		--wait for CLK_period*10;
		--wait for 100 ns;
	--end process;

END;
