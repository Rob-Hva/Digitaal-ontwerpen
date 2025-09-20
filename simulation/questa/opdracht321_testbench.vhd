library ieee;
use ieee.std_logic_1164.all;

entity opdracht321_testbench is
end entity opdracht321_testbench;

architecture testbench of opdracht321_testbench is
	component opdracht321 is
		port(clk, rst_n, d : in std_logic;
		q : out std_logic);
	end component;

	for DUT : opdracht321 use entity work.opdracht321(behaviour);

	signal clk : std_logic := '1';
	signal rst_n, d, q : std_logic;
 
	constant CLOCK_PERIOD : time := 20 ns;
begin
	DUT : opdracht321 port map(clk => clk, rst_n => rst_n,
				   d => d, q => q);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		-- Initiële waarden van de inputs
		rst_n <= '1';
		d <= '0';
		wait for CLOCK_PERIOD;
		
		d <= '1';
		wait for CLOCK_PERIOD * 2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD *2;

		d <= '0';
		wait for CLOCK_PERIOD;

		d <= '1';
		wait for CLOCK_PERIOD/2;
		
		d <= '0';
		wait;	
		wait;
	end process stimuli;	
end architecture testbench;