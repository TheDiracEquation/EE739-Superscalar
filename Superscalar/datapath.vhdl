LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity datapath is
    port (
        reset, clk : in std_logic;
        output_proc :  out std_logic_vector(31 DOWNTO 0)
    );
  end entity;

architecture superscalar of datapath is

component fetch is
	port (
				clk, reset: in std_logic;
				pc: in std_logic_vector(15 downto 0);
				instr1, instr2,pcop,pcpush1,pcpush2: out std_logic_vector(15 downto 0));
end component;

component fetchreg is
		port(
				clk, reset, writevalue: in std_logic;
				instr1ip,instr2ip, pc_ip: in std_logic_vector(15 downto 0);
				instr1op, instr2op, pc_op: out std_logic_vector(15 downto 0));
end component;

component decode -- ismei instr decode, tag_gen, flag checks, prf, aayega

--    entity Reservation_Station is
   -- port (	clk,rst : in std_logic;
	 
           -- OPCODE1 : in std_logic_vector(3 downto 0);
           -- PC1 : in std_logic_vector(15 downto 0);
				--IMM91 : in std_logic_vector(8 downto 0);
				--COND1 : in std_logic_vector(2 downto 0);
				
				--OP_READ1 : in std_logic_vector(15 downto 0);
				--OP_READ1_V: in std_logic;
								
				--OP_READ2 : in std_logic_vector(15 downto 0);
				--OP_READ2_V: in std_logic;
				
				--CZ_READ1 : in std_logic_vector(1 downto 0);
				--CZ_READ1_V : in std_logic;
				
				
				--OPCODE2 : in std_logic_vector(3 downto 0);
           -- PC2 : in std_logic_vector(15 downto 0);
			--	IMM92 : in std_logic_vector(8 downto 0);
			--	COND2 : in std_logic_vector(2 downto 0);
				
				--OP_READ3 : in std_logic_vector(15 downto 0);
				--OP_READ3_V: in std_logic;
				
				--OP_READ4 : in std_logic_vector(15 downto 0);
				--OP_READ4_V: in std_logic;
				
				--CZ_READ2 : in std_logic_vector(1 downto 0);
				--CZ_READ2_V : in std_logic
				
				
				
			--	);
            
            
--end entity Reservation_Station;
            
component controlalu is
    port (
            opcode : in std_logic_vector(3 downto 0);
            complement : in std_logic; --bit 3 of instr 
            czcondn : in std_logic_vector(1 downto 0);
            carry, zero : in std_logic;
            contbits : out std_logic_vector(4 downto 0));
    end component;

component int_pipeline is 
    port(
        control: in std_logic_vector(5 downto 0); --controlbits from control store component for alu operations
        ra_data, rb_data, pc_in: in std_logic_vector(15 downto 0);
        imm_data: in std_logic_vector(5 downto 0);
        c_in, z_in: in std_logic;
        c_out, z_out: out std_logic;
        pc_out, alu_out: out std_logic_vector(15 downto 0)
    );
end component;

component ROB is 
generic(
    size : integer := 256 -- size of the ROB  --component inititialising mei is this reqd
);
    port(
			clk,rst : std_logic;
        -- Inputs from dispatch into the ROB
        opcode1, opcode2 : in std_logic_vector(3 downto 0); -- opcodes from dispatch
        pc_dec1, pc_dec2 : in std_logic_vector(15 downto 0); -- pc inputs from the decode and pipeline
        arf_add1, arf_add2 : in std_logic_vector(2 downto 0); -- arf destination addresses from dispatch
        rrf_add1, rrf_add2 : in std_logic_vector(5 downto 0); -- rrf destinations from dispatch
        dataval : in std_logic_vector(15 downto 0); -- 16 bit operand value to be stored
        storeval : in std_logic_vector(15 downto 0);

        -- Inputs from pipeline into the ROB
        pipeout1, pipeout2, pipeout3 : in std_logic_vector(15 downto 0); -- pipeline outputs
        pipe1CZ, pipe2CZ, pipe3CZ : in std_logic_vector(1 downto 0); -- pipeline C and Z outputs
        pcpipe1, pcpipe2, pcpipe3 : in std_logic_vector(15 downto 0);

        -- Retirement of instructions from ROB
        outval1, outval2 : out std_logic_vector(15 downto 0); -- output values for retirement
        dest_arf : out std_logic_vector(2 downto 0); -- output arf destination for retirement and alias correction
        dest_memory :out std_logic_vector(15 downto 0); -- 
        cout,zout,aliasing : out std_logic-- output values for c and z and aliasing bit for retirement
    );
end component;

--component lspipeline

--component controlstore

--aur kya aayega
  signal: 

