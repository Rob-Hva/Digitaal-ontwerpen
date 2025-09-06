library ieee;
use ieee.std_logic_1164.all;

entity opdracht121 is
port( a : in std_logic;
		b : in std_logic;
		z : out std_logic);	
end entity opdracht121;

architecture behaviour of opdracht121 is
begin

	z <= ((not a) and b) or (a and (not b));
	
	-- Hier komt de beschrijving van je digitaal ontwerp;
	-- (Elke regel die begint met "--" wordt opgevat als commentaar.)
	
end architecture behaviour;