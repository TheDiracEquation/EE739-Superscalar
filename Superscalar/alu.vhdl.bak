library ieee;
use ieee.std_logic_1164.all;

entity alu is
  port(
    alu_a, alu_b : in std_logic_vector(15 downto 0);
    c_in : in std_logic;
    alu_sel : in std_logic_vector(1 downto 0); --01 add without carry, 10 add with carry, 11 nand
    alu_out : out std_logic_vector(15 downto 0);
    c_out, z_out : out std_logic);
  end entity;

  architecture bhv of alu is
    signal sumop: std_logic_vector(15 downto 0) := "0000000000000000";
signal nandop: std_logic_vector(15 downto 0) := "0000000000000000";

begin

	ALU1: process(alu_a, alu_b, c_in, alu_sel, sumop, nandop)
	variable Cinit: std_logic := '0';
	begin
	if(alu_sel='01') then
    Cinit := '0';
  elsif(alu_sel='10') then
    Cinit := c_in;
  end if;
  if(alu_sel='01' or alu_sel='10') then
		add: for i in 0 to 15 loop
			sumop(i) <= alu_a(i) xor alu_b(i) xor Cinit;
			Cinit := (alu_a(i) and alu_b(i)) or (Cinit and (alu_a(i) xor alu_b(i)));
		end loop;
		if(sumop="0000000000000000" and C_init='0') then 
			z_out <= '1';
		else z_out <= '0';
		end if;
    alu_out <= sumop;
	elsif(alu_sel='11') then
		nandop <= alu_A nand alu_B;
		if(nandop="0000000000000000") then 
			z_out <= '1';
		else z_out <= '0';
		end if;
    alu_out <= nandop;
	end if; --if alu_sel = 00 then nothing shd happen, and alu_sel = 00 will be from control store for alu ops if carry_in or zero_in is not set for ADZ, ADC, etc 
  c_out <= C_init;
	end process;
    
