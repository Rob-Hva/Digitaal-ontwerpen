library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity opdracht43 is

	generic (N 	: integer := 8);
	port(clk 				: in 	std_logic;
		  rst_n 				: in 	std_logic;
		  button 			: in 	std_logic;
		  pressed			: out std_logic;
		  pressed_event 	: out std_logic;
		  released_event 	: out std_logic);
		  
end entity opdracht43;

architecture behaviour of opdracht43 is 

	constant read_threshold : integer := 50000; 	-- 1ms/20ns = 50000.

	signal pressed_ff				: std_logic := '1';
	signal pressed_ff_prev 		: std_logic := '1';
	signal pressed_event_ff		: std_logic := '1';
	signal released_event_ff	: std_logic := '1';
	
	signal clk_count	 		: unsigned(16-1 downto 0);										-- 16-bits are needed to store 50000.
	signal sample_pulse		: std_logic := '0';												-- this signal wil be the divided clk.
	signal btn_read		 	: std_logic := '1';												-- used to store read value.
	signal btn_vector		 	: std_logic_vector(N-1 downto 0) := (others => '0');	-- used to store the last few read values.
	
begin

	-- Hier wordt de echte clk gedeeld en een ander signaal gecreëerd. 
	-- Dit nieuwe signaal zou een klokslag moeten hebben van 1ms.
	-- Dit nieuwe signaal wordt vervolgens gebruikt om de button input elke ms te lezen.
	clk_divider : process(clk, rst_n, button) is
	begin
	
		if rst_n = '0' then
			
			clk_count <= (others => '0');
			btn_read <= '1';
			sample_pulse <= '0';
			
		elsif rising_edge(clk) then
		
			if clk_count < read_threshold then
			
				clk_count <= clk_count + 1;
				sample_pulse <= '0';	-- No samples sent yet.
				
			else
			
				btn_read <= button;
				sample_pulse <= '1'; -- New sample!
				clk_count <= (others => '0');
				
			end if;
			
		end if;
		
	end process clk_divider;

	
	
	-- Hier wordt een controle uitgevoerd om te bepalen of de knop wordt ingedrukt.
	-- Hiervoor wordt er een vector gevuld met de 8 meest recente meetwaarden.
	-- Deze vector wordt vervolgens uitgelezen en pas als alle 8 de waardes 0 zijn wordt de btn als ingedrukt beschouwd.
	debounce_check : process (clk, rst_n) is
	begin
		
		if rst_n = '0' then
		
			btn_vector <= (others => '1');
			pressed_ff <= '1';
			pressed_ff_prev <= '1';
			
		elsif rising_edge(clk) then
		
			if sample_pulse = '1' then
				btn_vector <= btn_vector(btn_vector'high-1 downto btn_vector'low) & btn_read;	-- Push the read value into the vector to temporarily store it.
			end if;
			
			if btn_vector = (btn_vector'range => '0') then
				pressed_ff_prev <= pressed_ff;
				pressed_ff <= '0';
			else
				pressed_ff_prev <= pressed_ff;	
				pressed_ff <= '1';
			end if;
		end if;
	end process debounce_check;
	
	
	
	press_release_check : process (clk, rst_n, pressed_ff, pressed_ff_prev) is
	begin 
	
		if rst_n = '0' then
			pressed_event_ff <= '1';
			released_event_ff <= '1';
		elsif rising_edge(clk) then
		
			-- Check if button is being pressed.
			if (pressed_ff = '0') AND (pressed_ff_prev = '1') then
				pressed_event_ff <= '0';
			else 
				pressed_event_ff <= '1';
			end if;
			
			-- Check if button is being released.
			if (pressed_ff = '1') AND (pressed_ff_prev = '0') then
				released_event_ff <= '0';
			else 
				released_event_ff <= '1';
			end if;
			
		end if;
		
	end process press_release_check;
	
	pressed <= pressed_ff;
	pressed_event <= pressed_event_ff;
	released_event <= released_event_ff;
	
end architecture behaviour;