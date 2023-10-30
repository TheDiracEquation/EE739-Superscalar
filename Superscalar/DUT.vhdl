library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(63 downto 0);
       	output_vector: out std_logic_vector(32 downto 0));
end entity;

architecture DutWrap of DUT is
component dadda is
port(
	A, B : in std_logic_vector(15 downto 0); -- 16 bit multiplication inputs
	C : in std_logic_vector(31 downto 0); -- 32 bit adding input 
	Sum : out std_logic_vector(31 downto 0); 
	Cdout : out std_logic
);
end component;
begin

   add_instance: dadda
			port map (
					
					C => input_vector(31 downto 0),
					
					A => input_vector(63 downto 48),
					
					B => input_vector(47 downto 32),
					
					Cdout => output_vector(32),

					Sum => output_vector(31 downto 0)				
					
					);

end DutWrap;

