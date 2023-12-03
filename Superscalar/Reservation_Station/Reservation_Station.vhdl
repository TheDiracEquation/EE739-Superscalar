library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.RS_regs.all;
entity Reservation_Station is
    port (		clk,rst , decode_Valid: in std_logic;
	 
				--INSTRUCTION 1
				OPCODE1 : in std_logic_vector(3 downto 0);
				PC1 : in std_logic_vector(15 downto 0);
				DEST1 : in std_logic_vector(2 downto 0);
				IMM91 : in std_logic_vector(8 downto 0);
				COND1 : in std_logic_vector(2 downto 0);				
				OP_READ1 : in std_logic_vector(15 downto 0);
				OP_READ1_V: in std_logic;								
				OP_READ2 : in std_logic_vector(15 downto 0);
				OP_READ2_V: in std_logic;	

				CZ_READ : in std_logic_vector(5 downto 0);
				CZ_READ_V : in std_logic;
				
				--INSTRUCTION 2
				OPCODE2 : in std_logic_vector(3 downto 0);
            	PC2 : in std_logic_vector(15 downto 0);
				DEST2 : in std_logic_vector(2 downto 0);
				IMM92 : in std_logic_vector(8 downto 0);
				COND2 : in std_logic_vector(2 downto 0);
				OPR1_2 : in std_logic_vector(2 downto 0);
				OPR2_2 : in std_logic_vector(2 downto 0);			
				OP_READ3 : in std_logic_vector(15 downto 0);
				OP_READ3_V: in std_logic;				
				OP_READ4 : in std_logic_vector(15 downto 0);
				OP_READ4_V: in std_logic;				
				
				--TAGBUS
				VT_1 : in std_logic;
				VT_2 : in std_logic;
				VT_3 : in std_logic;
				TAG1 : in std_logic_vector(5 downto 0);
				TAG2 : in std_logic_vector(5 downto 0);
				TAG3 : in std_logic_vector(5 downto 0);
				OPR1 : in std_logic_vector(15 downto 0);
				OPR2 : in std_logic_vector(15 downto 0);
				OPR3 : in std_logic_vector(15 downto 0)
				
				
				);
            
            

	SCHIZOPHRENIC EPISODE : YOU JUST GAVE ISSUED 5 WRITE PORTS. WAKE UP TOMORROW


end entity Reservation_Station;

