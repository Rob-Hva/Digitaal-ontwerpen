library ieee;
use ieee.std_logic_1164.all;

entity opdracht321 is
	port(D : in std_logic;
		  rst_n : in std_logic;
		  clk : in std_logic;
		  Q : out std_logic);
end entity opdracht321;

architecture behaviour of opdracht321 is

begin

	dflipflop : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			Q <= '0';
		elsif rising_edge(clk) then
			Q <= D;
		end if;
		
	end process dflipflop;
end architecture behaviour;