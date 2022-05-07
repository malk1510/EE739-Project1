library ieee;
Use ieee.std_logic_1164.all;

entity decoder is
  port(clk: in std_logic;
       instruction: in std_logic_vector(15 downto 0);
		 ra, rb, rc: out std_logic_vector(3 downto 0);
		 immed_6: out std_logic_vector(5 downto 0);
		 immed_9: out std_logic_vector(8 downto 0);
		 op, nand_or_add, carry_check, zero_check, left_shift, nine_sex_sel, six_bit_sel, nine_bit_sel, load_cond, store_cond, load_cont, store_cont, equal: out std_logic;
		 wb_sel : out std_logic_vector(1 downto 0)
		 );
     end decoder;

	
architecture behavior of decoder is
	begin
		PROC1: process(clk)
		begin
			if(rising_edge(clk)) then
				case instruction(15 downto 12) is
					when "0000" =>
						ra <= instruction(11 downto 9);
						rc <= instruction(8 downto 6);
						immed_6 <= instruction(5 downto 0);
						six_bit_sel <= '1';
						rc_wb <= '1';
						wb_sel <= "00";
					when "0001" =>
						ra <= instruction(11 downto 9);
						rb <= instruction(8 downto 6);
						rc <= instruction(5 downto 3);
						op <= '1';
						nand_or_add <= '1';
						rc_wb <= '1';
						wb_sel <= "00";
						case instruction(1 downto 0) is
							when "00" =>
								carry_check <= '0';
								zero_check <= '0';
								left_shift <= '0';
							when "01" =>
								carry_check <= '1';
								zero_check <= '0';
								left_shift <= '0';
							when "10" =>
								carry_check <= '0';
								zero_check <= '1';
								left_shift <= '0';
							when others =>
								carry_check <= '0';
								zero_check <= '0';
								left_shift <= '1';
						end case;
					when "0010" =>
						ra <= instruction(11 downto 9);
						rb <= instruction(8 downto 6);
						rc <= instruction(5 downto 3);
						op <= '1';
						rc_wb <= '1';
						wb_sel <= "00";
						nand_or_add <= '0';
						case instruction(1 downto 0) is
							when "01" =>
								carry_check <= '1';
								zero_check <= '0';
								left_shift <= '0';
							when "10" =>
								carry_check <= '0';
								zero_check <= '1';
								left_shift <= '0';
							when others =>
								carry_check <= '0';
								zero_check <= '0';
								left_shift <= '0';
						end case;
					when "0011" =>
						rc <= instruction(11 downto 9);
						immed_9 <= instruction(8 downto 0);
						rc_wb <= '1';
						wb_sel <= "11";
					when "0100" =>
						ra <= instruction(8 downto 6);
						rc <= instruction(11 downto 9);
						immed_6 <= instruction(5 downto 0);
						six_bit_sel <= '1';
						load_cond <= '1';
					when "0101" =>
						ra <= instruction(8 downto 6);
						rc <= instruction(11 downto 9);
						immed_6 <= instruction(5 downto 0);
						six_bit_sel <= '1';
						store_cond <= '1';
					when "1100" =>
						ra <= instruction(11 downto 9);
						control_bits <= instruction(7 downto 0);
						load_cont <= '1';
					when "1101" =>
						ra <= instruction(11 downto 9);
						control_bits <= instruction(7 downto 0);
						store_cont <= '1';
					when "1110" =>
						ra <= instruction(11 downto 9);
						control_bits <= "11111111";
						load_cont <= '1';
					when "1111" =>
						ra <= instruction(11 downto 9);
						control_bits <= "11111111";
						store_cont <= '1';
					when "1000" =>
						eq_in_1 <= instruction(11 downto 9);
						eq_in_2 <= instruction(8 downto 6);
						ra <= "111";
						immed_6 <= instruction(5 downto 0);
						branch_sel <= "01";
						six_bit_sel <= '1';
						equal <= '1';
					when "1001" =>
						ra <= "111";
						immed_9 <= instruction(8 downto 0);
						nine_bit_sel <= '1';
						rc <= instruction(11 downto 9);
						branch_sel <= "01";
					when "1010" =>
						rc <= instruction(11 downto 9);
						rb <= instruction(8 downto 6);
						branch_sel <= "10";
					when others =>
						ra <= instruction(11 downto 9);
						immed_9 <= instruction(8 downto 0);
						nine_bit_sel <= '1';
						branch_sel <= "01";
				end case;
			end if;
		end process;
    
  end architecture behavior;   --architecture body ends here
