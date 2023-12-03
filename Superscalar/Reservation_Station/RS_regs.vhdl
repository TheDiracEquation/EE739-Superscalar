library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--package for reservation station registers

--CHECKLIST:
--
--ISSUED - CHECKEDV1
--OPCODE - CHECKEDV1
--PC - 	 CHECKEDV1
--OPR1 - CHECKEDV1
--V1 - CHECKEDV1
--OPR2 - CHECKEDV1
--V2 - CHECKEDV1
--IMM9 - CHECKEDV1
--CZ -   CHECKEDV1
--VCZ - CHECKEDV1
--COND - CHECKED
--READY - CHECKED


package RS_regs is
--Takes two input addrs and two data. outputs all entries
    component ISSUED is
      port (clk,rst,w_enable1,w_enable2,w_enable3,w_enable4,w_enable5 : in std_logic;
               A1 : in std_logic_vector(5 downto 0);
               D1 : in std_logic;
               A2 : in std_logic_vector(5 downto 0);
               D2 : in std_logic;
               A3 : in std_logic_vector(5 downto 0);
               D3 : in std_logic;
               A4 : in std_logic_vector(5 downto 0);
               D4 : in std_logic;
               A5 : in std_logic_vector(5 downto 0);
               D5 : in std_logic;
               output : out std_logic_vector(63 downto 0));
  end component ISSUED;

--Takes two input addrs and two data for write. for read, 2 addr.
  component OPCODE is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(3 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(3 downto 0);
				D_out2 : out std_logic_vector(3 downto 0));
  end component OPCODE;

--Takes two input addrs and two data for write. for read, 2 addr.
  component PC is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(15 downto 0);
				D_out2 : out std_logic_vector(15 downto 0));
  end component PC;

  --Takes two input addrs and two data for write. Output all for read
  component OPR1 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            --VALID bits from V1
            V1 : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            VT_3 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(15 downto 0);
            OPR2 : in std_logic_vector(15 downto 0);
            OPR3 : in std_logic_vector(15 downto 0));
  end component OPR1;

    --Takes two input addrs and two data. outputs all entries
  component V1 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
  end component V1;

 --Takes two input addrs and two data for write. Output all for read
  component OPR2 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            --VALID bits from V1
            V1 : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            VT_3 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(15 downto 0);
            OPR2 : in std_logic_vector(15 downto 0);
            OPR3 : in std_logic_vector(15 downto 0));
  end component OPR2;

    --Takes two input addrs and two data. outputs all entries
  component V2 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
  end component V2;

  --Takes two input addrs and two data for write. for read, 2 addr.
  component IMM9 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(8 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(8 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(8 downto 0);
				D_out2 : out std_logic_vector(8 downto 0));
  end component IMM9;

  -- tag length wide. Takes two input addrs and two data for write. Output all for read 
  component CZ is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(1 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(1 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(1 downto 0);
            D_out2: out std_logic_vector(1 downto 0);

            --VALID bits from VCZ
            VCZ : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            CZ1 : in std_logic_vector(1 downto 0);
            CZ2 : in std_logic_vector(1 downto 0));
  end component CZ;

  --Takes two input addrs and two data. outputs all entries
  component VCZ is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
  end component VCZ;
 
   -- tag length wide. Takes two input addrs and two data for write. Output all for read 

  --Takes two input addrs and two data for write. for read, 2 addr.
  component COND is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(2 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(2 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(2 downto 0);
				D_out2 : out std_logic_vector(2 downto 0));
  end component COND;

  -- READY = ~issued * V1 * V2 * VC * VZ 
  component READY is
   port (clk,rst,w_enable : in std_logic;
         input : in std_logic_vector(63 downto 0);
         output : out std_logic_vector(63 downto 0));
  end component READY;

end package RS_regs;


--------------ONE-BIT-REG----------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity BIT1_REG is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity BIT1_REG;

architecture behav of BIT1_REG is
    signal data : std_logic_vector(63 downto 0) := (others => '1');
	begin 
	
		process(clk,rst)
		begin 
			if(rst = '1') then 
				data <= (others => '0');
			elsif rising_edge(clk) then
				if(w_enable1 = '1') then 
					data(to_integer(unsigned(A1))) <= D1;			
				end if;
				
				if(w_enable2 = '1') then 
					data(to_integer(unsigned(A2))) <= D2;			
				end if;
				
			end if;
		end process;
		
		output <= data;
end behav;

-----------------ISSUED--------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ISSUED is
    port (clk,rst,w_enable1,w_enable2,w_enable3,w_enable4,w_enable5 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
				A3 : in std_logic_vector(5 downto 0);
            D3 : in std_logic;
            A4 : in std_logic_vector(5 downto 0);
            D4 : in std_logic;
            A5 : in std_logic_vector(5 downto 0);
            D5 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity ISSUED;

architecture behav of ISSUED is
    signal data : std_logic_vector(63 downto 0) := (others => '1');
	begin 
	
		process(clk,rst)
		begin 
			if(rst = '1') then 
				data <= (others => '1');
			elsif rising_edge(clk) then 
				if(w_enable1 = '1') then 
					data(to_integer(unsigned(A1))) <= D1;			
				end if;
				
				if(w_enable2 = '1') then 
					data(to_integer(unsigned(A2))) <= D2;			
				end if;
				
				if(w_enable3 = '1') then 
					data(to_integer(unsigned(A3))) <= D3;			
				end if;

            if(w_enable4 = '1') then 
					data(to_integer(unsigned(A4))) <= D4;			
				end if;

            if(w_enable5 = '1') then 
					data(to_integer(unsigned(A5))) <= D5;			
				end if;
			end if;
		end process;
		
		
		output <= data;
end behav;
  

-------------------OPCODE----------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPCODE is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(3 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(3 downto 0);
				D_out2 : out std_logic_vector(3 downto 0));
end entity OPCODE;

architecture behav of OPCODE is
	type memory_array_4 is array (0 to 63) of std_logic_vector(3 downto 0);
	signal mem : memory_array_4 := (others => (others => '0'));
	begin 
	
		process(clk,rst)
		begin 
		
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif rising_edge(clk) then
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
				
			end if;
		end process;

		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;
  
--------------------PC---------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity PC is
    port (clk,rst,w_enable1,W_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(15 downto 0);
				D_out2 : out std_logic_vector(15 downto 0));
end entity PC;

architecture behav of PC is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
	
		process(clk,rst)
		begin 		
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif rising_edge(clk) then
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
				
			end if;			
		end process;
		
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;
  
-----------------------OPR1-----------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPR1 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            --VALID bits from V1
            V1 : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            VT_3 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(15 downto 0);
            OPR2 : in std_logic_vector(15 downto 0);
            OPR3 : in std_logic_vector(15 downto 0));
            
            
end entity OPR1;

architecture behav of OPR1 is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
	
		--TAG CHECKING
      process(clk,rst)
			begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif (rising_edge(clk)) then
			
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
				
            for i in 0 to 63 loop
                if (V1(i) = '0') then
                    if (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG1)) and VT_1 = '1') then             
                        mem(i) <= OPR1; --TODO set valid bit to 1
                    elsif (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG2)) and VT_2 = '1') then
                        mem(i) <= OPR2;
                    elsif (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG3)) and VT_3 = '1') then   
                        mem(i) <= OPR3;
                    end if;
                end if;
            end loop;

			end if;	
		end process;
			
	
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;

