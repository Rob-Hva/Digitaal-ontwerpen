-------------------------------------------------------------------------------
-- Title      : opdracht43
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht43.vhd
-- Author     : Aabee Ceedee  <a.b.ceedee@hva.nl>
-- Created    : 2026-09-04
-- Last update: 2026-09-04
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Larger description here.
-------------------------------------------------------------------------------
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

entity opdracht43 is

	port(clk 	        : in 	std_logic;
		  rst_n 	      : in 	std_logic;
		  button        : in 	std_logic;
      btn_switch    : out std_logic);
		  
end entity opdracht43;

architecture behaviour of opdracht43 is

  -- components --
  component button_debounce is
    port (clk           : in std_logic;
          rst_n         : in std_logic;
          button        : in std_logic;
          btn_debounce  : out std_logic;
          press_event   : out std_logic;
          release_event : out std_logic);
  end component;

  -- constants --
  constant CLK_FREQ           : integer := 12000000;
  constant SAMPLE_FREQ        : integer := 400;
  constant CLK_DIV            : integer := (CLK_FREQ / SAMPLE_FREQ);
  constant CC_LEN             : integer := integer(ceil(log2(real(CLK_DIV+1))));

  constant BTN_PRESS_DURATION : time := 20 ms; --Asumed duration of a button press in ms.
  constant SAMPLE_PERIOD      : time := 1.00 / real(SAMPLE_FREQ) * 1 sec;
  constant SAMP_LEN           : integer := integer(ceil(real(BTN_PRESS_DURATION / SAMPLE_PERIOD))); --Amount of bits needed to sample.
  constant PRESS_VECTOR       : std_logic_vector(SAMP_LEN-1 downto 0) := (others => '1');
  constant RELEASE_VECTOR       : std_logic_vector(SAMP_LEN-1 downto 0) := (others => '0');

  -- signals --
  signal btn_debounce_ff      : std_logic := '0';
  signal btn_debounce_prev_ff : std_logic := '0';
  signal switch_ff            : std_logic := '0';

begin

  debounce : button_debounce port map(
    clk           => clk,
    rst_n         => rst_n,
    button        => button,
    btn_debounce  => btn_debounce_ff,
    press_event   => open,
    release_event => open
  );

  switch : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			switch_ff <= '0';
			btn_debounce_prev_ff	<= '0';
		elsif rising_edge(clk) then
		
			btn_debounce_prev_ff <= btn_debounce_ff;
				
			if btn_debounce_ff = '1' AND btn_debounce_prev_ff = '0' then
				-- button pressed! toggle switch
				switch_ff <= NOT switch_ff;
			end if;
			
		end if;
		end process switch;
		
		btn_switch <= switch_ff;
end architecture behaviour;