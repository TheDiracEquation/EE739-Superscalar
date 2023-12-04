-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "12/04/2023 05:42:18"

-- 
-- Device: Altera 10M25DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DUT IS
    PORT (
	input_vector : IN std_logic_vector(91 DOWNTO 0);
	output_vector : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END DUT;

-- Design Ports Information
-- input_vector[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[3]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[4]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[6]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[7]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[8]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[9]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[10]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[11]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[12]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[13]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[14]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[15]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[16]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[17]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[18]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[19]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[20]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[21]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[22]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[23]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[24]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[25]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[26]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[27]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[28]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[29]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[30]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[31]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[32]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[33]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[34]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[35]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[36]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[37]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[38]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[39]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[40]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[41]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[42]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[43]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[44]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[45]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[46]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[47]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[48]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[49]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[50]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[51]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[52]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[53]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[54]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[55]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[56]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[57]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[58]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[59]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[60]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[61]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[62]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[63]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[64]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[65]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[66]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[67]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[68]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[69]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[70]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[71]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[72]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[73]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[74]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[75]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[76]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[77]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[78]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[79]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[80]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[81]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[82]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[83]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[84]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[85]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[86]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[87]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[88]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[89]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[90]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_vector[91]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[0]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_vector[1]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DUT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_vector : std_logic_vector(91 DOWNTO 0);
SIGNAL ww_output_vector : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \input_vector[0]~input_o\ : std_logic;
SIGNAL \input_vector[1]~input_o\ : std_logic;
SIGNAL \input_vector[2]~input_o\ : std_logic;
SIGNAL \input_vector[3]~input_o\ : std_logic;
SIGNAL \input_vector[4]~input_o\ : std_logic;
SIGNAL \input_vector[5]~input_o\ : std_logic;
SIGNAL \input_vector[6]~input_o\ : std_logic;
SIGNAL \input_vector[7]~input_o\ : std_logic;
SIGNAL \input_vector[8]~input_o\ : std_logic;
SIGNAL \input_vector[9]~input_o\ : std_logic;
SIGNAL \input_vector[10]~input_o\ : std_logic;
SIGNAL \input_vector[11]~input_o\ : std_logic;
SIGNAL \input_vector[12]~input_o\ : std_logic;
SIGNAL \input_vector[13]~input_o\ : std_logic;
SIGNAL \input_vector[14]~input_o\ : std_logic;
SIGNAL \input_vector[15]~input_o\ : std_logic;
SIGNAL \input_vector[16]~input_o\ : std_logic;
SIGNAL \input_vector[17]~input_o\ : std_logic;
SIGNAL \input_vector[18]~input_o\ : std_logic;
SIGNAL \input_vector[19]~input_o\ : std_logic;
SIGNAL \input_vector[20]~input_o\ : std_logic;
SIGNAL \input_vector[21]~input_o\ : std_logic;
SIGNAL \input_vector[22]~input_o\ : std_logic;
SIGNAL \input_vector[23]~input_o\ : std_logic;
SIGNAL \input_vector[24]~input_o\ : std_logic;
SIGNAL \input_vector[25]~input_o\ : std_logic;
SIGNAL \input_vector[26]~input_o\ : std_logic;
SIGNAL \input_vector[27]~input_o\ : std_logic;
SIGNAL \input_vector[28]~input_o\ : std_logic;
SIGNAL \input_vector[29]~input_o\ : std_logic;
SIGNAL \input_vector[30]~input_o\ : std_logic;
SIGNAL \input_vector[31]~input_o\ : std_logic;
SIGNAL \input_vector[32]~input_o\ : std_logic;
SIGNAL \input_vector[33]~input_o\ : std_logic;
SIGNAL \input_vector[34]~input_o\ : std_logic;
SIGNAL \input_vector[35]~input_o\ : std_logic;
SIGNAL \input_vector[36]~input_o\ : std_logic;
SIGNAL \input_vector[37]~input_o\ : std_logic;
SIGNAL \input_vector[38]~input_o\ : std_logic;
SIGNAL \input_vector[39]~input_o\ : std_logic;
SIGNAL \input_vector[40]~input_o\ : std_logic;
SIGNAL \input_vector[41]~input_o\ : std_logic;
SIGNAL \input_vector[42]~input_o\ : std_logic;
SIGNAL \input_vector[43]~input_o\ : std_logic;
SIGNAL \input_vector[44]~input_o\ : std_logic;
SIGNAL \input_vector[45]~input_o\ : std_logic;
SIGNAL \input_vector[46]~input_o\ : std_logic;
SIGNAL \input_vector[47]~input_o\ : std_logic;
SIGNAL \input_vector[48]~input_o\ : std_logic;
SIGNAL \input_vector[49]~input_o\ : std_logic;
SIGNAL \input_vector[50]~input_o\ : std_logic;
SIGNAL \input_vector[51]~input_o\ : std_logic;
SIGNAL \input_vector[52]~input_o\ : std_logic;
SIGNAL \input_vector[53]~input_o\ : std_logic;
SIGNAL \input_vector[54]~input_o\ : std_logic;
SIGNAL \input_vector[55]~input_o\ : std_logic;
SIGNAL \input_vector[56]~input_o\ : std_logic;
SIGNAL \input_vector[57]~input_o\ : std_logic;
SIGNAL \input_vector[58]~input_o\ : std_logic;
SIGNAL \input_vector[59]~input_o\ : std_logic;
SIGNAL \input_vector[60]~input_o\ : std_logic;
SIGNAL \input_vector[61]~input_o\ : std_logic;
SIGNAL \input_vector[62]~input_o\ : std_logic;
SIGNAL \input_vector[63]~input_o\ : std_logic;
SIGNAL \input_vector[64]~input_o\ : std_logic;
SIGNAL \input_vector[65]~input_o\ : std_logic;
SIGNAL \input_vector[66]~input_o\ : std_logic;
SIGNAL \input_vector[67]~input_o\ : std_logic;
SIGNAL \input_vector[68]~input_o\ : std_logic;
SIGNAL \input_vector[69]~input_o\ : std_logic;
SIGNAL \input_vector[70]~input_o\ : std_logic;
SIGNAL \input_vector[71]~input_o\ : std_logic;
SIGNAL \input_vector[72]~input_o\ : std_logic;
SIGNAL \input_vector[73]~input_o\ : std_logic;
SIGNAL \input_vector[74]~input_o\ : std_logic;
SIGNAL \input_vector[75]~input_o\ : std_logic;
SIGNAL \input_vector[76]~input_o\ : std_logic;
SIGNAL \input_vector[77]~input_o\ : std_logic;
SIGNAL \input_vector[78]~input_o\ : std_logic;
SIGNAL \input_vector[79]~input_o\ : std_logic;
SIGNAL \input_vector[80]~input_o\ : std_logic;
SIGNAL \input_vector[81]~input_o\ : std_logic;
SIGNAL \input_vector[82]~input_o\ : std_logic;
SIGNAL \input_vector[83]~input_o\ : std_logic;
SIGNAL \input_vector[84]~input_o\ : std_logic;
SIGNAL \input_vector[85]~input_o\ : std_logic;
SIGNAL \input_vector[86]~input_o\ : std_logic;
SIGNAL \input_vector[87]~input_o\ : std_logic;
SIGNAL \input_vector[88]~input_o\ : std_logic;
SIGNAL \input_vector[89]~input_o\ : std_logic;
SIGNAL \input_vector[90]~input_o\ : std_logic;
SIGNAL \input_vector[91]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \output_vector[0]~output_o\ : std_logic;
SIGNAL \output_vector[1]~output_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_input_vector <= input_vector;
output_vector <= ww_output_vector;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y34_N8
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X60_Y27_N23
\output_vector[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \output_vector[0]~output_o\);

-- Location: IOOBUF_X60_Y17_N24
\output_vector[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \output_vector[1]~output_o\);

-- Location: IOIBUF_X14_Y21_N22
\input_vector[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(0),
	o => \input_vector[0]~input_o\);

-- Location: IOIBUF_X46_Y0_N8
\input_vector[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(1),
	o => \input_vector[1]~input_o\);

-- Location: IOIBUF_X14_Y21_N29
\input_vector[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(2),
	o => \input_vector[2]~input_o\);

-- Location: IOIBUF_X21_Y21_N29
\input_vector[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(3),
	o => \input_vector[3]~input_o\);

-- Location: IOIBUF_X42_Y0_N1
\input_vector[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(4),
	o => \input_vector[4]~input_o\);

-- Location: IOIBUF_X53_Y36_N8
\input_vector[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(5),
	o => \input_vector[5]~input_o\);

-- Location: IOIBUF_X6_Y0_N15
\input_vector[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(6),
	o => \input_vector[6]~input_o\);

-- Location: IOIBUF_X60_Y17_N15
\input_vector[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(7),
	o => \input_vector[7]~input_o\);

-- Location: IOIBUF_X60_Y6_N1
\input_vector[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(8),
	o => \input_vector[8]~input_o\);

-- Location: IOIBUF_X38_Y0_N15
\input_vector[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(9),
	o => \input_vector[9]~input_o\);

-- Location: IOIBUF_X0_Y9_N22
\input_vector[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(10),
	o => \input_vector[10]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\input_vector[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(11),
	o => \input_vector[11]~input_o\);

-- Location: IOIBUF_X19_Y21_N15
\input_vector[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(12),
	o => \input_vector[12]~input_o\);

-- Location: IOIBUF_X12_Y21_N8
\input_vector[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(13),
	o => \input_vector[13]~input_o\);

-- Location: IOIBUF_X53_Y0_N1
\input_vector[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(14),
	o => \input_vector[14]~input_o\);

-- Location: IOIBUF_X36_Y0_N29
\input_vector[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(15),
	o => \input_vector[15]~input_o\);

-- Location: IOIBUF_X10_Y21_N8
\input_vector[16]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(16),
	o => \input_vector[16]~input_o\);

-- Location: IOIBUF_X0_Y19_N1
\input_vector[17]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(17),
	o => \input_vector[17]~input_o\);

-- Location: IOIBUF_X60_Y19_N22
\input_vector[18]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(18),
	o => \input_vector[18]~input_o\);

