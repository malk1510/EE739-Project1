library ieee;
use ieee.std_logic_1164.all;

entity latch_exec is
  port(
    mem_addr_i, PC_i: in std_logic_vector(7 downto 0);
	 reg_write_i, mem_write_i: in std_logic_vector(15 downto 0);
	 reg_addr_i: in std_logic_vector(2 downto 0);
	 write_back_i, store_i, load_i, clk: in std_logic;
    mem_addr, PC: out std_logic_vector(7 downto 0);
	 reg_write, mem_write: out std_logic_vector(15 downto 0);
	 reg_addr: out std_logic_vector(2 downto 0);
	 write_back, store, load: out std_logic);
	 
end  latch_exec;      
     
  architecture behavior of latch_exec is
    begin
      cntr: process(clk) is  
      begin    
      if(clk'event and clk='0') then
			mem_addr <= mem_addr_i;
			PC <= PC_i;
			reg_write <= reg_write_i;
			mem_write <= mem_write_i;
			reg_addr <= reg_addr_i;
			write_back <= write_back_i;
			store <= store_i;
			load <= load_i;
      end if;
    end process cntr;
    
    end architecture behavior;