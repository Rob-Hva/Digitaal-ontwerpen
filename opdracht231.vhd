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