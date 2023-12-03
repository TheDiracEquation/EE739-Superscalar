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
				CZ_READ1 : in std_logic_vector(5 downto 0);
				CZ_READ1_V : in std_logic;
				
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
				CZ_READ2 : in std_logic_vector(5 downto 0);
				CZ_READ2_V : in std_logic;
				
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
            
            
end entity Reservation_Station;

architecture behav of Reservation_Station is
	signal mem ;
	begin 
	
	ISSUED_ : ISSUED port map (clk, rst, issued_WE1,issued_WE2,issued_WE3,  ISSUED_A1,ISSUED_D1,ISSUED_A2,ISSUED_D2,ISSUED_A3,ISSUED_D3,ISSUED_out);
	
	OPCODE_ : OPCODE port map (clk, rst, opcode_WE1, opcode_WE2,OPCODE_A1,OPCODE_D1,OPCODE_A2,OPCODE_D2,OPCODE_Ain1,OPCODE_Ain2,OPCODE_Dout1,OPCODE_Dout2);
	
	PC_ : PC port map (clk, rst, pc_WE1, pc_WE2,PC_A1,PC_D1,PC_A2,PC_D2,PC_Ain1,PC_Ain2,PC_Dout1,PC_Dout2);
	
	OPR1_ : OPR1 port map (clk, rst, opr1_WE1, opr1_WE2, OPR1_A1, OPR1_D1, OPR1_A2, OPR1_D2, OPR1_Ain1, OPR1_Ain2, OPR1_Dout1, OPR1_Dout2, V1_out, VT_1, VT_2, VT_3, TAG1, TAG2, TAG3, OPR1, OPR2, OPR3);
	
	V1_ : V1 port map (clk, rst, v1_WE1, v1_WE2, V1_A1, V1_D1, V1_A2, V1_D2, V1_out);
	
	OPR2_ : OPR2 port map (clk, rst, opr2_WE1, opr2_WE2, OPR2_A1, OPR2_D1, OPR2_A2, OPR2_D2, OPR2_Ain1, OPR2_Ain2, OPR2_Dout1, OPR2_Dout2, V2_out, VT_1, VT_2, VT_3, TAG1, TAG2, TAG3, OPR1, OPR2, OPR3);
	
	V2_ : V2 port map (clk, rst, v2_WE1, v2_WE2, V2_A1, V2_D1, V2_A2, V2_D2, V2_out);
	
	IMM9_ : IMM9 port map (clk, rst, imm9_WE1,imm9_WE2, IMM9_A1, IMM9_D1, IMM9_A2, IMM9_D2, IMM9_Ain1, IMM9_Ain2, IMM9_Dout1, IMM9_Dout2);
	
	CZ_ : CZ port map (clk, rst, cz_WE1, cz_WE2, CZ_A1, CZ_D1, CZ_A2, CZ_D2, CZ_Ain1, CZ_Ain2, CZ_Dout1, CZ_Dout2, VCZ_out,  VT_1, VT_2, TAG1, TAG2, CZ1, CZ2);
	
	VCZ_ : VCZ port map (clk, rst, vcz_WE1, vcz_WE2, VCZ_A1, VCZ_D1, VCZ_A2, VCZ_D2, VCZ_out);
	
	COND_ : COND port map (clk, rst, cond_WE1, cond_WE2,COND_A1,COND_D1,COND_A2,COND_D2,COND_Ain1,COND_Ain2,COND_Dout1,COND_Dout2);
	
	READY_ : READY port map (clk, rst, cond_WE1, cond_WE2, READY_A1, READY_D1, READY_A2, READY_D2, READY_out);
	
	--TODO ISSUING UNIT PROCESS
	
	free_entry_find : process(clk,rst)
		begin
			for i in 0 to 63 loop
				variable count :integer := 0;
				if (ISSUED_out(i) = "1" and count < 1) then
					RS_FREE1 <= std_logic_vector(to_unsigned(i, 6));
					count = count + 1;
				elsif (ISSUED_out(i) = "1" and count < 2) then
					RS_FREE2 <= std_logic_vector(to_unsigned(i, 6));
					count = count + 1;
					exit;
			end loop;
	end process;

	--OPCODE connections
	opcode_WE1 <= decode_Valid;
	OPCODE_A1 <= RS_FREE1;
	OPCODE_D1 <= OPCODE1;
	opcode_WE2 <= decode_Valid;
	OPCODE_A2 <= RS_FREE2;
	OPCODE_D2 <= OPCODE2;
	--PC connections
	pc_WE1 <= decode_Valid;
	PC_A1 <= RS_FREE1;
	PC_D1 <= PC1;
	pc_WE2 <= decode_Valid;
	PC_A2 <= RS_FREE2;
	PC_D2 <= PC2;
    --IMM9 connections
	imm9_WE1 <= decode_Valid;
	IMM9_A1 <= RS_FREE1;
	IMM9_D1 <= IMM91;
	imm9_WE2 <= decode_Valid;
	IMM9_A2 <= RS_FREE2;
	IMM9_D2 <= IMM92;

	--COND connections
	cond_WE1 <= decode_Valid;
	COND_A1 <= RS_FREE1;
	COND_D1 <= COND1;
	cond_WE2 <= decode_Valid;
	COND_A2 <= RS_FREE2;
	COND_D2 <= COND2;
	
	--OPR1 and OPR2 connections
	opr1_WE1 <= decode_Valid;
	OPR1_A1 <= RS_FREE1;
	OPR1_D1 <= OP_READ1;
	opr1_WE2 <= decode_Valid;
	OPR1_A2 <= RS_FREE2;

	opr2_WE1 <= decode_Valid;
	OPR2_A1 <= RS_FREE1;
	OPR2_D1 <= OP_READ2;
	opr2_WE2 <= decode_Valid;
	OPR2_A2 <= RS_FREE2;

	if DEST1 = OPR1_2 then --IF I2 operands are same as I1 destination 
		OPR1_D2 <= RENAME_TAG;
	else
		OPR1_D2 <= OP_READ3;

	if DEST1 = OPR2_2 then
		OPR2_D2 <= RENAME_TAG;
	else
		OPR2_D2 <= OP_READ4;

	v1_WE1 <= decode_Valid;
	v1_A1<= RS_FREE1;
	v1_D1 <= OP_READ1_V
	v1_WE2 <= decode_Valid;
	v1_A2<= RS_FREE2;
	v1_D2 <= OP_READ3_V

	v2_WE1 <= decode_Valid;
	v2_A1<= RS_FREE1;
	v2_D1 <= OP_READ2_V
	v2_WE2 <= decode_Valid;
	v2_A2<= RS_FREE2;
	v2_D2 <= OP_READ4_V;

	CZ_WE1 <= decode_Valid;
	CZ_A1 <= RS_FREE1;
	CZ_D1 <= CZ_READ1;

	
end behav;