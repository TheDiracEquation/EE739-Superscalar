-- THIS IS THE CODE FOR THE RS
library ieee;
use ieee.std_logic_1164.all;

entity RS is 
    port(
        control_1, control_2 : in std_logic_vector(4 downto 0);
        PCin_1, PCin_2 : in std_logic_vector(15 downto 0);
        opra_1, oprb_1, opra_2, oprb_2 : std_logic_vector(15 downto 0);
        
    )

