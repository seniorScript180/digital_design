library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_encode is
    Port (
			-- Choose left or right
			digit_selection_in: in std_logic;
			-- BCD 4 bits
			bcd : in std_logic_vector(3 downto 0);
			-- Converted 7 bits
			seven_segment : out std_logic_vector(6 downto 0);
			-- JB4 Cat Pin
			digit_selection_out : out std_logic
);
end bcd_encode;

architecture Behavioral of bcd_encode is

begin

	digit_selection_out <= digit_selection_in;

	bcd_values: process(bcd) begin
	
		case bcd is
		    when "0000" => seven_segment <= "0111111";
		    when "0001" => seven_segment <= "0000110";
		    when "0010" => seven_segment <= "1011011";
		    when "0011" => seven_segment <= "1001111";
		    when "0100" => seven_segment <= "1100110";
		    when "0101" => seven_segment <= "1101101";
		    when "0110" => seven_segment <= "1111101";
		    when "0111" => seven_segment <= "0000111";
		    when "1000" => seven_segment <= "1111111";
		    when "1001" => seven_segment <= "1101111";
		    when others => seven_segment <= "0000000";
		end case;
	
	end process bcd_values;

end Behavioral;
