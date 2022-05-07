Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_misc.all;

entity alu is
  port(
		in1, in2: in std_logic_vector(15 downto 0);
		o1: out std_logic_vector(15 downto 0);
		op, nand_or_add, zero, carry, zero_check, carry_check, left_shift: in std_logic;
		c_out, z_out, z_upd, c_upd: out std_logic
  );
end alu;


architecture behavior of alu is
  
  component adder_16_bit is
  port(add1, add2: in std_logic_vector(15 downto 0);
  Cin: in std_logic;
  sum: out std_logic_vector(15 downto 0);
  Cout: out std_logic);
  end component adder_16_bit;
  
  signal t1, t2, t3, t4, t5: std_logic_vector(15 downto 0);
  begin
		gen1: for i in 1 to 15 generate
			new_in2(i) <= (not(left_shift) and in2(i)) or (left_shift and in2(i-1));
		end generate gen1;
		new_in2(0) <= not(left_shift) and in2(0);
		
		add1: adder_16_bit port map(in1, new_in2, '0', add_res, carry_add);
		nand_res <= in1 nand new_in2;
		
		gen2: for i in 0 to 15 generate
			o1(i) <= ((not(carry_check) or carry) and (not(zero_check) or zero)) and ((not(nand_or_add) and nand_res(i)) or (nand_or_add and add_res(i)));
			z_temp <= z_temp and not((not(nand_or_add) and nand_res(i)) or (nand_or_add and add_res(i)));
		end generate gen2;
		c_out <= carry_add;
		z_out <= z_temp;
		z_upd <= op and ((not(carry_check) or carry) and (not(zero_check) or zero));
		c_upd <= op and nand_or_add and ((not(carry_check) or carry) and (not(zero_check) or zero));
end architecture behavior;