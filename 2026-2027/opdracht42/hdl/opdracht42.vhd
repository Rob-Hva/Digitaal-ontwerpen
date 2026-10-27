-------------------------------------------------------------------------------
-- Title      : opdracht42
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht42.vhd
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

entity opdracht42 is

	port(clk 	        : in 	std_logic;
		  rst_n 	      : in 	std_logic;
		  button        : in 	std_logic;
      btn_debounce  : out std_logic;
      press_event   : out std_logic;
      release_event : out std_logic);
		  
end entity opdracht42;

architecture behaviour of opdracht42 is

  constant CLK_FREQ           : integer := 12000000;
  constant SAMPLE_FREQ        : integer := 400;
  constant CLK_DIV            : integer := (CLK_FREQ / SAMPLE_FREQ);
  constant CC_LEN             : integer := integer(ceil(log2(real(CLK_DIV+1))));

  constant BTN_PRESS_DURATION : time := 20 ms; --Asumed duration of a button press in ms.
  constant SAMPLE_PERIOD      : time := 1.00 / real(SAMPLE_FREQ) * 1 sec;
  constant SAMP_LEN           : integer := integer(ceil(real(BTN_PRESS_DURATION / SAMPLE_PERIOD))); --Amount of bits needed to sample.
  constant PRESS_VECTOR       : std_logic_vector(SAMP_LEN-1 downto 0) := (others => '1');
  constant RELEASE_VECTOR       : std_logic_vector(SAMP_LEN-1 downto 0) := (others => '0');

  signal cc                   : unsigned(CC_LEN-1 downto 0) := (others => '0');
  signal sample_ff            : std_logic := '0';
  signal sample_vector        : std_logic_vector(SAMP_LEN-1 downto 0) := (others => '0');

  signal press_ff         : std_logic := '0';
  signal release_ff       : std_logic := '0';
  signal press_ff_prev    : std_logic := '0';
  signal release_ff_prev  : std_logic := '0';
  signal press_event_ff   : std_logic := '0';
  signal release_event_ff : std_logic := '0';
begin

  print_const : process (rst_n) is 
  begin
    report "CC_LEN: " & integer'image(CC_LEN);
    report "BTN_PRESS_DURATION: " & time'image(BTN_PRESS_DURATION);
    report "SAMPLE_PERIOD: " & time'image(SAMPLE_PERIOD);
    report "SAMP_LEN: " & integer'image(SAMP_LEN);
  end process;

  clk_divider : process (clk, rst_n) is
  begin
    if rst_n = '0' then
      cc <= (others => '0');
      sample_ff <= '0';
    elsif rising_edge(clk) then
      if cc < CLK_DIV - 1 then
        cc <= cc + 1;
        sample_ff <= '0';
      elsif cc >= CLK_DIV - 1 then
        sample_ff <= '1';
        cc <= (others => '0');
      end if;
    end if;
  end process;

  sample : process (clk, rst_n) is
  begin
    if rst_n = '0' then
      sample_vector <= (others => '0');
    elsif rising_edge(clk) then
      if sample_ff = '1' then
        sample_vector <= sample_vector(SAMP_LEN-2 downto 0) & button;
      end if;
    end if;
  end process;

  debounce_filter : process (clk, rst_n) is
  begin
    if rst_n = '0' then
      press_ff <= '0';
      press_ff_prev <= '0';
      release_ff <= '0';
      release_ff_prev <= '0';
    elsif rising_edge(clk) then 
        release_ff_prev <= release_ff; 
        press_ff_prev <= press_ff;  
      if sample_vector = PRESS_VECTOR then
        press_ff <= '1';
        release_ff <= '0';
      elsif sample_vector = RELEASE_VECTOR then
        release_ff <= '1';
        press_ff <= '0';
      end if;
    end if;
  end process;

  btn_debounce <= press_ff;

  event_ender : process (clk, rst_n) is
  begin
    if rst_n = '0' then
      press_event_ff <= '0';
      release_event_ff <= '0';
    elsif rising_edge(clk) then

      if (press_ff = '1') AND (press_ff_prev = '0') then
        press_event_ff <= '1';
      else 
        press_event_ff <= '0';
      end if;

      if (release_ff = '1') AND (release_ff_prev = '0') then
        release_event_ff <= '1';
      else
        release_event_ff <= '0';
      end if;

    end if;
  end process;

  press_event <= press_event_ff;
  release_event <= release_event_ff;

end architecture behaviour;