library ieee;
Use ieee.std_logic_1164.all;

entity program_counter is
	port(clk, jump: in std_logic;
		jump_addr: in std_logic_vector(7 downto 0);
		clk_out: out std_logic;
		PC_out: out std_logic_vector(7 downto 0));
end program_counter;

architecture counter of program_counter is

signal PC_temp1: std_logic_vector(7 downto 0);
signal PC_temp2: std_logic_vector(7 downto 0);
signal PC_temp3: std_logic_vector(7 downto 0) := x"00";

component mux2to1_8bit is
	port(in1, in2: in std_logic_vector(7 downto 0);
		sel: in std_logic;
		o: out std_logic_vector(7 downto 0));
end component mux2to1_8bit;

component adder_8_bit is
  port(add1, add2: in std_logic_vector(7 downto 0);
	Cin: in std_logic;
	sum: out std_logic_vector(7 downto 0));
end component adder_8_bit;

begin   
	mux: mux2to1_8bit port map(PC_temp3, jump_addr, jump, PC_temp1);
	add: adder_8_bit port map(PC_temp2, x"00", '1', PC_temp3);
	
proc: process(clk, jump)
begin 

if (clk'event and clk='1') then
	 PC_temp2 <= PC_temp1;
    PC_out <= PC_temp3;
    end if;
  clk_out <= clk;
 end process proc;
end counter;