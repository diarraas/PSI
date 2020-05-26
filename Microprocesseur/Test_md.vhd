
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:05:47 04/30/2020
-- Design Name:   
-- Module Name:   C:/Users/hajar/Bureau/PSI/Test_md.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memoire_Donnees
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
use IEEE.STD_LOGIC_ARITH;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_md IS
END Test_md;
 
ARCHITECTURE behavior OF Test_md IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoire_Donnees
    PORT(
         IP : IN  std_logic_vector(7 downto 0);
         DATA_IN : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         DATA_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IP : std_logic_vector(7 downto 0) := (others => '0');
   signal DATA_IN: std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal DATA_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoire_Donnees PORT MAP (
          IP => IP,
          DATA_IN => DATA_IN,
          RW => RW,
          RST => RST,
          CLK => CLK,
          DATA_OUT=> DATA_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
		process
	begin
		
		--IP <= "00000001";
		--DATA_IN <= "11111111";
		--RST <= '0';
		--RW <= '0';
		wait for 10 ns;
		wait for 10 ns;
		
		--IP <= "00000001";
		--DATA_IN <= "11111111";
		--RST <= '0';
		--RW <= '1'; --lecture
		wait for 10 ns;
		wait for 10 ns;
	
		IP <= "00000001";
		DATA_IN <= "11111111";
		RW <= '0';
		RST <= '1';
		RW <= '1';
		wait for 10 ns;
end process;

END;