-------------------------------------------------------------------------------
-- Title      : opdracht125
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht125.vhd
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

entity opdracht125 is
port(	a : in std_logic;
		b : in std_logic;
		ci : in std_logic;
		sum : out std_logic;
		co : out std_logic);
end entity opdracht125;

architecture behaviour of opdracht125 is
  signal A_XOR_B : std_logic;
  signal A_XOR_B_AND_CI : std_logic;
  signal A_AND_B : std_logic;
begin

  A_XOR_B <= a xor b;
  A_XOR_B_AND_CI <= A_XOR_B and ci;
  A_AND_B <= a and b;

	sum <= A_XOR_B xor ci;
	co <= A_AND_B or A_XOR_B_AND_CI;

end architecture behaviour;
