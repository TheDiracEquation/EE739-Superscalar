--THIS IS THE INSTRUCTION MEMORY , IT TAKES A 15 BIT INPUT ADDRESS
--AND GIVES THE CONCATENATED PAIRS OF THE 4 7 BIT VALUES STORED STARTING
--FROM THE ADDRESS OF THE 15 BIT INPUT
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instrucmem is
    port(
        mem_A : in std_logic_vector(15 downto 0);

        instruction1, instruction2 : out std_logic_vector(7 downto 0));
    
end entity instrucmem;

architecture behav of instrucmem is
	
	component concatenate is 
		port(
			LSB, MSB : in std_logic_vector(7 downto 0);
			output : out std_logic_vector(15 downto 0)
			);
	end component;

	type data_array is
		array(0 to 65536) of std_logic_vector(7 downto 0);

signal data : data_array := (0 => "00000100", others => "00000100");
signal memval1,memval2,memval3,memval4 : std_logic_vector(7 downto 0);
begin 
memval1 <= data(to_integer(unsigned(mem_A)));

memval2 <= data(to_integer(unsigned(mem_A or "0000000000000001")));

memval3 <= data(to_integer(unsigned(mem_A or "0000000000000010")));

memval4 <= data(to_integer(unsigned(mem_A or "0000000000000011")));

conc1 : concatenate port map(LSB => memval1, MSB => memval2, output => instruction1);
 
conc2 : concatenate port map(LSB => memval3, MSB => memval4, output => instruction2);

end behav;

	