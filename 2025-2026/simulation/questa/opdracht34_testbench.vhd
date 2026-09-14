library ieee;
use ieee.std_logic_1164.all;

entity opdracht34_testbench is
end entity opdracht34_testbench;

architecture testbench of opdracht34_testbench is
	component opdracht34 is
		generic (N : integer);
		port(clk : in std_logic;
		     rst_n : in std_logic;
		     a : in std_logic_vector(N-1 downto 0);
		     b : in std_logic_vector(N-1 downto 0);
		     z : out std_logic_vector(N-1 downto 0));
	end component;

	constant T : integer := 16;
	constant CLOCK_PERIOD : time := 20 ns;

	signal clk : std_logic := '0';
	signal rst_n : std_logic := '1';
	signal a : std_logic_vector(T-1 downto 0) := (others => '0');
	signal b : std_logic_vector(T-1 downto 0) := (others => '0');
	signal z : std_logic_vector(T-1 downto 0) := (others => '0');

begin

	DUT : opdracht34
		generic map(N => T)
		port map(clk => clk,
	 		 rst_n => rst_n,
			 a => a,
			 b => b,
			 z => z);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		a <= X"0000"; -- 0
		b <= X"0000"; -- 0
		rst_n <= '0';

		wait for 0.25 * CLOCK_PERIOD;

		rst_n <= '1';
		wait for 0.25 * CLOCK_PERIOD;

		a <= X"000A"; -- 10
		b <= X"0008"; -- 8

		wait for CLOCK_PERIOD;

		a <= X"0064"; -- 100
		b <= X"0014"; -- 20
		
		wait for CLOCK_PERIOD;
		
		a <= X"0028"; -- 40
		b <= X"0032"; -- 50
		wait;
	end process stimuli;
end architecture testbench;