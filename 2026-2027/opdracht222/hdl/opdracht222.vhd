-------------------------------------------------------------------------------
-- Title      : opdracht222
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht222.vhd
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

entity opdracht222 is
	port( x : in std_logic_vector(7 downto 0);
		    y : out std_logic_vector(2 downto 0));
end entity opdracht222;

architecture behaviour of opdracht222 is

begin

	priority_enc : process (x) is
	begin
	
		if x(0) = '1' then
			y <= "000";
		elsif x(1) = '1' then
			y <= "001";
		elsif x(2) = '1' then
			y <= "010";
		elsif x(3) = '1' then
			y <= "011";
		elsif x(4) = '1' then
			y <= "100";
		elsif x(5) = '1' then
			y <= "101";
		elsif x(6) = '1' then
			y <= "110";
		elsif x(7) = '1' then
			y <= "111";
    else 
      y <= "000";
    end if;
		
	end process priority_enc;

end architecture behaviour;