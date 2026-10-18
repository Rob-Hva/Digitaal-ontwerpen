-------------------------------------------------------------------------------
-- Title      : opdracht31
-- Project    : Load 'blink-a-LED' design in the FPGA
-------------------------------------------------------------------------------
-- File       : opdracht31.vhd
-- Author     : Caspar Treijtel  <c.treijtel@hva.nl>
-- Created    : 2026-09-10
-- Last update: 2026-09-10
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This design switches a LED on/off with a given frequency.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2026-09-10  1.0      caspar      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;


entity opdracht31 is
  port (clk   : in std_logic;
        rst_n : in std_logic;
        led   : out std_logic);
end entity opdracht31;


architecture behavior of opdracht31 is

  -- Frequency of the onboard oscillator
  constant CLK_FREQ : positive := 12_000_000;
  
  -- Desired frequency of the LED, for simulation purposes this freq.
  -- is set relatively high.
  -- Lower the frequency for a real demonstration on the FPGA board,
  -- then your slow eyes will actually see the blink.
  constant LED_FREQ : positive := 1;

 -- Clock divider generates ticks at wanted LED_FREQ
  constant CLK_DIV  : integer := (CLK_FREQ / LED_FREQ) - 1;
  -- n-bits counter cc that can hold the CLK_DIV value
  constant CC_LEN   : integer := integer(ceil(log2(real(CLK_DIV+1))));
  signal cc         : unsigned(CC_LEN-1 downto 0);

  signal led_sw     : std_logic;
  signal led_sw_n   : std_logic;

begin
  counter : process(clk, rst_n) is
  begin
    if rst_n = '0' then
      -- Upon reset signal, initialize the led_sw and counter signals
      led_sw <= '0';
      cc <= (others => '0');
    elsif rising_edge(clk) then
      if cc = CLK_DIV then
        -- Top of the counter reached, reset counter
        cc <= (others => '0');

        -- Switch to the inverted led_sw
        led_sw <= led_sw_n;
      else
        -- Top not reached, just increment counter
        cc <= cc + 1;
      end if;
    end if;
  end process;

  -- led_sw_n always holds the inverted led_sw
  led_sw_n <= not led_sw;

  -- Drive the output
  led <= led_sw;

end architecture behavior;