-- Location: IOIBUF_X60_Y23_N15
\input_vector[19]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(19),
	o => \input_vector[19]~input_o\);

-- Location: IOIBUF_X36_Y0_N8
\input_vector[20]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(20),
	o => \input_vector[20]~input_o\);

-- Location: IOIBUF_X34_Y0_N15
\input_vector[21]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(21),
	o => \input_vector[21]~input_o\);

-- Location: IOIBUF_X0_Y3_N8
\input_vector[22]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(22),
	o => \input_vector[22]~input_o\);

-- Location: IOIBUF_X0_Y14_N8
\input_vector[23]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(23),
	o => \input_vector[23]~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\input_vector[24]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(24),
	o => \input_vector[24]~input_o\);

-- Location: IOIBUF_X32_Y0_N15
\input_vector[25]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(25),
	o => \input_vector[25]~input_o\);

-- Location: IOIBUF_X8_Y21_N15
\input_vector[26]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(26),
	o => \input_vector[26]~input_o\);

-- Location: IOIBUF_X19_Y21_N22
\input_vector[27]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(27),
	o => \input_vector[27]~input_o\);

-- Location: IOIBUF_X32_Y0_N29
\input_vector[28]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(28),
	o => \input_vector[28]~input_o\);

-- Location: IOIBUF_X24_Y0_N29
\input_vector[29]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(29),
	o => \input_vector[29]~input_o\);

