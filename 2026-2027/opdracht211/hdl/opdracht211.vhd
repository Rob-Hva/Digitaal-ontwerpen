-------------------------------------------------------------------------------
-- Title      : opdracht211
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht211.vhd
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

entity opdracht211 is
    port(a, b, sel : in std_logic;
    z: out std_logic);
end entity opdracht211;

architecture behaviour of opdracht211 is
begin
    with sel select
    z <= a when '0',
    b when others;
end architecture behaviour;