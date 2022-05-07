library ieee;
use ieee.std_logic_1164.all;

entity latch_mem is
	port(load_i, write_back_i: in std_logic;
		reg_addr_i: in std_logic_vector(2 downto 0);
		reg_write_i, mem_write_i: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		load, write_back: out std_logic;
		reg_addr: out std_logic_vector(2 downto 0);
		reg_write, mem_write: out std_logic_vector(15 downto 0));
end latch_mem;

architecture behavior of latch_mem is
	begin
	cntr: process(clk)
	begin
		if(clk'event and clk='0') then
			load <= load_i;
			write_back <= write_back_i;
			reg_addr <= reg_addr_i;
			reg_write <= reg_write_i;
			mem_write <= mem_write_i;
		end if;
	end process cntr;
end behavior;