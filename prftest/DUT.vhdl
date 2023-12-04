-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(91 downto 0);
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is
   component robtest is
    generic(
    size : integer := 256 -- size of the ROB
);
    port(
			clk,rst : in std_logic;
        -- Inputs from dispatch into the ROB
        opcode1, opcode2 : in std_logic_vector(3 downto 0); -- opcodes from dispatch
        pc_dec1, pc_dec2 : in std_logic_vector(15 downto 0); -- pc inputs from the decode and pipeline
        arf_add1, arf_add2 : in std_logic_vector(2 downto 0); -- arf destination addresses from dispatch
        rrf_add1, rrf_add2 : in std_logic_vector(5 downto 0); -- rrf destinations from dispatch
        dataval : in std_logic_vector(15 downto 0); -- 16 bit operand value to be stored
        storeval : in std_logic_vector(15 downto 0);
			
		dummyout : out std_logic_vector(1 downto 0)
--        
    );
end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: robtest 
			port map (
					-- order of inputs B A
rst => input_vector(91),
clk => input_vector(90),					
opcode1=> input_vector(89 downto 86),
pc_dec1=> input_vector(85 downto 70),
arf_add1=> input_vector(69 downto 67),
rrf_add1=> input_vector(66 downto 61),
opcode2=> input_vector(60 downto 57),
pc_dec2=> input_vector(56 downto 41),
arf_add2=> input_vector(40 downto 38),
rrf_add2=> input_vector(37 downto 32),
dataval=> input_vector(31 downto 16),
storeval=> input_vector(15 downto 0),
dummyout => output_vector(1 downto 0)
               );
               
end DutWrap;