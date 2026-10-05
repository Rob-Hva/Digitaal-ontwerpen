-------------------------------------------------------------------------------
-- Title      : opdracht232
-- Project    : Short description here
-------------------------------------------------------------------------------
-- File       : opdracht232.vhd
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

entity Nbit_register is

	generic (N 	: integer := 8);
	port(	clk 	: in 	std_logic;
				D 		: in 	std_logic_vector(N-1 downto 0);
				Q 		: out std_logic_vector(N-1 downto 0));
				
end entity Nbit_register;

architecture behaviour of Nbit_register is

	signal Q_ff	:	std_logic_vector(N-1 downto 0);

begin

	Nbit_reg : process(clk) is
	begin
	
		if rising_edge(clk) then
			Q_ff <= D;
		end if;
	end process Nbit_reg;
	
	Q <= Q_ff;
end architecture behaviour;