library ieee;
use ieee.std_logic_1164.all;

entity latch_dec is
  port(
	 clk: in std_logic;
  	 ra_i, rb_i, rc_i, immed_i: in std_logic_vector(15 downto 0);
	 ra_addr_i, rb_addr_i, rc_addr_i, aluop_i: in std_logic_vector(2 downto 0);
	 immed_8_bit_i, PCi: in std_logic_vector(7 downto 0);
	 ra, rb, rc, immed: out std_logic_vector(15 downto 0);
	 ra_addr, rb_addr, rc_addr, aluop: out std_logic_vector(2 downto 0);
	 immed_8_bit, PC: out std_logic_vector(7 downto 0);
	 ten_bit_i: in std_logic_vector(9 downto 0);
	 ten_bit: out std_logic_vector(9 downto 0));
end  latch_dec;      

  architecture behavior of latch_dec is
    begin
      cntr: process(clk,pctake) is  
      begin    
      if(clk'event and clk='0') then
			ra <= ra_i;
			rb <= rb_i;
			rc <= rc_i;
			immed <= immed_i;
			ra_addr <= ra_addr_i;
			rb_addr <= rb_addr_i;
			rc_addr <= rc_addr_i;
			aluop <= aluop_i;
			immed_8_bit <= immed_8_bit_i;
			PC <= PCi;
			ten_bit <= ten_bit_i;
      end if;
    end process cntr;
      
end architecture behavior;