-- Location: IOIBUF_X28_Y36_N8
\input_vector[30]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(30),
	o => \input_vector[30]~input_o\);

-- Location: IOIBUF_X40_Y36_N8
\input_vector[31]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(31),
	o => \input_vector[31]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\input_vector[32]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(32),
	o => \input_vector[32]~input_o\);

-- Location: IOIBUF_X60_Y8_N15
\input_vector[33]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(33),
	o => \input_vector[33]~input_o\);

-- Location: IOIBUF_X60_Y31_N8
\input_vector[34]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(34),
	o => \input_vector[34]~input_o\);

-- Location: IOIBUF_X60_Y31_N1
\input_vector[35]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(35),
	o => \input_vector[35]~input_o\);

-- Location: IOIBUF_X0_Y15_N15
\input_vector[36]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(36),
	o => \input_vector[36]~input_o\);

-- Location: IOIBUF_X10_Y0_N29
\input_vector[37]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(37),
	o => \input_vector[37]~input_o\);

-- Location: IOIBUF_X19_Y21_N8
\input_vector[38]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(38),
	o => \input_vector[38]~input_o\);

-- Location: IOIBUF_X8_Y21_N1
\input_vector[39]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(39),
	o => \input_vector[39]~input_o\);

-- Location: IOIBUF_X25_Y29_N15
\input_vector[40]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(40),
	o => \input_vector[40]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\input_vector[41]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(41),
	o => \input_vector[41]~input_o\);

