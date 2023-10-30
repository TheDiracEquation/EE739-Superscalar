-- REGISTER FOR STORING VALUES FETCHED FROM THE INSTRUCTION MEM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fetchreg is
		port(
				clk, reset, writevalue: in std_logic;
				instr1ip,instr2ip, pc_ip: in std_logic_vector(15 downto 0);
				instr1op, instr2op, pc_op: out std_logic_vector(15 downto 0)
		);
end entity;

architecture pipereg of fetchreg is
	signal instrval1, instrval2, pcval: std_logic_vector(15 downto 0);
begin 
	writeproc: process(writevalue,instr1ip,instr2ip,pc_ip)
	begin
	if(writevalue='1') then -- For writing into the register
		instrval1<=instr1ip;
		instrval2<=instr2ip;
		pcval<=pc_ip;
	end if;
	end process;
	
		ip_proc: process(clk, writevalue, reset, instr1ip,instr2ip, pc_ip)
			
			begin
				   if(reset='1') then -- If reset activates then make everything 0
						pc_op<="0000000000000000";
						instr1op<="0000000000000000";
						instr2op<="0000000000000000";
					elsif (clk'event and clk='0') then -- else keep going
						pc_op<=pcval;
						instr1op<=instr1ip;
						instr2op<=instr2ip;
					end if;
					
			end process;
	end architecture pipereg;