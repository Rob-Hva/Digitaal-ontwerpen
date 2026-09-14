library ieee;
use ieee.std_logic_1164.all;

entity opdracht42_testbench is
end entity opdracht42_testbench;

architecture testbench of opdracht42_testbench is
	component opdracht42 is

		generic (N : integer := 4);
		port(clk : in std_logic;
		     rst_n : in std_logic;
		     button : in std_logic;
		     output : out std_logic_vector(N-1 downto 0));
	end component;
	
	constant N : integer := 4; 
	constant CLOCK_PERIOD : time := 20 ns;

	type out_state_type is range 0 to N-1;
	signal out_state, out_state_nxt : integer range 0 to N-1 := 0;

	signal clk 	: std_logic := '1';
	signal rst_n 	: std_logic := '1';
	
	signal button 	: std_logic := '1';
	signal output 	: std_logic_vector(N-1 downto 0);

begin

	DUT : opdracht42

		generic map(N => N)
		port map(clk => clk,
	 		 rst_n => rst_n,
			 button => button,
			 output => output);

	clk <= not clk after 0.5 * CLOCK_PERIOD;
	button <= not button after 5 * CLOCK_PERIOD;

	stimuli: process
	begin
		rst_n <= '0';

		wait for 0.25 * CLOCK_PERIOD;

		rst_n <= '1';

		wait;
	end process stimuli;
end architecture testbench;