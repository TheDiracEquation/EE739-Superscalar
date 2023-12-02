-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(188 downto 0);
       	output_vector: out std_logic_vector(31 downto 0));
end entity;

architecture DutWrap of DUT is
   component OPR1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            V1 : in std_logic_vector(63 downto 0);

            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(15 downto 0);
            OPR2 : in std_logic_vector(15 downto 0);
            OPR3 : in std_logic_vector(15 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: OPR1 
			port map (
					-- order of inputs B A
					clk => input_vector(188),
					rst => input_vector(187),
					w_enable => input_vector(186),
					
					A1 => input_vector(185 downto 180),
					D1 => input_vector(179 downto 164),
					A2 => input_vector(163 downto 158),
					D2 => input_vector(157 downto 142),

					A_in1 => input_vector(141 downto 136),
					A_in2 =>input_vector(135 downto 130),

					V1 =>input_vector(129 downto 66),

					TAG1 =>input_vector(65 downto 60),
					TAG2 =>input_vector(59 downto 54),
					TAG3 =>input_vector(53 downto 48),
					OPR1=>input_vector(47 downto 32),
					OPR2=>input_vector(31 downto 16),
					OPR3 =>input_vector(15 downto 0),
					
					D_out1 =>output_vector(31 downto 16),
					D_out2 =>output_vector(15 downto 0)
					
               );
               
end DutWrap;