library ieee;
use ieee.std_logic_1164.all;

entity opdracht332_testbench is
end entity opdracht332_testbench;

architecture testbench of opdracht332_testbench is
	component opdracht332 is
		port(clk   : in std_logic; 
		     rst_n : in std_logic;
		     q0 : out std_logic;
		     q1 : out std_logic;
		     q2 : out std_logic;
		     q3 : out std_logic);
	end component;

		for DUT : opdracht332 use entity work.opdracht332(behaviour);

		signal clk : std_logic := '0';
		signal rst_n : std_logic;
		signal q0 : std_logic := '0';
		signal q1 : std_logic := '0';
		signal q2 : std_logic := '0';
		signal q3 : std_logic := '0';

		constant CLOCK_PERIOD : time := 20 ns;

begin
		DUT : opdracht332 port map(clk => clk, 
					   rst_n => rst_n,
					   q0 => q0,
					   q1 => q1,
					   q2 => q2,
					   q3 => q3);

		clk <= not clk after 0.5 * CLOCK_PERIOD;

		stimuli: process
		begin
			rst_n <= '0';
			wait for 30 ns;
			rst_n <= '1';
			wait;
		end process stimuli;
end architecture testbench;