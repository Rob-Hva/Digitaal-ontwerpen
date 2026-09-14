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

	signal a_XOR_b : std_logic;
	signal a_XOR_b_AND_carryin : std_logic;
	signal a_AND_b : std_logic;

begin

	a_XOR_b <= a xor b;
	a_XOR_b_AND_carryin <= a_XOR_b and ci;
	a_AND_b <= a and b;

	sum <= a_XOR_b or ci;
	co <= a_AND_b or a_XOR_b_AND_carryin;

end architecture behaviour;