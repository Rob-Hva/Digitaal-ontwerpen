library ieee;
use ieee.std_logic_1164.all;

entity opdracht41_testbench is
end entity opdracht41_testbench;

architecture testbench of opdracht41_testbench is
	component opdracht41 is
		port(clk : in std_logic;
		     rst_n : in std_logic;
		     button : in std_logic;
		     sw : out std_logic);
	end component;

	constant T : integer := 16;
	constant CLOCK_PERIOD : time := 20 ns;

	signal clk : std_logic := '0';
	signal rst_n : std_logic := '1';
	signal button : std_logic := '1';
	signal sw : std_logic := '0';

begin

	DUT : opdracht41
		port map(clk => clk,
	 		 rst_n => rst_n,
			 button => button,
			 sw => sw);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		rst_n <= '0';

		wait for 0.25 * CLOCK_PERIOD;

		rst_n <= '1';

		wait for 0.25 * CLOCK_PERIOD;

		button <= '0';

		wait for 8.5 * CLOCK_PERIOD;

		button <= '1';

		wait for 11 * CLOCK_PERIOD;

		button <= '0';

		wait for 8.5 * CLOCK_PERIOD;

		button <= '1';

		wait;
	end process stimuli;
end architecture testbench;