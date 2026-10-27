-------------------------------------------------------------------------------
-- Title      : opdracht42 testbench
-------------------------------------------------------------------------------
-- File       : opdracht42_tb.vhd
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
use ieee.math_real.ceil;
use ieee.math_real.log2;
use ieee.math_real.uniform;

entity opdracht42_tb is
end entity opdracht42_tb;

architecture testbench of opdracht42_tb is
	component opdracht42 is

		port(clk 			: in std_logic;
		     rst_n 			: in std_logic;
		     button 		: in std_logic;
      		 btn_debounce  	: out std_logic;
      		 press_event   	: out std_logic;
      		 release_event	: out std_logic);
	end component;

	constant CLK_FREQ           : integer := 12000000;
	constant CLOCK_PERIOD 		: time := 1 sec / CLK_FREQ;

	constant BTN_PRESS_DURATION : time := 20 ms; --Asumed duration of a button press in ms.
	constant CLKS_PER_DEBOUNCE	: real := real(BTN_PRESS_DURATION / CLOCK_PERIOD);
	
	signal clk 					: std_logic := '0';
	signal rst_n				: std_logic := '0';
	signal button				: std_logic := '0';
	signal btn_debounce 		: std_logic := '0';
	signal press_event	 		: std_logic := '0';
	signal release_event 		: std_logic := '0';

begin

	DUT : opdracht42

		port map(clk => clk,
	 		 rst_n => rst_n,
			 button => button,
			 btn_debounce => btn_debounce,
			 press_event => press_event,
			 release_event => release_event);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process

		variable seed1, seed2 : positive := 1; --Seeds for generating random numbers.
		variable rand_real : real;

	begin
		rst_n <= '0';
		wait for 0.25 * CLOCK_PERIOD;

		rst_n <= '1';

		--Debounce is being simulated.
		for i in 0 to integer(ceil(0.05 * CLKS_PER_DEBOUNCE)) loop
			uniform(seed1, seed2, rand_real); --Put random number in rand_real.
			button <= not button;	

			for j in 0 to integer(rand_real * 10.0) loop
				wait until rising_edge(clk);
			end loop;
		end loop;
	
		--Debounce is gone, the button is being pressed.
		button <= '1';
		wait for BTN_PRESS_DURATION;

		--Debounce is being simulated.
		for i in 0 to integer(ceil(0.05 * CLKS_PER_DEBOUNCE)) loop
			uniform(seed1, seed2, rand_real); --Put random number in rand_real.
			button <= not button;	

			for j in 0 to integer(rand_real * 10.0) loop
				wait until rising_edge(clk);
			end loop;
		end loop;

		--Debounce is gone, the button is released.
		button <= '0'; 
		wait for BTN_PRESS_DURATION;

		--Debounce is being simulated.
		for i in 0 to integer(ceil(0.05 * CLKS_PER_DEBOUNCE)) loop
			uniform(seed1, seed2, rand_real); --Put random number in rand_real.
			button <= not button;	

			for j in 0 to integer(rand_real * 10.0) loop
				wait until rising_edge(clk);
			end loop;
		end loop;
	
		--Debounce is gone, the button is being pressed.
		button <= '1';
		wait for BTN_PRESS_DURATION;

		--Debounce is being simulated.
		for i in 0 to integer(ceil(0.05 * CLKS_PER_DEBOUNCE)) loop
			uniform(seed1, seed2, rand_real); --Put random number in rand_real.
			button <= not button;	

			for j in 0 to integer(rand_real * 10.0) loop
				wait until rising_edge(clk);
			end loop;
		end loop;

		--Debounce is gone, the button is released.
		button <= '0'; 
		wait for BTN_PRESS_DURATION;

		wait;
	end process stimuli;
end architecture testbench;