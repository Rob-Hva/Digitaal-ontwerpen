library ieee;
use ieee.std_logic_1164.all;

entity opdracht122 is
port(	a : in std_logic;
		b : in std_logic;
		sum : out std_logic;
		carry : out std_logic);
end entity opdracht122;

architecture behaviour of opdracht122 is
begin

	sum <= a xor b;
	carry <= a and b;

end architecture behaviour;