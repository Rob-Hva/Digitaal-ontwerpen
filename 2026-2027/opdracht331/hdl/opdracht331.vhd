-------------------------------------------------------------------------------
-- Title      : opdracht331
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht331.vhd
-- Author     : Aabee Ceedee  <a.b.ceedee@hva.nl>
-- Created    : 2026-09-04
-- Last update: 2026-09-04
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Larger description here.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author      Description
-- 2026-03-13  1.0      abeeceedee  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity opdracht331 is
	port(clk : in std_logic;
		  rst_n : in std_logic;
		  count : out std_logic_vector(3 downto 0));
end entity opdracht331;

architecture behaviour of opdracht331 is

	signal counter_reg : unsigned(3 downto 0);
	constant COUNTER_MAX : integer := 15;

begin

	count <= std_logic_vector(counter_reg);

	counter : process(clk, rst_n) is 
	begin
		
		if rst_n = '0' then
			counter_reg <= (others => '0');
    elsif counter_reg = COUNTER_MAX then
      counter_reg <= "0000";
		elsif rising_edge(clk) then
			counter_reg <= counter_reg + "0001";
		end if;	
	
	end process counter;
end architecture behaviour;