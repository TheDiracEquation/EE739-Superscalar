library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.RS_regs.all;
entity Reservation_Station is
    port (	clk,rst : in std_logic;
	 
            OPCODE1 : in std_logic_vector(3 downto 0);
            PC1 : in std_logic_vector(15 downto 0);
				IMM91 : in std_logic_vector(8 downto 0);
				COND1 : in std_logic_vector(2 downto 0);
				
				OP_READ1 : in std_logic_vector(15 downto 0);
				OP_READ1_V: in std_logic;
								
				OP_READ2 : in std_logic_vector(15 downto 0);
				OP_READ2_V: in std_logic;
				
				CZ_READ1 : in std_logic_vector(1 downto 0);
				CZ_READ1_V : in std_logic;
				
				
				OPCODE2 : in std_logic_vector(3 downto 0);
            PC2 : in std_logic_vector(15 downto 0);
				IMM92 : in std_logic_vector(8 downto 0);
				COND2 : in std_logic_vector(2 downto 0);
				
				OP_READ3 : in std_logic_vector(15 downto 0);
				OP_READ3_V: in std_logic;
				
				OP_READ4 : in std_logic_vector(15 downto 0);
				OP_READ4_V: in std_logic;
				
				CZ_READ2 : in std_logic_vector(1 downto 0);
				CZ_READ2_V : in std_logic
				
				
				
				);
            
            
end entity Reservation_Station;

architecture behav of Reservation_Station is
	signal mem ;
	begin 

	--WHERE OUTPUT
	
	ISSUED_ : ISSUED port map (clk, rst, issued_WE1,issued_WE2,issued_WE3,  ISSUED_A1,ISSUED_D1,ISSUED_A2,ISSUED_D2,ISSUED_A3,ISSUED_D3,ISSUED_op);
	OPCODE_ : OPCODE port map (clk, rst, opcode_WE1, opcode_WE2,OPCODE_A1,OPCODE_D1,OPCODE_A2,OPCODE_D2,OPCODE_Ain1,OPCODE_Ain2,OPCODE_Dout1,OPCODE_Dout2);
	PC_ : PC port map (clk, rst, pc_WE1, pc_WE2,PC_A1,PC_D1,PC_A2,PC_D2,PC_Ain1,PC_Ain2,PC_Dout1,PC_Dout2);
	OPR1_ : OPR1 port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	V1_ : V1 port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	OPR2_ : OPR2 port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	V2_ : V2 port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	IMM9_ : IMM9 port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	CZ_ : CZ port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	VCZ_ : VCZ port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	COND_ : COND port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	READY_ : READY port map (clk, rst, w_enable, ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1,ISSUED_A1);
	
	
	
	
end behav;
