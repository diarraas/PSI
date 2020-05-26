----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:04 05/07/2020 
-- Design Name: 
-- Module Name:    Processeur - Structural 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processeur is
    Port ( 
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           P_QA : out  STD_LOGIC_VECTOR (7 downto 0);
           P_QB : out  STD_LOGIC_VECTOR (7 downto 0));
end Processeur;

	architecture Structural of Processeur is

	component Memoire_Donnees is 
		 Port ( IP : in  STD_LOGIC_VECTOR (7 downto 0);
				  DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0); -- IN 
				  RW : in  STD_LOGIC; -- 
				  RST : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  DATA_OUT: out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component Memoire_Instructions is
    Port ( IP : in  INTEGER;
           CLK : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component Register_bench is 
    Port ( a_A : in  STD_LOGIC_VECTOR (2 downto 0);
           a_B : in  STD_LOGIC_VECTOR (2 downto 0);
           a_W : in  STD_LOGIC_VECTOR (2 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component UAL is 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC;
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
-- SIGNALS 
	subtype curseur is integer range 0 to 255;
	
	--PIPELINE SIGNALS
	signal LIDI : STD_LOGIC_VECTOR(31 downto 0) ; -- A - OP - B - C
	signal DIEX : STD_LOGIC_VECTOR(31 downto 0); -- A - OP - B - C
	signal EXMEM : STD_LOGIC_VECTOR(31 downto 0); -- A - OP - B
	signal MEMRE : STD_LOGIC_VECTOR(31 downto 0); -- A - OP - B

	--INSTRUCTION MEMORY SIGNALS 
	signal IP :curseur; --counter(integer) on l'incremente à chaque front montant de clk
	signal DATA_OUT: STD_LOGIC_VECTOR(31 downto 0); -- recupère les instructions
	
	--REGISTER BENCH SIGNALS
	signal a_A : STD_LOGIC_VECTOR(2 downto 0);
	signal a_B : STD_LOGIC_VECTOR(2 downto 0);
	signal a_W : STD_LOGIC_VECTOR(2 downto 0);
	signal W : STD_LOGIC;
	signal DATA : STD_LOGIC_VECTOR(7 downto 0);
	signal QB : STD_LOGIC_VECTOR(7 downto 0);
	signal QA : STD_LOGIC_VECTOR(7 downto 0);
	
	
	-- UAL SIGNALS
	signal A : STD_LOGIC_VECTOR(7 downto 0);
	signal B : STD_LOGIC_VECTOR(7 downto 0);
	signal Ctrl_Alu : STD_LOGIC_VECTOR(2 downto 0);
	signal S : STD_LOGIC_VECTOR(7 downto 0);
	
	--DATA MEMORY SIGNALS
	signal IP_MD : STD_LOGIC_VECTOR(7 downto 0);
	signal DATA_IN : STD_LOGIC_VECTOR(7 downto 0);
	signal RW : STD_LOGIC;
	signal DATA_MOUT : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	--MAPING 
	MI:  Memoire_Instructions port map(IP,CLK,DATA_OUT); 
	BC:  Register_bench port map(a_A, a_B, a_W, W, DATA, RST, CLK, QA, QB); 
	ALU:  UAL port map(A,B,Ctrl_Alu,open, open, open, S);
	MD:  Memoire_Donnees port map(IP_MD, DATA_IN,RW, RST, CLK, DATA_MOUT);
	
	-- first level of pipeline (link to register bench)
		
	a_A <= LIDI(10 downto 8);
	a_B <= LIDI(2 downto 0);
	a_W <= MEMRE(26 downto 24);
	DATA <= MEMRE(15 downto 8);
	
	A<= DIEX(15 downto 8);
	B<= DIEX(7 downto 0);
	with DIEX(23 downto 16) select -- DIEX_OP
		Ctrl_Alu <= DIEX(18 downto 16) when "00000001", --ADD
		DIEX(18 downto 16) when "00000011", --SOU
		DIEX(18 downto 16) when "00000010"; --MUL	
	
	with EXMEM(23 downto 16) select -- EXEM_OP
		IP_MD <= EXMEM(31 downto 24) when "00001000", --STORE
		EXMEM(15 downto 8) when "00000111"; --LOAD
		
	-- Second level of pipeline (linked to ALU)
		
	with DIEX(23 downto 16) select -- DIEX_OP
		A <= DIEX(15 downto 8) when "00000001", --ADD
		DIEX(15 downto 8) when "00000011", --SOU
		DIEX(15 downto 8) when "00000010"; --MUL
		
	with DIEX(23 downto 16) select -- DIEX_OP
		B <= DIEX(7 downto 0) when "00000001", --ADD
		DIEX(7 downto 0) when "00000011", --SOU
		DIEX(7 downto 0) when "00000010"; --MUL
	
	with DIEX(23 downto 16) select -- DIEX_OP
		Ctrl_Alu <= DIEX(18 downto 16) when "00000001", --ADD
		DIEX(18 downto 16) when "00000011", --SOU
		DIEX(18 downto 16) when "00000010"; --MUL	
			
	--Third level of pipeline (linked Data Memory)
	 
	with EXMEM(23 downto 16) select -- EXEM_OP
		IP_MD <= EXMEM(31 downto 24) when "00001000", --STORE
		EXMEM(15 downto 8) when "00000111"; --LOAD
		
	with EXMEM(23 downto 16) select -- EXEM_OP
		DATA_IN <= EXMEM(15 downto 8) when "00001000"; --STORE
	
	with EXMEM(23 downto 16) select -- EXEM_OP
		RW <= '0' when "00001000", --STORE ecriture
		'1' when "00000111"; --LOAD lecture
	
	--Fourth level of pipeline (linked to Regester Bench)
	
	with MEMRE(23 downto 16) select -- MEMRE
		W <= '1' when "00001000", --STORE ecriture
		'0' when "00000111", --LOAD lecture
		'1' when "00000001", --ADD
		'1' when "00000011", --SOU
		'1' when "00000010", --MUL	
		'1' when "00000110", --AFC
		'0' when "00000101"; --COP
		
	a_W <= MEMRE(26 downto 24);
	DATA <= MEMRE(15 downto 8);
	
	process(CLK)
	begin 
		if CLK' event and CLK = '1' then 
			if(DATA_OUT /= X"00000000") then
				LIDI(31 downto 24) <= DATA_OUT(23 downto 16); -- A
				LIDI(23 downto 16) <= DATA_OUT(31 downto 24); -- OP
				LIDI(15 downto 0) <= DATA_OUT(15 downto 0); -- B, C
				IP <= IP+1;
				DIEX <= LIDI;
				EXMEM <= DIEX;
				MEMRE <= EXMEM;			
				
				if(LIDI(23 downto 16) = "00000001" or LIDI(23 downto 16) = "00000010" or LIDI(23 downto 16) = "00000011") then--MUL			
					DIEX(15 downto 8) <= QA;
					DIEX(7 downto 0) <= QB;
					EXMEM(15 downto 8) <= S;
					MEMRE (15 downto 8) <= EXMEM(15 downto 8); --B
					
				elsif(LIDI(23 downto 16) = "00000101") then -- COP
					DIEX(15 downto 8) <= QA;
					EXMEM(15 downto 8) <= DIEX(15 downto 8); --B
					MEMRE (15 downto 8) <= EXMEM(15 downto 8); --B
					
				elsif(LIDI(23 downto 16) = "00000110") then -- AFC
					DIEX(15 downto 8) <= LIDI(15 downto 8); -- B
					DIEX(7 downto 0) <= LIDI(7 downto 0); -- C				
					EXMEM(15 downto 8) <= DIEX(15 downto 8); --B				
					MEMRE (15 downto 8) <= EXMEM(15 downto 8); --B
					
				elsif (LIDI(23 downto 16) = "00000111") then -- LOAD B<= @j [Ri]<= [@j]
					DIEX(15 downto 8) <= QA; --B
					EXMEM(15 downto 8) <= DIEX(15 downto 8); --B	
					MEMRE(15 downto 8) <= DATA_MOUT;

				elsif (LIDI(23 downto 16) = "00001000") then -- STORE
					DIEX(15 downto 8) <= QA; --B
					EXMEM(15 downto 8) <= DIEX(15 downto 8); --B	
				end if;
			end if;
		end if;
	end process; 

end Structural;

