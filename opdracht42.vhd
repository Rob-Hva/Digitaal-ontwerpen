library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht42 is

	generic (N 	: integer := 4);
	port(clk 	: in 	std_logic;
		  rst_n 	: in 	std_logic;
		  button : in 	std_logic;
		  output : out std_logic_vector(N-1 downto 0));
		  
end entity opdracht42;

architecture behaviour of opdracht42 is

	signal out_state, out_state_nxt : integer range 0 to N-1 := 0;
	signal output_ff : std_logic_vector(N-1 downto 0) := (others => '0');
	signal button_prev, button_prev_prev : std_logic := '1';
	
begin

	state_reg : process(clk, rst_n, button) is
	begin
	
		button_prev <= button;
		button_prev_prev <= button_prev;
	
		if rst_n = '0' then
			out_state <= 0;
		elsif rising_edge(clk) AND button = '0' AND button_prev = '1' then
				
			out_state <= out_state_nxt;
			
		end if;
	end process state_reg;
		
	state_decoder : process(out_state) is
	begin

		if out_state = N-1 then
			out_state_nxt <= 0;
		else
			out_state_nxt <= out_state + 1;
		end if;

	end process state_decoder;
	
	output_decoder : process(clk, out_state) is
	begin
	
		output_ff <= (others => '0');
		
		if button_prev_prev = '1' AND button_prev = '0' then
		
			output_ff(out_state) <= '1';
			
		end if;
		
	end process output_decoder;
		
	output <= output_ff;
		
end architecture behaviour;