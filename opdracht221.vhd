library ieee;
use ieee.std_logic_1164.all;

entity opdracht221 is
port(a : in std_logic;
	  b : in std_logic;
	  ci : in std_logic;
	  sum : out std_logic;
	  co : out std_logic);
end entity opdracht221;

architecture behaviour of opdracht221 is

signal A_XOR_B : std_logic;
signal A_XOR_B_AND_CI : std_logic;
signal A_AND_B : std_logic;

begin

	fulladder : process (a,b,ci) is
	variable v : std_logic_vector(2 downto 0);
	begin
	
		v := a & b & ci;
			
		case v is
			when "000" =>
				sum <= '0'; 
				co <= '0';
			when "001" =>
				sum <= '1'; 
				co <= '0';
			when "010" =>
				sum <= '1'; 
				co <= '0';
			when "011" =>
				sum <= '0'; 
				co <= '1';
			when "100" =>
				sum <= '1'; 
				co <= '0';
			when "101" =>
				sum <= '0'; 
				co <= '1';
			when "110" =>
				sum <= '0'; 
				co <= '1';
			when "111" =>
				sum <= '1'; 
				co <= '1';
			when others =>
				sum <= 'U'; 
				co <= 'U';
		end case;
		
	end process fulladder;
	
end architecture behaviour;