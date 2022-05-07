library ieee;
Use ieee.std_logic_1164.all;

entity decoder is
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
     end decoder;

	
architecture behavior of decoder is

  signal sign: std_logic := '0';
begin
  process(clk,instruction) is
      begin
      if(clk'event and clk='1') then
		
		aluop <= instruction(15 downto 13);
		case instruction(15 downto 13) is
       when  "000" =>          
         rrr <= '1'; rri <= '0'; ri <= '0';
         ra <= instruction(12 downto 10);
			rb <= instruction(9 downto 7);
			rc <= instruction(2 downto 0);
			
       when "001" =>
			rrr <= '0'; rri <= '1'; ri <= '0';
			ra <= instruction(12 downto 10);
			rb <= instruction(9 downto 7);
			sign <= instruction(6);
			immed <= (15 downto 6 => sign & instruction(5 downto 0));
          
        when "011" =>
          rrr <= '0'; rri <= '0'; ri <= '1';
			 ra <= instruction(12 downto 10);
			 ten_bit <= instruction(9 downto 0);
          
        when "010" =>
			 rrr <= '1'; rri <= '0'; ri <= '0';
			 ra <= instruction(12 downto 10);
			 rb <= instruction(9 downto 7);
			 rc <= instruction(2 downto 0);
          
        when "100" =>
			 rrr <= '0'; rri <= '1'; ri <= '0';
			 ra <= instruction(12 downto 10);
			 rb <= instruction(9 downto 7);
			sign <= instruction(6);
			immed_8_bit <= (7 downto 6 => sign & instruction(5 downto 0));
          
        when "101" =>
			 rrr <= '0'; rri <= '1'; ri <= '0';
			 ra <= instruction(12 downto 10);
			 rb <= instruction(9 downto 7);
			sign <= instruction(6);
			immed_8_bit <= (7 downto 6 => sign & instruction(5 downto 0));
			 
			when "110" =>
			 rrr <= '0'; rri <= '1'; ri <= '0';
			 ra <= instruction(12 downto 10);
			 rb <= instruction(9 downto 7);
			sign <= instruction(6);
			immed_8_bit <= (7 downto 6 => sign & instruction(5 downto 0));
			 PC <= PCi;
			 
        when others =>
			 rrr <= '0'; rri <= '1'; ri <= '0';
			 ra <= instruction(12 downto 10);
			 rb <= instruction(9 downto 7);
			 PC <= PCi;
          
      end case;
		end if;
    end process;
    
  end architecture behavior;   --architecture body ends here
