library ieee;
use ieee.std_logic_1164.all;

entity robtest is 
generic(
    size : integer := 256 -- size of the ROB
);
    port(
			clk,rst : in std_logic;
        -- Inputs from dispatch into the ROB
        opcode1, opcode2 : in std_logic_vector(3 downto 0); -- opcodes from dispatch
        pc_dec1, pc_dec2 : in std_logic_vector(15 downto 0); -- pc inputs from the decode and pipeline
        arf_add1, arf_add2 : in std_logic_vector(2 downto 0); -- arf destination addresses from dispatch
        rrf_add1, rrf_add2 : in std_logic_vector(5 downto 0); -- rrf destinations from dispatch
        dataval : in std_logic_vector(15 downto 0); -- 16 bit operand value to be stored
        storeval : in std_logic_vector(15 downto 0);
		dummyout : out std_logic_vector(1 downto 0)

--        -- Inputs from pipeline into the ROB
--        pipeout1, pipeout2, pipeout3 : in std_logic_vector(15 downto 0); -- pipeline outputs
--        pipe1CZ, pipe2CZ, pipe3CZ : in std_logic_vector(1 downto 0); -- pipeline C and Z outputs
--        pcpipe1, pcpipe2, pcpipe3 : in std_logic_vector(15 downto 0);
----
--        -- Retirement of instructions from ROB
--        outval1, outval2 : out std_logic_vector(15 downto 0); -- output values for retirement
--        dest_arf : out std_logic_vector(2 downto 0); -- output arf destination for retirement and alias correction
--        dest_memory :out std_logic_vector(15 downto 0); -- 
--        cout,zout,aliasing : out std_logic-- output values for c and z and aliasing bit for retirement
    );
end entity;

architecture behav of robtest is

