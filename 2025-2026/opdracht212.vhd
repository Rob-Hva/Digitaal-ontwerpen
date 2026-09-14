library ieee;
use ieee.std_logic_1164.all;

entity opdracht212 is
port(a, b, sel : in std_logic;
		z : out std_logic);
end entity opdracht212;

architecture behaviour of opdracht212 is

begin

	with sel select
		z <= a when '0',
			  b when others;
	
end architecture behaviour;