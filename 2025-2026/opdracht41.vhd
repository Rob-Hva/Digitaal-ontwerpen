library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht41 is

	port(clk : in std_logic;
		  rst_n : in std_logic;
		  button : in std_logic;
		  sw : out std_logic);
		  
end entity opdracht41;

architecture behaviour of opdracht41 is

	signal switch_ff : std_logic := '0';
	signal previous_state : std_logic := '0';
	
begin

	sw_proc : process(clk, rst_n) is
	begin
	
		if rst_n = '0' then
			switch_ff <= '0';
			previous_state	<= '0';
		elsif rising_edge(clk) then
		
			previous_state <= button;
				
			if button = '0' AND previous_state = '1' then
				-- button pressed! toggle switch
				switch_ff <= NOT switch_ff;
			end if;
			
		end if;
		end process sw_proc;
		
		sw <= switch_ff;
		
end architecture behaviour;