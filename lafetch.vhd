library ieee;
use ieee.std_logic_1164.all;

entity latch_fetch is
  port(pc_outi : in std_logic_vector(7 downto 0);
		instructioni : in std_logic_vector (15 downto 0);
      clk: in std_logic;
      pc_out : out std_logic_vector(7 downto 0);
		instruction : out std_logic_vector (15 downto 0));
end latch_fetch;      
 
  architecture behavior of latch_fetch is
    begin 
      cntr: process(clk,pctake) is  
      begin    
      if(clk'event and clk='0') then
			pc_out <= pc_outi;
			instruction <= instructioni; 
      end if;
      end process cntr;
      
    end architecture behavior; 
