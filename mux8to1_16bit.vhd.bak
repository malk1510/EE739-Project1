library ieee;
use ieee.std_logic_1164.all;

  entity mux8to1_16bit is
  port(i1,i2,i3,i4,i5,i6,i7,i8: in std_logic_vector(15 downto 0);
  sel: in std_logic_vector(2 downto 0);
  o: out std_logic_vector(15 downto 0));
  end entity;

architecture behavior of mux8to1_16bit is
	begin
		P1: process(i1,i2,i3,i4,i5,i6,i7,i8,sel) is
			case sel is
				when "000" =>
					o <= i1;
				when "001" =>
					o <= i2;
				when "010" =>
					o <= i3;
				when "011" =>
					o <= i4;
				when "100" =>
					o <= i5;
				when "101" =>
					o <= i6;
				when "110" =>
					o <= i7;
				when others =>
					o <= i8;
			end case;
		end process;
end architecture behavior;