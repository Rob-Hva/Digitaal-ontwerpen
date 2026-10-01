-------------------------------------------------------------------------------
-- Title      : opdracht213
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht213.vhd
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

entity opdracht213 is
  port( x : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end entity opdracht213;

architecture behaviour of opdracht213 is
begin
	with x select
	y <=  "00000001" when "000",
        "00000010" when "001",
        "00000100" when "010",
        "00001000" when "011",
        "00010000" when "100",
        "00100000" when "101",
        "01000000" when "110",
        "10000000" when others;
end architecture behaviour;