-- Location: IOIBUF_X60_Y2_N8
\input_vector[42]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(42),
	o => \input_vector[42]~input_o\);

-- Location: IOIBUF_X32_Y36_N22
\input_vector[43]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(43),
	o => \input_vector[43]~input_o\);

-- Location: IOIBUF_X25_Y28_N8
\input_vector[44]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(44),
	o => \input_vector[44]~input_o\);

-- Location: IOIBUF_X8_Y0_N22
\input_vector[45]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(45),
	o => \input_vector[45]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\input_vector[46]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(46),
	o => \input_vector[46]~input_o\);

-- Location: IOIBUF_X42_Y0_N8
\input_vector[47]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(47),
	o => \input_vector[47]~input_o\);

-- Location: IOIBUF_X60_Y29_N23
\input_vector[48]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(48),
	o => \input_vector[48]~input_o\);

-- Location: IOIBUF_X42_Y36_N1
\input_vector[49]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(49),
	o => \input_vector[49]~input_o\);

-- Location: IOIBUF_X30_Y36_N15
\input_vector[50]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(50),
	o => \input_vector[50]~input_o\);

-- Location: IOIBUF_X8_Y21_N29
\input_vector[51]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(51),
	o => \input_vector[51]~input_o\);

-- Location: IOIBUF_X0_Y9_N15
\input_vector[52]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(52),
	o => \input_vector[52]~input_o\);

-- Location: IOIBUF_X25_Y29_N1
\input_vector[53]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(53),
	o => \input_vector[53]~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\input_vector[54]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(54),
	o => \input_vector[54]~input_o\);

-- Location: IOIBUF_X32_Y0_N8
\input_vector[55]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(55),
	o => \input_vector[55]~input_o\);

-- Location: IOIBUF_X34_Y0_N29
\input_vector[56]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(56),
	o => \input_vector[56]~input_o\);

-- Location: IOIBUF_X8_Y0_N29
\input_vector[57]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(57),
	o => \input_vector[57]~input_o\);

-- Location: IOIBUF_X38_Y0_N8
\input_vector[58]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(58),
	o => \input_vector[58]~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\input_vector[59]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(59),
	o => \input_vector[59]~input_o\);

-- Location: IOIBUF_X38_Y36_N1
\input_vector[60]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(60),
	o => \input_vector[60]~input_o\);

