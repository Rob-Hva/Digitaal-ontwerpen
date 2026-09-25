-------------------------------------------------------------------------------
-- Title      : opdracht123
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht123.vhd
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

entity opdracht123 is
port(	a : in std_logic;
		b : in std_logic;
		sum : out std_logic;
		carry : out std_logic);
end entity opdracht123;

architecture behaviour of opdracht123 is
begin

	sum <= a xor b;
	carry <= a and b;

end architecture behaviour;