type bit4_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(3 downto 0); -- Creates a data type for the ROB
type bit16_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(15 downto 0);
type bit3_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(2 downto 0);
type bit6_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(5 downto 0);
type bit1_data_type is array((integer'(2)**8)-1 downto 0) of std_logic;
type bit2_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(1 downto 0);


signal opcode : bit4_data_type := (others => (others => '0'));

signal pc : bit16_data_type := (others => (others => '0'));

signal outputval : bit16_data_type := (others => (others => '0'));
signal storedata : bit16_data_type :=(others => (others => '0'));

signal CZ : bit2_data_type := (others => (others => '0'));

signal arf_dest : bit3_data_type := (others => (others => '0'));

signal rrf_dest : bit6_data_type := (others => (others => '0'));

signal issue, execute: bit1_data_type :=(others => '0');

signal stall : std_logic := '0'; -- keeps track of stalling of pipeline
 
signal empty: std_logic := '1'; -- checks if pipeline is empty
signal full: std_logic := '0';

signal dispatch1  :  std_logic := '1';
signal dispatch2 : std_logic := '0';
signal pipe1_write,pipe2_write,pipe3_write: std_logic := '0';

signal complete: std_logic := '0';
signal complete_dest: std_logic_vector(2 downto 0) := (others => '0');



begin
    

-- process for writing instructions from dispatch
instruction_write_process : process(clk,rst,opcode1, opcode2,pc_dec1, pc_dec2,arf_add1, arf_add2,rrf_add1, rrf_add2,dataval,storeval)

variable total: integer := 1; -- keeps a count of total number of instructions in the ROB
variable head, tail: integer := 1; -- head gives pointer to the instruction which has execute 1 in-order
-- tail gives pointer to the next free space for instructions
-- we donot erase instructions from the ROB , rather the tail and head are cyclically rotated throughout the ROB
-- while overwriting already retired instructions, and total ensures that incase we have all non-retirable instruction
-- we donot overwrite anything.

begin
	
	
	if (rst = '1') then
    -- clear data and indices when reset is set
		  opcode <= (others => (others => '0'));
        pc <= (others => (others => '0'));
        outputval <= (others => (others => '0'));
        arf_dest <= (others => (others => '0'));
        rrf_dest <= (others => (others => '0'));
        CZ <= (others => (others => '0'));
        execute <= (others => '0');
        tail := 0;
        head := 0;
        complete <= '0';
        empty <= '1';
        full <= '0';
        total := 0;
		end if;
		
		
     -- if(rising_edge(clk)) then -- synchronous
       if(stall = '0' and not (tail = size - 1)) then -- if the ROB is not stalled and the open entry is not at the last
            if(dispatch1 = '1') then
                
                -- Putting the respective values of instruction 1 in ROB
                opcode(tail) <= opcode1;
                pc(tail) <= pc_dec1;
                arf_dest(tail) <= arf_add1;
                rrf_dest(tail) <= rrf_add1;
                execute(tail) <= '0';
            
                -- Specially storing the data of store 
                if (opcode1 = "0101") then
                storedata(tail) <= storeval;
                end if;

                total := total + 1 ;
            
                -- Updating the tail
                if(not(total = size)) then
                    if (tail = size - 1) then
                        tail := 0;
                    else
                        tail := tail + 1;
                    end if;
                end if;
--            end if;
            
--            if(dispatch2 = '1') then
                -- Putting the respective values of instruction 2 in ROB
                opcode(tail) <= opcode2;
                pc(tail) <= pc_dec2;
                arf_dest(tail) <= arf_add2;
                rrf_dest(tail) <= rrf_add2;
                execute(tail) <= '0';
                -- Specially storing the data of store 
                if (opcode2 = "0101") then
                    storedata(tail) <= storeval;
                    end if;
                total := total + 1;
                -- Updating the tail
                if(not(total = size)) then
                    if (tail = size - 1) then
                        tail := 0;
                    else
                        tail := tail + 1;
                    end if;
                end if;
            end if;
   end if;
	--end if;
    
--    if(stall = '0' and execute(head) = '1') then
--        if (not(total = size)) then
--            if (head = size-1) then
--                head := 0;
--            end if;
--            if((outputval(head) = arf_dest(head+1))) then
--                if((opcode(head) = "") and (opcode(head+1)="")) then
--                    outputval(head+1) <= outputval(head);
--                elsif(outputval(head) = outputval(head+1)) then
--                    aliasing <= '1';
--                end if;
--                end if;
--            outval1 <= outputval(head);
--            outval2 <= outputval(head+1);
--            dest_arf1 <=  arf_dest(head);
--            dest_arf2 <= arf_dest(head+1);
--            cout1 <= C(head);
--            cout2 <= C(head+1);
--            zout1 <= Z(head);
--            zout2 <= Z(head+1);
--                    
--            head := head+1;
--            total := total + 1;
--        else
--            stall <= '1';
--        end if;
--    end if;

end process instruction_write_process;
--
---- Process for writing pipeline data into the ROB 
--data_write_process : process(clk,rst,pipeout1,pipeout2,pipeout3)
--begin
--    if(clk'event and clk='0') then  
--        for i in 0 to size-1 loop
--            if(pipe1_write = '1') then    
--                if (pc(i) = pcpipe1) then
--                    outputval(i) <= pipeout1;
--							CZ(i)<= pipe1CZ;
--                    execute(i) <= '1';
--                end if;
--            end if;
--            if(pipe2_write = '1') then 
--                if (pc(i) = pcpipe2) then
--                    outputval(i) <= pipeout2;
--						  CZ(i)<= pipe2CZ;
--                    execute(i) <= '1';
--                end if;
--            end if;
--            if(pipe3_write = '1') then 
--                if (pc(i) = pcpipe3) then
--                    outputval(i) <= pipeout3;
--						  CZ(i)<= pipe3CZ;
--                    execute(i) <= '1';
--                end if;
--				end if;
--			end loop;
--		end if;
-- end process data_write_process;

dummyout <="11";


end behav;
    
                
                    
                    
                


            
        


