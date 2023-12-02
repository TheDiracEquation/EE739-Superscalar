library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPR1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            V1 : in std_logic_vector(63 downto 0);

            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(5 downto 0);
            OPR2 : in std_logic_vector(5 downto 0);
            OPR3 : in std_logic_vector(5 downto 0);
            
            
end entity OPR1;

architecture behav of OPR1 is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
        process(clk,rst)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));

			elif rising_edge(clk) then
				if(w_enable = '1') then 
                    --WRITE
					mem(to_integer(unsigned(A1))) <= D1; --TODO set valid bit to 1 and check for issued
                    mem(to_integer(unsigned(A2))) <= D2;

                    --TAG CHECKING
                    for i in 0 to 63 loop
                        if V1(i) = 0 then
                            if mem(i)(5 downto 0) = TAG1 then
                                mem(i)(15 downto 0) <= OPR1; --TODO set valid bit to 1
                            elif mem(i)(5 downto 0) = TAG2 then
                                mem(i)(15 downto 0) <= OPR2;
                            elif mem(i)(5 downto 0) = TAG3 then
                                mem(i)(15 downto 0) <= OPR3;
                            end if;
                        end if;
                    end loop;

				end if;
			end if;
		end process;
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;