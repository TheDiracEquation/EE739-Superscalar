LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity datapath is
    port (
        reset, clk : in std_logic;
        output_proc :  out std_logic_vector(31 DOWNTO 0)
    );
  end entity;

architecture of datapath is

component fetch

component fetchdecode

component decode

component rs

component alucontrol

component int_pipeline

component rob
  signal: 

