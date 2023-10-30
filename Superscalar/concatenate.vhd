-- THIS COMPONENT CONCATENATES THE 8 BIT DATA WE GET FROM THE 
-- INSTRUCTION MEMORY IN TO THE 16 BIT INSTRUCTIONS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity concatenate is 
port(
	LSB, MSB : in std_logic_vector(7 downto 0);
	output : out std_logic_vector(15 downto 0)
	);
end entity concatenate;

architecture behav of concatenate is
 begin 
	output(15 downto 8) <= MSB;
	output(7 downto 0) <= LSB;
	end architecture behav;
 
