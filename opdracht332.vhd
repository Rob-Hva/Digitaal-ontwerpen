library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht332 is
	port(clk : in std_logic;
		rst_n : in std_logic;
			q0 : out std_logic;
			q1 : out std_logic;
			q2 : out std_logic;
			q3 : out std_logic);
end entity opdracht332;

architecture behaviour of opdracht332 is

	signal q0_ff : std_logic := '0';
	signal q1_ff : std_logic := '0';
	signal q2_ff : std_logic := '0';
	signal q3_ff : std_logic := '0';
	
begin

	dflipflopq0 : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			q0_ff <= '0';

		elsif rising_edge(clk) then
			q0_ff <= not q0_ff;
		end if;
		
	end process dflipflopq0;
	
	dflipflopq1 : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			q1_ff <= '0';

		elsif rising_edge(clk) then
			if q0_ff = '1' then
				q1_ff <= not q1_ff;
			end if;
		end if;
		
	end process dflipflopq1;
	
	dflipflopq2 : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			q2_ff <= '0';

		elsif rising_edge(clk) then
			if q0_ff = '1' AND q1_ff = '1' then
				q2_ff <= not q2_ff;
			end if;
		end if;
		
	end process dflipflopq2;
	
	dflipflopq3 : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			q3_ff <= '0';

		elsif rising_edge(clk) then
			if q0_ff = '1' AND q1_ff = '1' AND q2_ff = '1' then
				q3_ff <= not q3_ff;
			end if;
		end if;
		
	end process dflipflopq3;
	
	q0 <= q0_ff;
	q1 <= q1_ff;
	q2 <= q2_ff;
	q3 <= q3_ff;

end architecture behaviour;