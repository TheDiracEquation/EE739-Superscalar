-- THIS IS THE CODE FOR THE ARF AND RRF
library ieee;
use ieee.std_logic_1164.all;

entity ARF is
	port(
	opra1, oprb1, opra2,oprb2: in std_logic_vector(2 downto 0);
	clk , rst  : in std_logic;
	tag : out std_logic_vector(5 downto 0);
	instr1val1, instr1val2 : out std_logic_vector(15 downto 0);
	instr2val1, instr2val2 : out std_logic_vector(15 downto 0);
	writing, reading : in std_logic 
	);

architecture asliRF of ARF is 
	signal R0 : std_logic_vector(15 downto 0);
	signal R1 : std_logic_vector(15 downto 0);
	signal R2 : std_logic_vector(15 downto 0);
	signal R3 : std_logic_vector(15 downto 0);
	signal R4 : std_logic_vector(15 downto 0);
	signal R5 : std_logic_vector(15 downto 0);
	signal R6 : std_logic_vector(15 downto 0);
	signal R7 : std_logic_vector(15 downto 0);

	signal tag0 : std_logic_vector(4 downto 0);
	signal tag1 : std_logic_vector(4 downto 0);
	signal tag2 : std_logic_vector(4 downto 0);
	signal tag3 : std_logic_vector(4 downto 0);
	signal tag4 : std_logic_vector(4 downto 0);
	signal tag5 : std_logic_vector(4 downto 0);
	signal tag6 : std_logic_vector(4 downto 0);
	signal tag7 : std_logic_vector(4 downto 0);

	signal busy0 : std_logic;
	signal busy1 : std_logic;
	signal busy2 : std_logic;
	signal busy3 : std_logic;
	signal busy4 : std_logic;
	signal busy5 : std_logic;
	signal busy6 : std_logic;
	signal busy7 : std_logic;


begin
	read_proc : process(opra1, oprb1, opra2, oprb2,reading )

	if(readvalue = '1') then
		
		-- ADDRESS 1 OF INSTRUCTION 1

		if(opra1 = "000") then
			instr1val1 <= R0;
			end if;
		if(opra1 = "001") then
			instr1val1 <= R1;
			end if;
		if(opra1 = "010") then
			instr1val1 <= R2;
			end if;
		if(opra1 = "011") then
			instr1val1 <= R3;
			end if;
		if(opra1 = "100") then
			instr1val1 <= R4;
			end if;
		if(opra1 = "101") then
			instr1val1 <= R5;
			end if;	 
		if(opra1 = "110") then
			instr1val1 <= R6;
			end if;
		if(opra1 = "111") then
			instr1val1 <= R7;
		end if;
		
		-- ADDRESS 2 OF INSTRUCTION 1
		
		if(oprb1 = "000") then
			instr1val2 <= R0;
			end if;
		if(oprb1 = "001") then
			instr1val2 <= R1;
			end if;
		if(oprb1 = "010") then
			instr1val2 <= R2;
			end if;
		if(oprb1 = "011") then
			instr1val2 <= R3;
			end if;
		if(oprb1 = "100") then
			instr1val2 <= R4;
			end if;
		if(oprb1 = "101") then
			instr1val2 <= R5;
			end if;
		if(oprb1 = "110") then
			instr1val2 <= R6;
			end if;
		if(oprb1 = "111") then
			instr1val2 <= R7;
		end if;   

		-- ADDRESS 1 OF INSTRUCTION 2

		if(opra2 = "000") then
			instr2val1 <= R0;
			end if;
		if(opra2 = "001") then
			instr2val1 <= R1;
			end if;
		if(opra2 = "010") then
			instr2val1 <= R2;
			end if;
		if(opra2 = "011") then
			instr2val1 <= R3;
			end if;
		if(opra2 = "100") then
			instr2val1 <= R4;
			end if;
		if(opra2 = "101") then
			instr2val1 <= R5;
			end if;	 
		if(opra2 = "110") then
			instr2val1 <= R6;
			end if;
		if(opra2 = "111") then
			instr2val1 <= R7;
		end if;
		
		--ADDRESS 2 OF INSTRUCTION 2

		if(oprb2 = "000") then
			instr2val2 <= R0;
			end if;
		if(oprb2 = "001") then
			instr2val2 <= R1;
			end if;
		if(oprb2 = "010") then
			instr2val2 <= R2;
			end if;
		if(oprb2 = "011") then
			instr2val2 <= R3;
			end if;
		if(oprb2 = "100") then
			instr2val2 <= R4;
			end if;
		if(oprb2 = "101") then
			instr2val2 <= R5;
			end if;
		if(oprb2 = "110") then
			instr2val2 <= R6;
			end if;
		if(oprb2 = "111") then
			instr2val2 <= R7;
		end if;   

	end if;

end architecture;
