library ieee;
use ieee.std_logic_1164.all;

entity controlalu is
port (
opcode : in std_logic_vector(3 downto 0);
complement : in std_logic; --bit 3 of instr 
czcondn : in std_logic_vector(1 downto 0);
carry, zero : in std_logic;
contbits : out std_logic_vector(4 downto 0));
end entity;

architecture bhv of controlalu is
signal alusel, aluinpsel : std_logic_vector(1 down to 0); --alusel = 01 add, 10 add w carry, 11 nand
signal modcflag, modzflag : std_logic;

begin

	aluproc : process(opcode,carry,zero)
		begin 
			if(opcode= "0001") then 
				if(czcondn = "00") then
					alusel <= "01";
				elsif(czcondn = "10") then 
					if(carry='1') then
						alusel <= "01";
					else alusel <= "00";
					end if;
				elsif(czcondn = "01") then
					if(zero='1') then
						alusel <= "01";
					else alusel <= "00";
					end if;
				elsif(czcondn = "11") then
					alusel <= "10";
				end if;
	
			elsif(opcode = "0000") then
				alusel <= "01";
	
			elsif(opcode = "0010") then
				if(czcondn = "00") then
					alusel <= "11";
				elsif(czcondn = "10") then 
					if(carry='1') then
						alusel <= "11";
					else alusel <= "00";
					end if;
				elsif(czcondn = "01") then
					if(zero='1') then
						alusel <= "11";
					else alusel <= "00";
					end if;
				elsif(czcondn = "11") then
					alusel <= "00";
				end if;
			end if;
		end process;

	inpproc : process(opcode,complement)
		begin
			if(opcode = "0001" or opcode = "0010") then
				if(complement = '0') then
					aluinpsel <= "00";
				else aluinpsel <= "01";
				end if;
			elsif(opcode = "0000") then
				aluinpsel <= "10";
			else aluinpsel <= "00";
			end if;

	carryproc : process(opcode,carry,zero)
		begin
			if(opcode = "0000" or opcode = "0001") then
			 	modcflag <= '1'; 
			else modcflag <= '0';
			end if;
		end process;

	zeroproc : process(opcode,carry,zero)
		begin
			if(opcode = "0000" or opcode = "0001" or opcode = "0010") then
			 	modcflag <= '1'; 
			else modcflag <= '0';
			end if;
		end process;
	contbits(5 downto 4) <= aluinpsel
	contbits(3 down to 2) <= alusel;
	contbits(1) <= modcflag;
	contbits(0) <= modzflag;

end architecture;




