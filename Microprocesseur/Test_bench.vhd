--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:29:26 04/30/2020
-- Design Name:   
-- Module Name:   C:/Users/hajar/Bureau/PSI/Test_bench.vhd
-- Project Name:  PSI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_bench
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_bench IS
END Test_bench;
 
ARCHITECTURE behavior OF Test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_bench
    PORT(
         a_A : IN  std_logic_vector(2 downto 0);
         a_B : IN  std_logic_vector(2 downto 0);
         a_W : IN  std_logic_vector(2 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a_A : std_logic_vector(2 downto 0) := (others => '0');
   signal a_B : std_logic_vector(2 downto 0) := (others => '0');
   signal a_W :  std_logic_vector(2 downto 0):= (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_bench PORT MAP (
          a_A => a_A,
          a_B => a_B,
          a_W => a_W,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
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
	
		--RST <= '1';
		--a_A <= "001";
		--a_B <= "010";
		--a_W <= "010";
		--W <= '1';
		--DATA <= "11111111";
		--wait for 500 ns;
	
		--RST <= '0';
		--a_A <= "011";
		--a_B <= "011";
		--a_W <= "010";
		--W <= '1';
		--DATA <= "11111111";
		--wait for 10 ns;
	
		RST <= '1';
		a_A <= "101";
		a_B <= "110";
		a_W <= "110";
		W <= '1';
		DATA <= "11111111";
		--RST <= '0';
		a_A <="001" ;
		a_B <="111";
		a_W <= "011";
		W <= '0';
		DATA<= "10001111";
		wait for 100 ns;
		--RST <= '0';
		--wait for 10 ns;
end process;
	

END;
