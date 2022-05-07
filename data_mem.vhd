library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity data_mem is
  port(addr_in, data_in: in std_logic_vector(15 downto 0);
		store, clk, store_regs, load_regs: in std_logic;
		data_out: out std_logic_vector(15 downto 0);
		control_bits: in std_logic_vector(7 downto 0);
		reglist_load: out array(7 downto 0) of std_logic_vector(15 downto 0);
		reglist_store: in array(7 downto 0) of std_logic_vector(15 downto 0)
			);
  end entity data_mem;

  
  architecture behavior of data_mem is			 
      type DMEM_array is array(65535 downto 0) of std_logic_vector(15 downto 0);
      signal data_arr : DMEM_array := (others => x"0000");
		data_out <= data_arr(to_integer(unsigned(addr_in)));
		begin
		PROC1: process(clk)
      begin     --Process begins here
		variable counter: INTEGER := to_integer(unsigned(addr_in)); 
			if(rising_edge(clk)) then
				if(store = '1') then
					data_arr(to_integer(unsigned(addr_in))) <= data_in;
				elsif(store_regs = '1') then
					for i in (0 to 7)
						if(control_bits(i) = '1') then
							data_arr(counter) <= reglist_store(i);
							counter := counter+1;
						end if;
					end for;
					counter := 0;
				elsif(load_regs = '1') then
					for i in (0 to 7)
						if(control_bits(i) = '1') then
							reglist_load(counter) <= data_arr(counter);
							counter := counter+1;
						end if;
					end for;
					counter := 0;
				end if;
			end if;		
    end process PROC1; --Process ends here                            
end architecture behavior;     --architecture ends here 