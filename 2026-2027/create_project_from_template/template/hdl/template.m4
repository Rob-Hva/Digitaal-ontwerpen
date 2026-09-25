-------------------------------------------------------------------------------
-- Title      : template
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : template.vhd
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


entity template is
  port (a : in std_logic;
        b : in std_logic;
        z : out std_logic);
end entity template;


architecture behavior of template is

begin

  z <= a and b;

end architecture behavior;
