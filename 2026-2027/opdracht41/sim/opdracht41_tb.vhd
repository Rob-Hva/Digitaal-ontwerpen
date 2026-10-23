-------------------------------------------------------------------------------
-- Title      : opdracht41 testbench
-------------------------------------------------------------------------------
-- File       : opdracht41_tb.vhd
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

entity opdracht41_tb is
end entity opdracht41_tb;

architecture testbench of opdracht41_tb is
	component opdracht41 is
		port(clk : in std_logic;
		     rst_n : in std_logic;
		     button : in std_logic;
		     sw : out std_logic);
	end component;

	constant T : integer := 16;
	constant CLOCK_PERIOD : time := 20 us;

	signal clk : std_logic := '0';
	signal rst_n : std_logic := '1';
	signal button : std_logic := '1';
	signal sw : std_logic := '0';

begin

	DUT : opdracht41
		port map(clk => clk,
	 		 rst_n => rst_n,
			 button => button,
			 sw => sw);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin

		rst_n <= '0';
		wait for 0.25 * CLOCK_PERIOD;

		rst_n <= '1';
		wait for 0.25 * CLOCK_PERIOD;

		button <= '0'; --Press
		wait for 8.5 * CLOCK_PERIOD;

		button <= '1'; --Release
		wait for 11 * CLOCK_PERIOD;

		button <= '0'; --Press
		wait for 8.5 * CLOCK_PERIOD;

		button <= '1'; --Release
    wait for 20 * CLOCK_PERIOD;

    button <= '0'; --Press
		wait for 8.5 * CLOCK_PERIOD;

		button <= '1'; --Release
    wait for 20 * CLOCK_PERIOD;

    button <= '0'; --Press
		wait for 8.5 * CLOCK_PERIOD;

		button <= '1'; --Release

		wait;
	end process stimuli;
end architecture testbench;