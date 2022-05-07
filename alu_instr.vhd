Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_misc.all;

entity alu_instr is
  port(
		in1, in2: in std_logic_vector(15 downto 0);
		o1: out std_logic_vector(15 downto 0);
		nand_or_add, zero, carry, zero_check, carry_check, left_shift: in std_logic;
		c_out, z_out: out std_logic
  );
end alu_instr;

