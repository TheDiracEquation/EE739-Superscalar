-- THIS IS THE CODE FOR THE ARF AND RRF
library ieee;
use ieee.std_logic_1164.all;

entity PRF is
	port(
	opra1, oprb1, opra2,oprb2, writeadd: in std_logic_vector(2 downto 0); -- Input operands from the decode
    datain : in std_logic_vector(15 downto 0);
	clk , rst  : in std_logic;
	rsvalid1,rsvalid2,rsvalid3,rsvalid4 : out std_logic;
	instr1val1, instr1val2 : out std_logic_vector(15 downto 0);
	instr2val1, instr2val2 : out std_logic_vector(15 downto 0);
	writing, reading : in std_logic 
	);
end entity;

architecture behav of PRF is 

	type arf_data_type is array((integer'(2)**3)-1 downto 0) of std_logic_vector(15 downto 0); -- Creates a data type for the ARF
    type arf_busy_type is array((integer'(2)**3)-1 downto 0) of std_logic; -- Creates a data type for the ARF busy bits
    type arf_tag_type is array((integer'(2)**3)-1 downto 0) of std_logic_vector(7 downto 0);-- Creates a data type for the ARF tags

    type rrf_data_type is array((integer'(2)**6)-1 downto 0) of std_logic_vector(15 downto 0); -- Creates a data type for the RRF
    type rrf_valid_type is array((integer'(2)**6)-1 downto 0) of std_logic; -- Creates a data type for the RRF valid bit
    type rrf_busy_type is array((integer'(2)**6)-1 downto 0) of std_logic; -- Creates a data type for the RRF busy bit

    type cz_renamer is array((integer'(2)**6)-1 downto 0) of std_logic_vector(1 downto 0); -- Creates a data type for the CZ bits
    type cz_busy is array ((integer'(2)**6)-1 downto 0) of std_logic_vector(1 downto 0);

    signal carry : cz_renamer; -- 64 bit renamed single bit carry
    signal zero : cz_renamer; -- 64 bit renamed single bit carry

    signal rrf_data: rrf_data_type; -- 16 bit RRF with 64 registers 
    signal rrf_valid: rrf_valid_type; -- single bit 64 wide RRF valid 
    signal rrf_busy: rrf_busy_type; -- single bit 64 wide RRF busy 

    signal arf_data: arf_data_type; -- 16 bit RRF with 8 registers
    signal arf_busy: arf_busy_type; -- single bit 8 wide ARF busy 
    signal arf_tag: arf_tag_type; -- 6 bit tag values for 8 registers , pointing to 64 wide RRF

    signal instr1val1, data_out_sig_2, data_out_sig_3, data_out_sig_4: std_logic_vector(15 downto 0);
    signal data_tag_out_2, data_tag_out_3, data_tag_out_4: std_logic;

begin
    writeproc : process(clk,rst,opra1,oprb1,opra2,oprb2)
    begin 
    if(writing = '1')
    -- postrenaming - current tag doesnt match the tag from rob
    -- aliasing - if alias bit is 1 take only the second instruction as output
    



-- Reading the first operand
        readproc1 : process(rst,opra1)
            begin 
            if (rst = '1') then
                instr1val1 <= (others => '0');
                rsvalid1 <= '1';

            else -- If not resetting and arf register is not in use(not being renamed) then take data from arf
                if (arf_busy(to_integer(unsigned(opra1))) = '0') then
                    instr1val1 <= arf_data(to_integer(unsigned(opra1)));
                    rsvalid1 <= '1';

                else -- If arf register busy take data from its renamed register
                    if (rrf_valid(to_integer(unsigned(arf_tag(to_integer(unsigned(opra1))))))) = '1' then
                        instr1val1 <= rrf_data(to_integer(unsigned(arf_tag(to_integer(unsigned(opra1))))));
                        rsvalid1 <= '1';

                    else
                        -- Sending the RRF tag to the RS if data is not available
                        instr1val1 <= std_logic_vector(resize(unsigned(arf_tag(to_integer(unsigned(opra1)))), 16));
                        rsvalid1 <= '0';

                    end if;
                end if;
            end if;
        end process readproc1;

-- Reading the second operand
        readproc2 : process(rst,oprb1)
        begin 
        if (rst = '1') then
            instr1val2 <= (others => '0');
            rsvalid2 <= '1';

        else -- If not resetting and arf register is not in use(not being renamed) then take data from arf
            if (arf_busy(to_integer(unsigned(oprb1))) = '0') then
                instr1val2 <= arf_data(to_integer(unsigned(oprb1)));
                rsvalid2 <= '1';

            else -- If arf register busy take data from its renamed register
                if (rrf_valid(to_integer(unsigned(arf_tag(to_integer(unsigned(oprb1))))))) = '1' then
                    instr1val2 <= rrf_data(to_integer(unsigned(arf_tag(to_integer(unsigned(oprb1))))));
                    rsvalid2 <= '1';

                else
                    -- Sending the RRF tag to the RS if data is not available
                    instr1val2 <= std_logic_vector(resize(unsigned(arf_tag(to_integer(unsigned(oprb1)))), 16));
                    rsvalid2 <= '0';

                end if;
            end if;
        end if;
        end process readproc2;

--Reading the third operand
        readproc3 : process(rst,opra2)
        begin 
        if (rst = '1') then
            instr2val1 <= (others => '0');
            rsvalid3 <= '1';

        else -- If not resetting and arf register is not in use(not being renamed) then take data from arf
            if (arf_busy(to_integer(unsigned(opra2))) = '1') then
                instr2val1 <= arf_data(to_integer(unsigned(opra2)));
                rsvalid3 <= '1';

            else -- If arf register busy take data from its renamed register
                if (rrf_valid(to_integer(unsigned(arf_tag(to_integer(unsigned(opra2))))))) = '1' then
                    instr2val1 <= rrf_data(to_integer(unsigned(arf_tag(to_integer(unsigned(opra2))))));
                    rsvalid3 <= '1';

                else
                    --Sending the RRF tag to the RS if data is not available
                    instr2val1 <= std_logic_vector(resize(unsigned(arf_tag(to_integer(unsigned(opra2)))), 16));
                    rsvalid3 <= '0';

                end if;
            end if;
        end if;
        end process readproc3;
        
-- Reading the fourth operand
        readproc4 : process(rst,oprb2)
        begin 
        if (rst = '1') then
            instr2val2 <= (others => '0');
            rsvalid4 <= '1';

        else -- If not resetting and arf register is not in use(not being renamed) then take data from arf
            if (arf_busy(to_integer(unsigned(oprb2))) = '1') then
                instr2val2 <= arf_data(to_integer(unsigned(oprb2)));
                rsvalid4 <= '1';

            else -- If arf register busy take data from its renamed register
                if (rrf_valid(to_integer(unsigned(arf_tag(to_integer(unsigned(oprb2))))))) = '1' then
                    instr2val2 <= rrf_data(to_integer(unsigned(arf_tag(to_integer(unsigned(oprb2))))));
                    rsvalid4 <= '1';

                else
                    -- Sending the RRF tag to the RS if data is not available
                    instr2val2 <= std_logic_vector(resize(unsigned(arf_tag(to_integer(unsigned(oprb2)))), 16));
                    rsvalid4 <= '0';

                end if;
            end if;
        end if;
        end process readproc4;

    RRF_to_RS_val : process(rst,rrf_valid)
