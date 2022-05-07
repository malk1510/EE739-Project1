Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_misc.all;

entity alu is
  port(
	 ra, rb, rc, immed: in std_logic_vector(15 downto 0);
	 ra_addr, rb_addr, rc_addr, aluop: in std_logic_vector(2 downto 0);
	 immed_8_bit, PCi: in std_logic_vector(7 downto 0);
	 mem_addr, PC, jump_addr: out std_logic_vector(7 downto 0);
	 reg_write, mem_write: out std_logic_vector(15 downto 0);
	 reg_addr: out std_logic_vector(2 downto 0);
	 write_back, store, load, jump: out std_logic;
	 ten_bit: in std_logic_vector(9 downto 0)
  );
end alu;


architecture behavior of alu is
  
  component adder_8_bit is
  port(add1, add2: in std_logic_vector(7 downto 0);
  Cin: in std_logic;
  sum: out std_logic_vector(7 downto 0));
  end component adder_8_bit;
  
  component adder_16_bit is
  port(add1, add2: in std_logic_vector(15 downto 0);
  Cin: in std_logic;
  sum: out std_logic_vector(15 downto 0));
  end component adder_16_bit;
  
  component mux2to1_8bit is
  port(i1,i2: in std_logic_vector(7 downto 0);
  sel: in std_logic;
  o: out std_logic_vector(7 downto 0));
  end component mux2to1_8bit;
  
  component mux8to1_16bit is
  port(i1,i2,i3,i4,i5,i6,i7,i8: in std_logic_vector(15 downto 0);
  sel: in std_logic_vector(2 downto 0);
  o: out std_logic_vector(15 downto 0));
  end component mux8to1_16bit;
  
  signal t1, t2, t3, t4, t5: std_logic_vector(15 downto 0);
  signal pc1, pc2: std_logic_vector(7 downto 0);
  begin
		add1: adder_16_bit port map(rc, rb, '0', t1);
		add2: adder_16_bit port map(rb, immed, '0', t2);
		t3 <= rb nand rc;
		add3: adder_8_bit port map(rb(7 downto 0), immed_8_bit, '0', mem_addr);
		t4 <= ((15 => ten_bit(9), 14 => ten_bit(8), 13 => ten_bit(7), 12 => ten_bit(6), 11 => ten_bit(5), 10 => ten_bit(4), 9 => ten_bit(3), 8 => ten_bit(2), 7 => ten_bit(1), 6 => ten_bit(0)) & ra(5 downto 0));
		add4: adder_8_bit port map(PCi, immed_8_bit, '1', pc1);
		add5: adder_8_bit port map(PCi, "00000000", '1', t5);
		pc2 <= rb(7 downto 0);
		
		write_back <= not(aluop(2)) or (aluop(0) and aluop(1));
		store <= aluop(0) and aluop(2) and not(aluop(1));
		load <= aluop(2) and not(aluop(0) or aluop(1));
		jump <= (not(and_reduce(ra xor rb)) or aluop(0)) and (aluop(1) and aluop(2));
		
		PC <= t5;
		mux1: mux2to1_8bit port map(pc1, pc2, aluop(0), jump_addr);
		reg_addr <= ra_addr;
		mux2: mux8to1_16bit port map(t1,t2,t3,t4,"00000000","00000000","00000000",t5,aluop,reg_write);
		mem_write <= ra;
		
end architecture behavior;