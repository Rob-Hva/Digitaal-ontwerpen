-------------------------------------------------------------------------------
-- Title      : and_gate
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : and_gate.vhd
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


entity and_gate is
  port (a : in std_logic;
        b : in std_logic;
        z : out std_logic);
end entity and_gate;


architecture behavior of and_gate is

begin

  z <= a and b;

end architecture behavior;
