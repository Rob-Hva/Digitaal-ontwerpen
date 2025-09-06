library ieee;
use ieee.std_logic_1164.all;

entity opdracht123 is
port(	a : in std_logic;
		b : in std_logic;
		ci : in std_logic;
		sum : out std_logic;
		co : out std_logic);
end entity opdracht123;

architecture behaviour of opdracht123 is
begin

	sum <= (a xor b) or ci;
	co <= (a and b) or (ci and (a xor b));

end architecture behaviour;