------------------------V1-----------------------
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity V1 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity V1;

architecture behav of V1 is
    component BIT1_REG is 
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		V1_1: BIT1_REG port map (clk, rst, w_enable1,w_enable2, A1, D1, A2, D2, output);
end behav;

-----------------------OPR2-----------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OPR2 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(15 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(15 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(15 downto 0);
            D_out2: out std_logic_vector(15 downto 0);

            --VALID bits from V1
            V1 : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            VT_3 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            TAG3 : in std_logic_vector(5 downto 0);
            OPR1 : in std_logic_vector(15 downto 0);
            OPR2 : in std_logic_vector(15 downto 0);
            OPR3 : in std_logic_vector(15 downto 0));
            
            
end entity OPR2;

architecture behav of OPR2 is
	type memory_array_16 is array (0 to 63) of std_logic_vector(15 downto 0);
	signal mem : memory_array_16 := (others => (others => '0'));
	begin 
	
		--TAG CHECKING
      process(clk,rst)
			begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif (rising_edge(clk)) then
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
				
            for i in 0 to 63 loop
                if (V1(i) = '0') then
                    if (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG1)) and VT_1 = '1') then             
                        mem(i) <= OPR1; --TODO set valid bit to 1
                    elsif (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG2)) and VT_2 = '1') then
                        mem(i) <= OPR2;
                    elsif (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG3)) and VT_3 = '1') then   
                        mem(i) <= OPR3;
                    end if;
                end if;
            end loop;

			end if;	
		end process;
		
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;

------------------------V2-----------------------
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity V2 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity V2;

architecture behav of V2 is
    component BIT1_REG is 
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		V2_1: BIT1_REG port map (clk, rst, w_enable1,w_enable2, A1, D1, A2, D2, output);
end behav;

