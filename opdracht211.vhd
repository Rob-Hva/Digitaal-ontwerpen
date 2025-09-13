library ieee;
use ieee.std_logic_1164.all;

entity opdracht211 is
port(a, b, sel : in std_logic;
		z : out std_logic);
end entity opdracht211;

architecture behaviour of opdracht211 is

begin

	z <= 'U' when sel = 'U'  else
	a when sel = '0' else
	b when sel = '1';
	
end architecture behaviour;