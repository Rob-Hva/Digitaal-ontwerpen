-------------------------------------------------------------------------------
-- Title      : opdracht321 testbench
-------------------------------------------------------------------------------
-- File       : opdracht321_tb.vhd
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

entity opdracht321_tb is
end entity opdracht321_tb;

architecture testbench of opdracht321_tb is
	component opdracht321 is
		port(clk, rst_n, d : in std_logic;
		q : out std_logic);
	end component;

	for DUT : opdracht321 use entity work.opdracht321(behaviour);

	signal clk : std_logic := '1';
	signal rst_n, d, q : std_logic;
 
	constant CLOCK_PERIOD : time := 20 ns;
begin
	DUT : opdracht321 port map(clk => clk, rst_n => rst_n,
				   d => d, q => q);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		-- First we test the inputs while rst_n is low
		rst_n <= '0';
		d <= '0';
		wait for CLOCK_PERIOD;
		
		d <= '1';
		wait for CLOCK_PERIOD * 2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD/2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD;
		
		d <= '0';
		wait for CLOCK_PERIOD/2;

    -- Then we test the inputs while rst_n is high.
    rst_n <= '1';

		d <= '1';
		wait for CLOCK_PERIOD * 2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD/2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD;
		
		d <= '0';
		wait;
	end process stimuli;	
end architecture testbench;