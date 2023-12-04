-- Alias detector : Takes input of opcode , data and arf_dest of the 2 outputs and according sends them
-- after checking for alisaing and correcting
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aliasdet is
port(
    output1, output2 : in std_logic_vector(15 downto 0);
    dest1, dest2 : in std_logic_vector(2 downto 0);
    opcode1, opcode2 : in std_logic_vector(3 downto 0);
    storeval1, storeval2 :  in std_logic_vector(15 downto 0);

    arf_data1,arf_data2 : out std_logic_vector(15 downto 0);
    arf_dest1,arf_dest2 : out std_logic_vector(2 downto 0);
    mem_data1, mem_data2 : out std_logic_vector(15 downto 0);
    mem_add1, mem_add2 : out std_logic_vector(15 downto 0)
);
end entity;

architecture aliasfind of aliasdet is
    begin
        arf_dest1 <= dest1;
        arf_dest2 <= dest2;
        arf_data1 <= output1;
        arf_data2 <= output1;
        memdata1 <= storeval1;
        memdata2 <= storeval2;
        memadd1 <= output1;
        memadd2 <= output2;
        
        aliascheck: process(output1, output2, dest1, dest2, opcode1, opcode2)
        begin
            if((opcode1 ="0001" or opcode1 ="0100" or opcode1 ="0010") and ((opcode2 ="0001" or opcode2 ="0100" or opcode2 ="0010"))) then
                if(dest1 = dest2) then
                    arf_data1 <= output2;
                end if;
            elsif((opcode1 ="0001" or opcode1 ="0100" or opcode1 ="0010") and opcode2 = "0101" ) then
                if(dest1 = dest2) then
                    memdata2 <= output1;
                end if;
            elsif(opcode1 = "0101" and opcode2 = "0100") then
                if(memadd1 = memadd2) then
                    arf_data2 <= storeval1;
                end if;
            elsif(opcode1 = "0101" and opcode1 = "0101") then
                if(memadd1 = memadd2) then
                    memdata1 <= storeval2;
                end if;
            end if;
        end process;
    end aliasfind;
                