architecture behav of Reservation_Station is
		signal  V1_D2, V2_D2, VCZ_D2 : std_logic;
		signal	RS_FREE1, RS_FREE2, CZ_D2 :std_logic_vector(5 downto 0);
		signal    OPR1_D2, OPR2_D2 :std_logic_vector(15 downto 0);
		signal	V1_out, V2_out, VCZ_out, ISSUED_out :std_logic_vector(63 downto 0);
	begin 
	
	ISSUED1 : ISSUED port map (clk, rst, decode_Valid,decode_Valid,decode_Valid,<>, <>, <>, RS_FREE1,ISSUED_D1,RS_FREE2,ISSUED_D2,ISSUED_A3,ISSUED_D3,ISSUED_A4,ISSUED_D4,ISSUED_A5,ISSUED_D5,ISSUED_out);
	
	OPCODE1 : OPCODE port map (clk, rst, decode_Valid, decode_Valid,RS_FREE1,OPCODE1,RS_FREE2,OPCODE2,OPCODE_Ain1,OPCODE_Ain2,OPCODE_Dout1,OPCODE_Dout2);
	
	PC1 : PC port map (clk, rst, decode_Valid, decode_Valid,RS_FREE1,PC1,RS_FREE2,PC2,PC_Ain1,PC_Ain2,PC_Dout1,PC_Dout2);
	
	OPR11 : OPR1 port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, OP_READ1, RS_FREE2, OPR1_D2, OPR1_Ain1, OPR1_Ain2, OPR1_Dout1, OPR1_Dout2, V1_out, VT_1, VT_2, VT_3, TAG1, TAG2, TAG3, OPR1, OPR2, OPR3);
	
	V11 : V1 port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, OP_READ1_V, RS_FREE2, V1_D2, V1_out);
	
	OPR21 : OPR2 port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, OP_READ2, RS_FREE2, OPR2_D2, OPR2_Ain1, OPR2_Ain2, OPR2_Dout1, OPR2_Dout2, V2_out, VT_1, VT_2, VT_3, TAG1, TAG2, TAG3, OPR1, OPR2, OPR3);
	
	V21 : V2 port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, OP_READ2_V, RS_FREE2, V2_D2, V2_out);
	
	IMM91 : IMM9 port map (clk, rst, decode_Valid,decode_Valid, RS_FREE1, IMM91, RS_FREE2, IMM92, IMM9_Ain1, IMM9_Ain2, IMM9_Dout1, IMM9_Dout2);
	
	CZ1 : CZ port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, CZ_READ1, RS_FREE2, CZ_D2, CZ_Ain1, CZ_Ain2, CZ_Dout1, CZ_Dout2, VCZ_out,  VT_1, VT_2, TAG1, TAG2, CZ1, CZ2);
	
	VCZ1 : VCZ port map (clk, rst, decode_Valid, decode_Valid, RS_FREE1, CZ_READ_V, RS_FREE2, VCZ_D2 , VCZ_out);
	
	COND1 : COND port map (clk, rst, decode_Valid, decode_Valid,RS_FREE1,COND1,RS_FREE2,COND2,COND_Ain1,COND_Ain2,COND_Dout1,COND_Dout2);
	
	READY1 : READY port map (clk, rst, decode_Valid, READY_input, READY_out);
	
	--TODO ISSUING UNIT PROCESS
	
	free_entry_find : process(clk,rst)
		shared variable count :integer := 0;
		begin		
			for i in 0 to 63 loop
				
				if (ISSUED_out(i) = "1" and count < 1) then
					RS_FREE1 <= std_logic_vector(to_unsigned(i, 6));
					count := count + 1;
				elsif (ISSUED_out(i) = "1" and count < 2) then
					RS_FREE2 <= std_logic_vector(to_unsigned(i, 6));
					count := 0;
					exit;
				end if;
			end loop;
	end process;

	ready_top3 : process(clk,rst)
	shared variable count :integer := 0;
	begin		
		for i in 0 to 63 loop
			
			if (READY_out(i) = "1" and count < 1) then
				RS_FREE1 <= std_logic_vector(to_unsigned(i, 6));
				count := count + 1;
			elsif (READY_out(i) = "1" and count < 2) then
				RS_FREE2 <= std_logic_vector(to_unsigned(i, 6));
				count := count + 1;
				exit;
			elsif (REAY_out(i) = "1" and count < 2) then
				RS_FREE2 <= std_logic_vector(to_unsigned(i, 6));
				count := 0;
				exit;
			end if;
		end loop;
end process;

	
	process(clk,rst)
		begin
			if DEST1 = OPR1_2 then --IF I2 operands are same as I1 destination 
				OPR1_D2 <= RENAME_TAG;
				V1_D2 <= "0";
			else
				OPR1_D2 <= OP_READ3;
				V1_D2 <= OP_READ3_V;
			end if;
			
			if DEST1 = OPR2_2 then
				OPR2_D2 <= RENAME_TAG;
				V2_D2 <= "0";
			else
				OPR2_D2 <= OP_READ4;
				V2_D2 <= OP_READ4_V;
			end if;

			if (to_integer(unsigned(OPCODE1)) < 4) then --IF I1 is an INT instr
				CZ_D2 <= RENAME_TAG;
				VCZ_D2 <= '0';
			else 
				CZ_D2 <= CZ_READ;
				VCZ_D2 <= CZ_READ_V;
			end if;
	end process;
	READY_input <= (NOT ISSUED_out) AND (V1_out) AND (V2_out) AND (VCZ_out);
	
end behav;