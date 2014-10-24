-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/15/2014 00:28:20"
                                                            
-- Vhdl Test Bench template for design  :  uart
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uart_vhd_tst IS
END uart_vhd_tst;
ARCHITECTURE uart_arch OF uart_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL gpio : STD_LOGIC_VECTOR(0 TO 19);
SIGNAL gpio_IN : STD_LOGIC_VECTOR(0 TO 1);
SIGNAL gpioOut : STD_LOGIC_VECTOR(0 TO 13);
SIGNAL KEY : STD_LOGIC_VECTOR(0 TO 1);
SIGNAL LED : STD_LOGIC_VECTOR(0 TO 7);
COMPONENT uart
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	gpio : IN STD_LOGIC_VECTOR(0 TO 19);
	gpio_IN : IN STD_LOGIC_VECTOR(0 TO 1);
	gpioOut : BUFFER STD_LOGIC_VECTOR(0 TO 13);
	KEY : IN STD_LOGIC_VECTOR(0 TO 1);
	LED : BUFFER STD_LOGIC_VECTOR(0 TO 7)
	);
END COMPONENT;
BEGIN
	i1 : uart
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	gpio => gpio,
	gpio_IN => gpio_IN,
	gpioOut => gpioOut,
	KEY => KEY,
	LED => LED
	);
	
	clock: process
	begin
		CLOCK_50 <= '0';
		wait for 100ps;
		CLOCK_50 <= '1';
		wait for 100ps;
	end process clock;

	Tx: process
	begin
		gpio(4) <= '1';
		wait for 10ns;
		gpio(4) <= '0';
		wait for 1ns;
		gpio(4) <= '1';
		wait for 1ns;
		gpio(4) <= '0';
		wait for 1ns;
		gpio(4) <= '1';
		wait for 1ns;
		gpio(4) <= '0';
		wait for 1ns;
		gpio(4) <= '1';
		wait for 1ns;
		gpio(4) <= '0';
		wait for 4ns;
		gpio(4) <= '1';
		wait for 10ns;
	end process Tx;
	
END uart_arch;
