library ieee;
use ieee.std_logic_1164.all;

entity ROB is 
    port(
        -- Inputs from dispatch
        opcode1, opcode2 : in std_logic_vector(3 downto 0);
        PCin_1, PCin_2 : in std_logic_vector(15 downto 0);
        arf_add : in std_logic_vector(2 downto 0);
        rrf_add : in std_logic_vector(5 downto 0);
        
        
        exec_out1, exec_out2, exec_out3 : in std_logic_vector();
       
        --other bits

        outval1, outval2 : out std_logic_vector(15 downto 0);
        cout,zout : out std_logic;
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

signal stall : std_logic;

begin
    variable freepointer : integer := 0
    variable tail : integer := 0
    variable size : integer := 256


instruction_write_proc : process(clk,rst)
begin
    if(rst ='1') then
        opcode <= (others => (others => '0'));
        pc <= (others => (others => '0'));
        outputval <= (others => (others => '0'));
        arf_dest <= (others => (others => '0'));
        rrf_dest <= (others => (others => '0'));
        C <= (others => (others => '0'));
        Z <= (others => (others => '0'));
        
        freepointer := '0';
        tail := '0';

    else
        if (clk'event and clk='0') then
            if(stall = '0')
                opcode(freepointer) <= opcode1;
                pc(freepointer)<=PCin_1;
                arf_add(freepointer)<=arf_dest; 
                rrf_add(freepointer)<=rrf_dest;
                
                freepointer = freepointer+1;
            end if;
            if
            
