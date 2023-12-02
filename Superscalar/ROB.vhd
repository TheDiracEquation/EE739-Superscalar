library ieee;
use ieee.std_logic_1164.all;

entity ROB is 
generic(
    size : integer := 256 -- size of the ROB
);
    port(
        -- Inputs from dispatch
        opcode1, opcode2 : in std_logic_vector(3 downto 0); -- opcodes from dispatch
        pc_dec1, pc_dec2, pcpipe1, pcpipe2, pcpipe3 : in std_logic_vector(15 downto 0); -- pc inputs from the decode and pipeline
        arf_add1, arf_add2 : in std_logic_vector(2 downto 0); -- arf destination addresses from dispatch
        rrf_add1, rrf_add2 : in std_logic_vector(5 downto 0); -- rrf destinations from dispatch
        pipeout1, pipeout2, pipeout3 : in std_logic_vector(15 downto 0); -- pipeline outputs
        pipe1C, pipe2C, pipe3C, pipe1Z, pipe2Z, pipe3Z : in std_logic; -- pipeline C and Z outputs
       
       

        outval1, outval2 : out std_logic_vector(15 downto 0); -- output values for retirement
        dest_arf : out std_logic_vector(2 downto 0); -- output arf destination for retirement and alias correction
        dest_memory :out std_logic_vector(15 downto 0); -- 
        cout,zout,aliasing : out std_logic;-- output values for c and z and aliasing bit for retirement
    )
end entity;

architecture behav of ROB is

type 4bit_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(3 downto 0); -- Creates a data type for the ROB
type 16bit_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(15 downto 0);
type 3bit_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(2 downto 0);
type 6bit_data_type is array((integer'(2)**8)-1 downto 0) of std_logic_vector(5 downto 0);
type 1bit_data_type is array((integer'(2)**8)-1 downto 0) of std_logic;


signal opcode : 4bit_data_type

signal pc : 16bit_data_type
signal outputval : 16bit_data_type

signal arf_dest : 3bit_data_type

signal rrf_dest : 6bit_data_type

signal C , Z , issue, execute: 1bit_data_type

signal stall : std_logic; -- keeps track of stalling of pipeline
 
signal empty: std_logic := '1'; -- checks if pipeline is empty
signal full: std_logic := '0';


signal complete: std_logic := '0';
signal complete_dest: std_logic_vector(2 downto 0) := (others => '0');

begin
    variable length: integer; -- keeps a count of total number of instructions in the ROB
    variable head, tail: integer -- head gives pointer to the instruction which has execute 1 in-order
    -- tail gives pointer to the next free space for instructions
    -- we donot erase instructions from the ROB , rather the tail and head are cyclically rotated throughout the ROB
    -- while overwriting already retired instructions, and length ensures that incase we have all non-retirable instruction
    -- we donot overwrite anything.
if (rst = '1') then
    -- clear data and indices when reset is set
    pc <= (others => (others => '0'));
    outputval <= (others => (others => '0'));
    arf_dest <= (others => (others => '0'));
    rrf_dest <= (others => (others => '0'));
    C <= (others => '0');
    Z <= (others => '0');
    executed <= (others => '0');
    tail <= 0;
    head <= 0;
    complete <= '0';
    empty <= '1';
    full <= '0';
    length <= 0;
end if;

-- process for writing instructions from dispatch
instruction_write_process : process(clk,rst)
begin
      if(clk'event and clk='0') then -- synchronous
        if(stall = '0' and not (tail = size - 1)) then -- if the ROB is not stalled and the open entry is not at the last
            opcode(tail) <= opcode1;-- pushing data into free rob entry
            pc(tail) <= pc_dec1;
            arf_dest(tail) <= arf_add1;
            rrf_dest(tail) <= rrf_add1;
            executed(tail) <= '0';
            
            length := length + 1 -
        
            if(not(length = size)) then
                if (tail = size - 1) then
                    tail := 0;
                else
                    tail = tail + 1;
                end if;
            end if;

            opcode(tail) <= opcode2;
            pc(tail) <= pc_dec2;
            arf_dest(tail) <= arf_add2;
            rrf_dest(tail) <= rrf_add2;
            executed(tail) <= '0';

            length := length + 1;

            if(not(length = size)) then
                if (tail = size - 1) then
                    tail := 0;
                else
                    tail = tail + 1;
                end if;
            end if;

            opcode(tail) <= opcode2;
            pc(tail) <= pc_dec2;
            arf_dest(tail) <= arf_add2;
            rrf_dest(tail) <= rrf_add2;
            executed(tail) <= '0';
    end if;
end process;

data_write_process : process(clk,rst,pipeout1,pipeout2,pipeout3)
begin
    if(clk'event and clk='0') then  
        for i in 0 to size-1 loop
            if (pc(i) = pcpipe1) then
                outputval(i) <= pipeout1;
                C(i) <= pipe1C ;
                Z(i) <= pipe1Z;
                executed(i) <= '1';
            end if;
            if (pc(i) = pcpipe2) then
                outputval(i) <= pipeout2;
                C(i) <= pipe2C ;
                Z(i) <= pipe2Z;
                executed(i) <= '1';
            end if;
            if (pc(i) = pcpipe3) then
                outputval(i) <= pipeout3;
                C(i) <= pipe3C ;
                Z(i) <= pipe3Z;
                executed(i) <= '1';
            end if;
        end loop;
    end process;
end if;

retire_process : process(clk,rst,)
begin
    if(clk'event and clk='0') then
        if(stall = '0' and execute(head) = '1') then
            if (not(length == size)) then
                if (head = size-1) then
                    head := 0;
                end if;
                if((arf_dest(head) == arf_dest(head+1))) then
                    if((opcode(head) == "") and (opcode(head+1)="")) then
                        outputval(head+1) <= outputval(head)
                    else if(opcode(head) == opcode(head+1)) then
                        aliasing <= '1';
                    end if;
                    end if;
                outval1 <= outputval(head);
                outval2 <= outputval(head+1);
                dest_arf1 <=  arf_dest(head);
                dest_arf2 <= arf_dest(head+1);
                cout1 <= C(head);
                cout2 <= C(head+1);
                zout1 <= Z(head);
                zout2 <= Z(head+1);
                        
                head := head+1;
                length := length + 1;
            else
                stall <= '1';
            end if;
        end if;
    end if;
end process;

end architecture;
    
                
                    
                    
                


            
        


