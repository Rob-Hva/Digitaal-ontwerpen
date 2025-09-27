library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht331 is
	port(clk : in std_logic;
		  rst_n : in std_logic;
		  count : out std_logic_vector(3 downto 0));
end entity opdracht331;

architecture behaviour of opdracht331 is

	signal counter_reg : unsigned(3 downto 0);
	
begin

	counter : process(clk, rst_n) is 
	begin
	
		count <= std_logic_vector(counter_reg);
		
		if rst_n = '0' then
			counter_reg <= (others => '0');
		elsif rising_edge(clk) then
			counter_reg <= counter_reg + "0001";
		end if;	
	
	end process counter;
end architecture behaviour;