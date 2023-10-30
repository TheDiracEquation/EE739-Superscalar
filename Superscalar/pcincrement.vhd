-- THIS COMPONENT INCREMMENTS THE PC BY 4

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pcincrement is 
port(
	PCin : in std_logic_vector(15 downto 0);
	PCout : out std_logic_vector(15 downto 0)
	);
end entity pcincrement;

architecture behav of pcincrement is
 begin 
	PCout <= PCin or "0000000000000100";
 end architecture behav;
 
