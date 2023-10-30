library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addtwo is 
port(
	input : in std_logic_vector(15 downto 0);
	output : out std_logic_vector(15 downto 0)
	);
end entity addtwo;

architecture behav of addtwo is
 begin 
	output <= input or "0000000000000010";
 end architecture behav;
 
