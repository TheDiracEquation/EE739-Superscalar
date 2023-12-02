library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--package for reservation station registers


package RS_gates is
--Takes two input addrs and two data. outputs all entries
    component ISSUED is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component ISSUED;

--Takes two input addrs and two data for write. for read, 2 addr.
  component OPCODE is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(2 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(2 downto 0);         
            A1_in : in std_logic_vector(5 downto 0);
            D1_out : out std_logic_vector(2 downto 0);
            A2_in : in std_logic_vector(5 downto 0);
            D2_out : out std_logic_vector(2 downto 0));
  end component OPCODE;

--Takes two input addrs and two data for write. for read, 2 addr.
  component PC is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A1_in : in std_logic_vector(5 downto 0);
            D1_out : out std_logic_vector(2 downto 0);
            A2_in : in std_logic_vector(5 downto 0);
            D2_out : out std_logic_vector(2 downto 0));
  end component PC;

  --Takes two input addrs and two data for write. Output all for read
  component OPR1 is
    type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            output : out memory_array_16);
  end component OPR1;

    --Takes two input addrs and two data. outputs all entries
  component V1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component V1;

 --Takes two input addrs and two data for write. Output all for read
  component OPR2 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A1_in : in std_logic_vector(5 downto 0);
            D1_out : out std_logic_vector(2 downto 0);
            A2_in : in std_logic_vector(5 downto 0);
            D2_out : out std_logic_vector(2 downto 0));
  end component OPR2;

    --Takes two input addrs and two data. outputs all entries
  component V2 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component V2;

  --Takes two input addrs and two data for write. for read, 2 addr.
  component IMM9 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A1_in : in std_logic_vector(5 downto 0);
            D1_out : out std_logic_vector(2 downto 0);
            A2_in : in std_logic_vector(5 downto 0);
            D2_out : out std_logic_vector(2 downto 0));
  end component IMM9;

  -- tag length wide. Takes two input addrs and two data for write. Output all for read 
  component C is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component C;

  --Takes two input addrs and two data. outputs all entries
  component VC is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component VC;
 
   -- tag length wide. Takes two input addrs and two data for write. Output all for read 
  component Z is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component Z;

  --Takes two input addrs and two data. outputs all entries
  component VZ is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(0 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(5 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component VZ;

  --Takes two input addrs and two data for write. for read, 2 addr.
  component COND is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A1_in : in std_logic_vector(5 downto 0);
            D1_out : out std_logic_vector(2 downto 0);
            A2_in : in std_logic_vector(5 downto 0);
            D2_out : out std_logic_vector(2 downto 0));
  end component COND;

  -- READY = ~issued * V1 * V2 * VC * VZ 
  component READY is
    port (clk,rst,w_enable : in std_logic;
            issued : in std_logic_vector(63 downto 0);
            V1 : in std_logic_vector(63 downto 0);
            V2 : in std_logic_vector(63 downto 0);
            VC : in std_logic_vector(63 downto 0);
            VZ : in std_logic_vector(63 downto 0);
            output : out std_logic_vector(63 downto 0));
  end component READY;

end package RS_gates;


--------------ONE-BIT-REG----------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity BIT1_REG is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity BIT1_REG;

architecture behav of BIT1_REG is
    signal data : std_logic_vector(15 downto 0) := (others => '0');
	begin 
		process(clk,rst)
		begin 
			if(rst = '1') then 
				data <= (others => '0');
			else 
				if(w_enable = '1') then 
					data(to_integer(unsigned(A1))) <= D1;					
				end if;
			end if;
		end process;
		output <= data(0 to 63);
end behav;

-----------------ISSUED--------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ISSUED is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity ISSUED;

architecture behav of ISSUED is
    component BIT1_REG is 
        port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		issued1: BIT1_REG port map (clk, rst, w_enable, A1, D1, output);
end behav;
  

-------------------OPCODE----------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPCODE is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(2 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(2 downto 0);         
            A_in : in std_logic_vector(5 downto 0);
            D_out : out std_logic_vector(2 downto 0));
end entity OPCODE;

architecture behav of OPCODE is
	type memory_array_3 is array (0 to 63) of std_logic_vector(2 downto 0);
	signal mem : memory_array_3 := (others => (others => '0'));
	begin 
		process(clk,rst,A1,A2,D1,D2,A_in)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			else
				if(w_enable = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
                    mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		D_out <= mem(to_integer(unsigned(A_in)));
end behav;
  
--------------------PC---------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity PC is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A_in : in std_logic_vector(5 downto 0);
            D_out : out std_logic_vector(15 downto 0));
end entity PC;

architecture behav of PC is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
        process(clk,rst,A1,A2,D1,D2,A_in)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			else
				if(w_enable = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
                    mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		D_out <= mem(to_integer(unsigned(A_in)));
end behav;
  
-----------------------OPR1-----------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPR1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);
            TAGBUS : in std_logic_vector(54 downto 0);
            output : out memory_array_16);
            
end entity OPR1;

architecture behav of OPR1 is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
        process(clk,rst,A1,A2,D1,D2)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			else
				if(w_enable = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
                    mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		output <= mem;
end behav;

------------------------V1-----------------------
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity V1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity V1;

architecture behav of V1 is
    component BIT1_REG is 
        port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		V1_1: BIT1_REG port map (clk, rst, w_enable, A1, D1, output);
end behav;

-----------------------OPR2-----------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPR1 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            output : out memory_array_16);
end entity OPR1;

architecture behav of OPR1 is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
        process(clk,rst,A1,A2,D1,D2)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			else
				if(w_enable = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
                    mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		output <= mem;
end behav;

------------------------V2-----------------------
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity V2 is
    port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity V2;

architecture behav of V2 is
    component BIT1_REG is 
        port (clk,rst,w_enable : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		V2_1: BIT1_REG port map (clk, rst, w_enable, A1, D1, output);
end behav;

-----------------------IMM9-----------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity IMM9 is
    port (clk,rst,w_enable : in std_logic;
    A1 : in std_logic_vector(5 downto 0);
    D1 : in std_logic_vector(8 downto 0);
    A2 : in std_logic_vector(5 downto 0);
    D2 : in std_logic_vector(8 downto 0);         
    A_in : in std_logic_vector(5 downto 0);
    D_out : out std_logic_vector(8 downto 0));
end entity IMM9;

architecture behav of IMM9 is
	type memory_array_9 is array (0 to 63) of std_logic_vector(8 downto 0);
	signal mem : memory_array_9 := (others => (others => '0'));
	begin 
        process(clk,rst,A1,A2,D1,D2,A_in)
		begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			else 
				if(w_enable = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
                    mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		D_out <= mem(to_integer(unsigned(A_in)));
end behav;


  
