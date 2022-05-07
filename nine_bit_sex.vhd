Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_misc.all;

entity alu is
  port(
		immed_9: in std_logic_vector(8 downto 0);
		out_9: out std_logic_vector(15 downto 0);
  );
end alu;

architecture behavior of alu is
	begin
		out_9 <= "0000000" & immed_9;
end architecture behavior;