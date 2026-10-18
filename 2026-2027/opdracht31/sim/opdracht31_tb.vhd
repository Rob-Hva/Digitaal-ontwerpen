-------------------------------------------------------------------------------
-- Title      : opdracht31 testbench
-- Project    : Testbench for 'blink-a-LED' design
-------------------------------------------------------------------------------
-- File       : opdracht31_tb.vhd
-- Author     : Caspar Treijtel  <c.treijtel@hva.nl>
-- Created    : 2026-09-10
-- Last update: 2026-09-10
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simulate the clock and verify the output of led signal
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2026-09-10  1.0      caspar      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity opdracht31_tb is
end entity opdracht31_tb;

architecture testbench of opdracht31_tb is

  constant CLOCK_PERIOD : time := 83 ns; -- 12 MHz clock

  -- The opdracht31 component contains our blink LED design
  component opdracht31 is
    port (clk   : in std_logic;
          rst_n : in std_logic;
          led   : out std_logic);
  end component;

  for dut : opdracht31 use entity work.opdracht31;

  signal clk   : std_logic := '0';
  signal rst_n : std_logic := '1'; -- Reset signal is active low
  signal led   : std_logic;        -- This is the resulting output

begin
  clk <= not clk after 0.5 * CLOCK_PERIOD;

  stimuli : process
  begin
    -- Hold the 'reset' button
    rst_n <= '0';
    -- wait (our fingers are slowwww)
    wait for 250000 * CLOCK_PERIOD;

    -- Go!
    rst_n <= '1';

    wait;
  end process stimuli;

  dut : opdracht31
    port map (clk => clk,
              rst_n => rst_n,
              led => led);

end architecture testbench;
