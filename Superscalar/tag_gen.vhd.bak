-- THIS IS THE CODE FOR THE PRIORITY ENCODER THAT 
-- PROVIDES TAGS TO THE ARF REGISTERS
library ieee;
use ieee.std_logic_1164.all;

entity tag_gen is 
    port(
        rrf_busy_ip : in std_logic_vector(63 downto 0); -- To check the current RRF busy
        rrf_valid_ip : in std_logic_vector(63 downto 0); -- To check the current RRF valid
        
        rrf_busy_op : out std_logic_vector(63 downto 0); -- We take out the changed busy and just write it back into the RRF
        tag_1, tag_2 : out std_logic_vector(5 downto 0) -- I take in the input and get two different tags.
    );

    architecture tag_giver of tag_gen is 
    temp_rrf_busy : in std_logic_vector(63 downto 0)

    begin
        temp_rrf_busy <= rrf_busy_ip;
        for i in 0 to 63 loop
            if(rrf_busy_ip(i) = '0' and rrf_valid_ip(i) = '0') then     -- essentially I check which RRF register is free using 
                tag_1 <= std_logic_vector(to_unsigned(i,tag_1'length)); -- a for loop through the current rrf busy and make it 1 while 
                temp_rrf_busy(i) <= '1';                                -- also giving tag_1 the 6 bit value of the location of the register
                rrf_busy_op(i) <= '1';                                  -- which was made 1. I do the same in the rrf busy output.                        
                exit; -- If you find a empty register stop searching more.
            end if;
        end loop;

        for j in 0 to 63 loop
            if(temp_rrf_busy(j) = '0' and rrf_valid_ip(j) = '0') then  -- Here now that ive already used one register for a tag , I use 
                tag_2 <= std_logic_vector(to_unsigned(j,tag_1'length));-- the updated rrf (stored in temp_rrf_busy) and do the same process 
                rrf_busy_op(j) <= '1';                                 -- as above.                 
                exit;-- If you find another empty register stop searching more.
            end if;
        end loop;
    
    end architecture;
