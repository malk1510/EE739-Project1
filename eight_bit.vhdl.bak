library ieee;
use ieee.std_logic_1164.all;

entity adder_8_bit is
	port(add1, add2: in std_logic_vector(7 downto 0);
	Cin: in std_logic;
	sum: out std_logic_vector(7 downto 0));
end entity;

architecture behavior of adder_8_bit is
	signal sum_temp: std_logic_vector(7 downto 0);
	signal carry_temp: std_logic_vector(8 downto 0);

	component full_adder is
		port(in1, in2, Cin: in std_logic;
		o, Cout: out std_logic);
	end component full_adder;

	begin
		carry_temp(0) <= Cin;
		GEN: for i in (0 to 7) generate
			CHIP1: full_adder port map(add1(i), add2(i), carry_temp(i), sum_temp(i), carry_temp(i+1));
		end generate;
end architecture behavior;