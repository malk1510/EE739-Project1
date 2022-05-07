library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8bit is
	port(i1,i2: in std_logic_vector(7 downto 0);
	sel: in std_logic;
	o: out std_logic_vector(7 downto 0));
end entity;

architecture behavior of mux2to1_8bit is
	begin
		GEN: for i in 0 to 7 generate
			o(i) <= (not(sel) and i1(i)) or (sel and i2(i));
		end generate GEN;
end architecture behavior;	