-- Location: IOIBUF_X42_Y0_N15
\input_vector[61]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(61),
	o => \input_vector[61]~input_o\);

-- Location: IOIBUF_X38_Y36_N29
\input_vector[62]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(62),
	o => \input_vector[62]~input_o\);

-- Location: IOIBUF_X38_Y0_N29
\input_vector[63]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(63),
	o => \input_vector[63]~input_o\);

-- Location: IOIBUF_X0_Y5_N1
\input_vector[64]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(64),
	o => \input_vector[64]~input_o\);

-- Location: IOIBUF_X0_Y16_N1
\input_vector[65]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(65),
	o => \input_vector[65]~input_o\);

-- Location: IOIBUF_X48_Y0_N1
\input_vector[66]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(66),
	o => \input_vector[66]~input_o\);

-- Location: IOIBUF_X14_Y21_N1
\input_vector[67]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(67),
	o => \input_vector[67]~input_o\);

-- Location: IOIBUF_X21_Y21_N8
\input_vector[68]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(68),
	o => \input_vector[68]~input_o\);

-- Location: IOIBUF_X53_Y36_N15
\input_vector[69]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(69),
	o => \input_vector[69]~input_o\);

-- Location: IOIBUF_X21_Y0_N22
\input_vector[70]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(70),
	o => \input_vector[70]~input_o\);

-- Location: IOIBUF_X0_Y14_N15
\input_vector[71]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(71),
	o => \input_vector[71]~input_o\);

-- Location: IOIBUF_X60_Y26_N8
\input_vector[72]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(72),
	o => \input_vector[72]~input_o\);

-- Location: IOIBUF_X58_Y36_N22
\input_vector[73]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(73),
	o => \input_vector[73]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\input_vector[74]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(74),
	o => \input_vector[74]~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\input_vector[75]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(75),
	o => \input_vector[75]~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\input_vector[76]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(76),
	o => \input_vector[76]~input_o\);

-- Location: IOIBUF_X10_Y0_N22
\input_vector[77]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(77),
	o => \input_vector[77]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\input_vector[78]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(78),
	o => \input_vector[78]~input_o\);

-- Location: IOIBUF_X40_Y36_N22
\input_vector[79]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(79),
	o => \input_vector[79]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\input_vector[80]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(80),
	o => \input_vector[80]~input_o\);

-- Location: IOIBUF_X40_Y0_N22
\input_vector[81]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(81),
	o => \input_vector[81]~input_o\);

-- Location: IOIBUF_X53_Y36_N22
\input_vector[82]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(82),
	o => \input_vector[82]~input_o\);

-- Location: IOIBUF_X32_Y0_N22
\input_vector[83]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(83),
	o => \input_vector[83]~input_o\);

-- Location: IOIBUF_X60_Y15_N8
\input_vector[84]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(84),
	o => \input_vector[84]~input_o\);

-- Location: IOIBUF_X21_Y21_N1
\input_vector[85]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(85),
	o => \input_vector[85]~input_o\);

-- Location: IOIBUF_X0_Y4_N22
\input_vector[86]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(86),
	o => \input_vector[86]~input_o\);

-- Location: IOIBUF_X34_Y36_N22
\input_vector[87]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(87),
	o => \input_vector[87]~input_o\);

-- Location: IOIBUF_X10_Y21_N1
\input_vector[88]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(88),
	o => \input_vector[88]~input_o\);

-- Location: IOIBUF_X24_Y0_N15
\input_vector[89]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(89),
	o => \input_vector[89]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\input_vector[90]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(90),
	o => \input_vector[90]~input_o\);

-- Location: IOIBUF_X36_Y36_N1
\input_vector[91]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input_vector(91),
	o => \input_vector[91]~input_o\);

-- Location: UNVM_X0_Y22_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X25_Y34_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X25_Y33_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_output_vector(0) <= \output_vector[0]~output_o\;

ww_output_vector(1) <= \output_vector[1]~output_o\;
END structure;


