-------------------------------------------------------------------------------
-- Title      : opdracht124
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht124.vhd
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

entity opdracht124 is
port(	a : in std_logic;
		b : in std_logic;
		ci : in std_logic;
		sum : out std_logic;
		co : out std_logic);
end entity opdracht124;

architecture behaviour of opdracht124 is
begin

	sum <= (a xor b) xor ci;
	co <= (a and b) or (ci and (a xor b));

end architecture behaviour;
