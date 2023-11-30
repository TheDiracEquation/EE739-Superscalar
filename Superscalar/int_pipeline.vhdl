library ieee;
use ieee.std_logic_1164.all;

entity int_pipeline is 
    port(
        controlbits: in std_logic_vector(5 downto 0); --controlbits from control store component for alu operations
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
    
    component extender is
        port (
        );
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

proc1: process()
begin
    if(control=ada,adc,adz,awc,ndu,ndc,ndz) then
        alu_b <= rb_data;
    elsif(control=aca,acc,acz,acw,ncu,ncc,ncz) then
        alu_b <= not rb_data;
    elsif(control=adi) then
        alu_b <= imm_ext;
    end if;
end process;

proc2 : process()
begin
    if(control=addinstructions) then
        c_out <= alu_cout;
    else 
        c_out <= c_in;
    end if;
end process;

proc3 : process()
begin
    if(control=add+nand) then --have to add contol signals
        z_out <= alu_zout;
    else
        z_out <= z_in;
    end if;
end process;

alumap : alu port map(alu_a => ra_data, alu_b => alu_b, c_in => c_in, alu_out => alu_out, zero => alu_zout, carry => alu_cout, alu_sel => controlbits() );
extendermap : extender port map(in => imm_data, out => imm_ext);

pc_out <= pc_in;

end architecture;
