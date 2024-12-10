library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity entity_name is
    Port (			
);
end entity_name;

architecture Behavioral of entity_name is
begin
    process_name: process( sensitivity list ) begin
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
    end process process_name;
end Behavioral;
