library ieee;
use ieee.std_logic_1164.all;

entity opdracht232 is
	port(D : in std_logic_vector(7 downto 0);
		  clk : in std_logic;
		  Q : out std_logic_vector(7 downto 0));
end entity opdracht232;

architecture behaviour of opdracht232 is

begin

	nBitRegister : process(clk) is
	begin
		if rising_edge(clk) then
			Q <= D;
		end if;
	end process nBitRegister;

end architecture behaviour;