library ieee;
use ieee.std_logic_1164.all;

entity int_pipeline is 
    port(
        control: in std_logic_vector(5 downto 0); --controlbits from control store component for alu operations
        ra_data, rb_data, pc_in: in std_logic_vector(15 downto 0);
        imm_data: in std_logic_vector(5 downto 0);
        c_in, z_in: in std_logic;
        c_out, z_out: out std_logic;
        pc_out, alu_out: out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavioural of int_pipeline is
    signal imm_ext, alu_b: std_logic_vector(15 downto 0) := (others => '0');
    signal alu_cout, z_sig, alu_zout: std_logic;
    
    component extendimm6 is
        port(input: in std_logic_vector(8 downto 0);
		  output: out std_logic_vector(15 downto 0));
    end component;

    component alu is
      port(
    alu_a, alu_b : in std_logic_vector(15 downto 0);
    c_in : in std_logic;
    alu_sel : in std_logic_vector(1 downto 0); --01 add without carry, 10 add with carry, 11 nand
    alu_out : out std_logic_vector(15 downto 0);
    c_out, z_out : out std_logic);
    end component;

begin

proc1: process(control, imm_ext, rb_data)
begin
    if(control(5 downto 4)="00") then
        alu_b <= rb_data;
    elsif(control(5 downto 4)="01") then
        alu_b <= not rb_data;
    elsif(control(5 downto 4)="10") then
        alu_b <= imm_ext;
    end if;
end process;

proc2 : process(control,alu_cout,c_in)
begin
    if(control(1)='1') then
        c_out <= alu_cout;
    else 
        c_out <= c_in;
    end if;
end process;

proc3 : process(control,alu_zout,z_in)
begin
    if(control(0)='1') then --have to add contol signals
        z_out <= alu_zout;
    else
        z_out <= z_in;
    end if;
end process;

alumap : alu port map(alu_a => ra_data, alu_b => alu_b, c_in => c_in, alu_out => alu_out, z_out => alu_zout, c_out => alu_cout, alu_sel => control(3 downto 2) );
extendermap : extendimm6 port map(input => imm_data, output => imm_ext);

pc_out <= pc_in;

end architecture;
