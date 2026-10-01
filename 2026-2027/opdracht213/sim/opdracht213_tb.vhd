-------------------------------------------------------------------------------
-- Title      : MUX testbench (opdracht213)
-------------------------------------------------------------------------------
-- File       : opdracht213_tb.vhd
-- Author     : Caspar Treijtel  <c.treijtel@hva.nl>
-- Created    : 2026-09-09
-- Last update: 2026-09-09
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simple testbench for wide MUX
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2026-09-09  1.0      caspar      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity opdracht213_tb is
end entity opdracht213_tb;

architecture testbench of opdracht213_tb is

  constant CLOCK_PERIOD : time := 100 us;

  component opdracht213 is
    port (x : in std_logic_vector(2 downto 0);
          y : out std_logic_vector(7 downto 0));
  end component;

  for dut : opdracht213 use entity work.opdracht213;

  signal x : std_logic_vector(2 downto 0);
  signal y : std_logic_vector(7 downto 0);

begin
  stimuli : process
  begin
    x <= "000"; wait for 1 * CLOCK_PERIOD;
    x <= "001"; wait for 1 * CLOCK_PERIOD;
    x <= "010"; wait for 1 * CLOCK_PERIOD;
    x <= "011"; wait for 1 * CLOCK_PERIOD;
    x <= "100"; wait for 1 * CLOCK_PERIOD;
    x <= "101"; wait for 1 * CLOCK_PERIOD;
    x <= "110"; wait for 1 * CLOCK_PERIOD;
    x <= "111"; wait for 1 * CLOCK_PERIOD;
    wait;
  end process stimuli;

  dut : opdracht213
    port map (x => x, y => y);

end architecture testbench;
