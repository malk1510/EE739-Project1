library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity instr_mem is 
  port( pc: in std_logic_vector(7 downto 0);
        instruction: out std_logic_vector(15 downto 0));  
end entity instr_mem;

architecture behavior of instr_mem is
	begin
	seq: process(pc) is
		type array_mem is array(0 to 255) of std_logic_vector(15 downto 0);
		variable ROM: array_mem;
		
		-------Fill the ROM with the 16-bit op-codes of all the instructions------
		
		begin
			instruction <= ROM(pc);
	end process seq;
end architecture behavior;