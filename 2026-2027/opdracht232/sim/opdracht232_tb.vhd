-------------------------------------------------------------------------------
-- Title      : opdracht232 testbench
-------------------------------------------------------------------------------
-- File       : opdracht232_tb.vhd
-- Author     : Aabee Ceedee  <a.b.ceedee@hva.nl>
-- Created    : 2026-09-04
-- Last update: 2026-09-04
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Larger description here.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2026-03-13  1.0      abeeceedee  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This will be a testbench for a ALU.

entity Nbit_register_tb is
end entity Nbit_register_tb;

architecture testbench of Nbit_register_tb is

	component Nbit_register is 

		generic (N : integer := 8);

		port(	clk 	: in 	std_logic;
		  	  D 		: in	std_logic_vector(N-1 downto 0);
		  	  Q		  : out	std_logic_vector(N-1 downto 0));
	end component;

	constant CLOCK_PERIOD 		: time := 20 ns;
	constant N 			: integer := 8;
	constant possible_values 	: integer := 2 ** N; -- Amount of possible values a N-bit vector can represent.

	signal	clk 	: 	std_logic := '0';
	signal	D	:	std_logic_vector(N-1 downto 0) := (others => '0');
	signal	Q	:	std_logic_vector(N-1 downto 0) := (others => '0');

begin
	DUT : Nbit_register
		
		generic map(N => N)
		port map(clk => clk,
    		  	 D => D,
		    	   Q => Q);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli : process
	begin
		for i in 1 to possible_values - 1 loop
			wait for 20 ns;
			D <= std_logic_vector(to_unsigned(i, N));
		end loop;
		
		wait;
	end process stimuli;
end architecture testbench;