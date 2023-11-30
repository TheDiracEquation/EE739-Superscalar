--THIS IS THE DATA MEMORY , IT TAKES A 15 BIT INPUT ADDRESS
--AND GIVES THE DATA ON THAT ADDRESS OR OVERWRITES THAT ADDRESS
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datamem is
    port(
        address : in std_logic_vector(15 downto 0);
        writedata : in std_logic_vector(15 downto 0);
        writing, reading, clk, rst : in std_logic;
        readval : out std_logic_vector(15 downto 0));
    
end entity;

architecture behav of datamem is

	type data_array is
		array(0 to 65536) of std_logic_vector(15 downto 0);

signal data : data_array := (others => "0000000000000000");

begin 
if(reading == 1) then
    readval <= data(to_integer(unsigned(address)));

writeproc: process(clk,rst,writing,data)
begin
	if (clk'event and clk='0') then 
        if(writing == 1) then
            data(to_integer(unsigned(address))) <= writedata;
        end if;
	end if;
end process;

end behav;

	