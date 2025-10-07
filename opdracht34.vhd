library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht34 is
	generic (N : integer := 8);
	
	port(clk : in std_logic;
		  rst_n : in std_logic;
		  a : in std_logic_vector(N-1 downto 0);
		  b : in std_logic_vector(N-1 downto 0);
		  z : out std_logic_vector(N-1 downto 0));
		  
end entity opdracht34;

architecture behaviour of opdracht34 is

	signal a_reg : std_logic_vector(N-1 downto 0);
	signal b_reg : std_logic_vector(N-1 downto 0);
	signal z_reg : std_logic_vector(N-1 downto 0);
	
begin

	a_register : process(clk) is
	begin
		if rst_n = '0' then
			a_reg <= (others => '0');
		elsif rising_edge(clk) then
			a_reg <= a;
		end if;
	end process a_register;

	b_register : process(clk) is
	begin
		if rst_n = '0' then
			b_reg <= (others => '0');
		elsif rising_edge(clk) then
			b_reg <= b;
		end if;
	end process b_register;
	
	z_register : process(clk) is
	begin
		if rst_n = '0' then
			z_reg <= (others => '0');
		elsif rising_edge(clk) then
			z_reg <= std_logic_vector( signed(a_reg) - signed(b_reg));
		end if;
	end process z_register;
	
	z <= z_reg;
	
end architecture behaviour;