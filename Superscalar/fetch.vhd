-- STAGE 1 : FOR FETCHING INSTRUCTIONS FROM INSTRUCTION MEMORY 
-- AND INCREMENTING PC.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetch is
	port (
				clk, reset: in std_logic;
				pc: in std_logic_vector(15 downto 0);
				instr1, instr2,pcop,pcpush1,pcpush2: out std_logic_vector(15 downto 0)
			);
end entity;

architecture stage1 of fetch is 
			-- To fetch 7 bit instructions from the intruction memory
			component instrucmem is
				 port(
					  mem_A : in std_logic_vector(15 downto 0);

					  instruction1, instruction2 : out std_logic_vector(7 downto 0));
				 
			end component;
			
			-- To increment the PC by 4 every cycle to fetch 2 instructions
			component pcincrement is 
			port(
				PCin : in std_logic_vector(15 downto 0);
				PCout : out std_logic_vector(15 downto 0)
				);
			end component;
			
			-- To increment the PC by two so that it can be passed on with the instructions
			component addtwo is 
			port(
				input : in std_logic_vector(15 downto 0);
				output : out std_logic_vector(15 downto 0)
				);
			end component;


signal store1 , store2, pcinc : std_logic_vector(15 downto 0);	
			
			
begin
			
-- Gets two 16 bit values from the memory
read_memory : instrucmem port map(mem_A => pc, instruction1 => store1, instruction2 => store2); 

pcpush1 <= pc;

-- Increments PC to get next set of instructions
increase_pc_by_4 : pcincrement port map(PCin => pc, PCout => pcinc);

--Increments PC to get PC to sdend with the instructions
increase_PC_by_2 : addtwo port map(input => pc, output => pcpush2);
			
-- Puts instruction to output
instr1 <= store1;
instr2 <= store2;
		
check: process(clk, reset)
	begin
	if(reset='1') then 
		pcop<="0000000000000000"; -- If reset is 1 all bits go to 0
		
	elsif (clk'event and clk='0') then 
		if((store1(15 downto 15) /= "1") or (store2(15 downto 15) /= "1")) then
				pcop<=pcinc; -- Until all bits of PC are 1 , keep incrementing PC
			
		else
			pcop <= pc; -- If they are stop incrementing
		end if;
	end if;
end process;

end architecture stage1;