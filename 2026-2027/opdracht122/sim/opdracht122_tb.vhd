-------------------------------------------------------------------------------
-- Title      : opdracht122 testbench
-------------------------------------------------------------------------------
-- File       : opdracht122_tb.vhd
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

entity opdracht122_tb is
end entity opdracht122_tb;

architecture testbench of opdracht122_tb is

  constant CLOCK_PERIOD : time := 100 us;

  component opdracht122 is
    port (a : in std_logic;
          b : in std_logic;
          z : out std_logic);
  end component;

  for dut : opdracht122 use entity work.opdracht122;

  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal z : std_logic;

begin

  stimuli : process
  begin
    wait for 1 * CLOCK_PERIOD;
    a <= '1';
    wait for 1 * CLOCK_PERIOD;
    b <= '1';
    wait for 1 * CLOCK_PERIOD;
    a <= '0';
    wait for 1 * CLOCK_PERIOD;
    wait;
  end process stimuli;

  dut : opdracht122
    port map (a => a,
              b => b,
              z => z);

end architecture testbench;
