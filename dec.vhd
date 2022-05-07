library ieee;
use ieee.std_logic_1164.all;

entity dec is
	port(clk, wr: in std_logic;
		instruction, wrb: in std_logic_vector(15 downto 0);
		PCi: in std_logic_vector(7 downto 0);
		wb_index: in std_logic_vector(2 downto 0);
		ra_addr, rb_addr, rc_addr, aluop: out std_logic_vector(2 downto 0);
		ra, rb, rc, immed: out std_logic_vector(15 downto 0);
		immed_8_bit, PC: out std_logic_vector(7 downto 0);
		ten_bit: out std_logic_vector(9 downto 0));
end entity dec;

architecture behavior of dec is
	signal ra_temp, rb_temp, rc_temp: std_logic_vector(2 downto 0);
	signal r1, r2, r3: std_logic;
	
	component reg_file is 
  port(
		rai, rbi, rci: in std_logic_vector(2 downto 0);
		ra_addr,rb_addr,rc_addr:out std_logic_vector(2 downto 0);
		wb_index: in std_logic_vector(2 downto 0);
		ra, rb, rc: out std_logic_vector(15 downto 0);
		wr,clk: in std_logic;
		wrb:in std_logic_vector(15 downto 0)
    );
 end component reg_file; 
 
 component decoder is
  port(clk: in std_logic;
       instruction: in std_logic_vector(15 downto 0);
       PCi: in std_logic_vector(7 downto 0);
		 immed: out std_logic_vector(15 downto 0);
		 immed_8_bit: out std_logic_vector(7 downto 0);
       ra,rb,rc : out std_logic_vector(2 downto 0);
       PC : out std_logic_vector(7 downto 0);
       ten_bit: out std_logic_vector(9 downto 0);
       aluop: out std_logic_vector(2 downto 0);       
       rrr, rri, ri: out std_logic); 
     end component decoder;
	
	begin
	CHIP1: decoder port map(clk, instruction, PCi, immed, immed_8_bit, ra_temp, rb_temp, rc_temp, PC, ten_bit, aluop, r1, r2, r3);
	CHIP2: reg_file port map(ra_temp, rb_temp, rc_temp, ra_addr, rb_addr, rc_addr, aluop, wb_index, ra, rb, rc, wr, clk, wrb);
end architecture behavior;
		