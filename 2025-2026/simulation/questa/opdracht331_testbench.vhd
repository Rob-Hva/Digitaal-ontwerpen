library ieee;
use ieee.std_logic_1164.all;

entity opdracht331_testbench is
end entity opdracht331_testbench;

architecture testbench of opdracht331_testbench is
	component opdracht331 is
		port(clk   : in std_logic; 
		     rst_n : in std_logic;
		     count : out std_logic_vector(3 downto 0));
	end component;

		for DUT : opdracht331 use entity work.opdracht331(behaviour);

		signal clk : std_logic := '0';
		signal rst_n : std_logic;
		signal count : std_logic_vector(3 downto 0);

		constant CLOCK_PERIOD : time := 20 ns;

begin
		DUT : opdracht331 port map(clk => clk, 
					   rst_n => rst_n,
					   count => count);

		clk <= not clk after 0.5 * CLOCK_PERIOD;

		stimuli: process
		begin
			rst_n <= '0';
			wait for 30 ns;
			rst_n <= '1';
			wait;
		end process stimuli;
end architecture testbench;