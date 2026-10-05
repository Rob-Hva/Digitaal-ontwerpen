-------------------------------------------------------------------------------
-- Title      : opdracht231
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht231.vhd
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

entity opdracht231 is
	port(D : in std_logic;
		  clk : in std_logic;
		  Q : out std_logic);
end entity opdracht231;

architecture behaviour of opdracht231 is

begin

	dflipflop : process(clk) is
	begin
		if rising_edge(clk) then
			Q <= D;
		end if;
	end process dflipflop;

end architecture behaviour;