-----------------------IMM9-----------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity IMM9 is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(8 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(8 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(8 downto 0);
				D_out2 : out std_logic_vector(8 downto 0));
end entity IMM9;
architecture behav of IMM9 is
	type memory_array_9 is array (0 to 63) of std_logic_vector(8 downto 0);
	signal mem : memory_array_9 := (others => (others => '0'));
	begin 
		process(clk,rst)
		begin 
		
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif rising_edge(clk) then
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
			end if;
		end process;
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;

----------------------CZ--------------------------
 
 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity CZ is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            --WRITE addresses and data
            A1 : in std_logic_vector(5 downto 0); 
            D1 : in std_logic_vector(1 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(1 downto 0);

            --READ addresses and data
            A_in1: in std_logic_vector(5 downto 0);
            A_in2: in std_logic_vector(5 downto 0);
            D_out1: out std_logic_vector(1 downto 0);
            D_out2: out std_logic_vector(1 downto 0);

            --VALID bits from VCZ
            VCZ : in std_logic_vector(63 downto 0);

            --TAGBUS
            VT_1 : in std_logic;
            VT_2 : in std_logic;
            TAG1 : in std_logic_vector(5 downto 0);
            TAG2 : in std_logic_vector(5 downto 0);
            CZ1 : in std_logic_vector(1 downto 0);
            CZ2 : in std_logic_vector(1 downto 0));
            
            
end entity CZ;

architecture behav of CZ is
	type memory_array_2 is array (0 to 63) of std_logic_vector(1 downto 0);
	signal mem : memory_array_2 := (others => (others => '0'));
	begin 
		--TAG MATCHING
      process(clk,rst)
			begin 
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));

			elsif (rising_edge(clk)) then		
					if(w_enable1 = '1') then 
						mem(to_integer(unsigned(A1))) <= D1;
					end if;
					
					if(w_enable2 = '1') then 
						mem(to_integer(unsigned(A2))) <= D2;
					end if;
					
					--TAG CHECKING
					for i in 0 to 63 loop
						 if (VCZ(i) = '0') then
							  if (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG1)) and VT_1 = '1') then             
									mem(i) <= CZ1; --TODO set valid bit to 1
							  elsif (to_integer(unsigned(mem(i))) = to_integer(unsigned(TAG2)) and VT_2 = '1') then
									mem(i) <= CZ2;
							  end if;
						 end if;
					end loop;
			end if;
		end process;
		
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;


--------------------------VCZ-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity VCZ is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
end entity VCZ;

architecture behav of VCZ is
    component BIT1_REG is 
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic;
				A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic;
            output : out std_logic_vector(63 downto 0));
    end component;
	begin 
		VCZ_1: BIT1_REG port map (clk, rst, w_enable1,w_enable2, A1, D1, A2, D2, output);
end behav;

--------------------------COND-------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity COND is
    port (clk,rst,w_enable1,w_enable2 : in std_logic;
            A1 : in std_logic_vector(5 downto 0);
            D1 : in std_logic_vector(2 downto 0);
            A2 : in std_logic_vector(5 downto 0);
            D2 : in std_logic_vector(2 downto 0);         
            A_in1 : in std_logic_vector(5 downto 0);
				A_in2 : in std_logic_vector(5 downto 0);
            D_out1 : out std_logic_vector(2 downto 0);
				D_out2 : out std_logic_vector(2 downto 0));
end entity COND;

architecture behav of COND is
	type memory_array_3 is array (0 to 63) of std_logic_vector(2 downto 0);
	signal mem : memory_array_3 := (others => (others => '0'));
	begin 
		process(clk,rst)
		begin 
		
			if(rst = '1') then 
				mem(0 to 63) <= (others => (others => '0'));
			elsif rising_edge(clk) then
				if(w_enable1 = '1') then 
					mem(to_integer(unsigned(A1))) <= D1;
				end if;
				
				if(w_enable2 = '1') then 
					mem(to_integer(unsigned(A2))) <= D2;
				end if;
				
			end if;
			
		end process;
		
		D_out1 <= mem(to_integer(unsigned(A_in1)));
		D_out2 <= mem(to_integer(unsigned(A_in2)));
end behav;

---------------------READY--------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity READY is
    port (clk,rst,w_enable : in std_logic;
            input : in std_logic_vector(63 downto 0);
            output : out std_logic_vector(63 downto 0));
end entity READY;

architecture behav of READY is
   signal data : std_logic_vector(63 downto 0) := (others => '0');
	begin 
	
		process(clk,rst)
		begin 
			if(rst = '1') then 
				data <= (others => '0');
			elsif rising_edge(clk) then
				if(w_enable = '1') then 
					data <= input;		
				end if;
			end if;
		end process;
		
		output <= data;
end behav;
