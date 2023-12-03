LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity clock_divider_tb is
end entity clock_divider_tb;

architecture bhv of clock_divider_tb is
component pipedatapath is
port (
		clk, rst : in std_logic;
		output : out std_logic_vector(15 downto 0));
end component;

signal reset : std_logic := '1';
signal clock : std_logic := '1';
signal output_dumb : std_logic_vector(15 downto 0) := "0000000000000101";
constant clk_period : time := 20000 ps;
begin
	
	dut_instance: pipedatapath port map(clock, reset, output_dumb);
	clock <= not clock after clk_period/2 ;
	reset <= '1' , '0' after 12000 ps;
	
end bhv;
	

