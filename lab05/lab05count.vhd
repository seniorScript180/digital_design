library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Counter is
port (
  clk                   : in std_logic;
  reset                 : in std_logic;
  direction             : in std_logic;
  load			        : in std_logic;
  load_data             : in std_logic_vector(3 down to 0);
  digit_selection_in    : in std_logic;                     -- Digit Selection IN Pin for PmodSSD
  led_result            : out std_logic_vector(3 downto 0); -- LED Result input
  seven_segment         : out std_logic_vector(6 downto 0); -- 7-segment output MSBit is g, LSBit is a
  digit_selection_out   : out std_logic                     -- Digit Selection OUT Pin for PmodSSD
);
end entity Counter;

architecture Behavioral of Counter is
signal clk_100MHz  : std_logic;                             --NEW CLOCK. Ticks every sec  --OK
signal counts      : unsigned(3 downto 0);                      --Running timer value
signal next_counts : unsigned(3 downto 0);                      --Running timer value
begin
-- Create NEW CLOCK that ticks every 1 sec;
One_sec_clk : process (clk, reset) is
variable clk_ticks : integer;
begin
  if reset = '1' then
    clk_100MHz<='0';
    clk_ticks :=0;   
  elsif rising_edge(clk) then
    if clk_ticks = 99999999 then
		  clk_ticks := 0;
		  clk_100MHz 	<= '1';
    else
		  clk_ticks := clk_ticks + 1;
		  clk_100MHz <= '0';
		end if; -- clk_ticks
	end if; --reset
end process One_sec_clk;
	
-- Combinational
next_counts<= counts+1 when (direction='1' and counts<9) else 
              counts-1 when (direction='0' and counts>0) else 
              "1001" when (direction='0' and counts<=0) else
              "0000" when (direction='1' and counts>=9) else
              (others=>'0');

-- Register
count: process (clk_100MHz, reset) is
begin
  if (reset='1') then
    counts<=(others=>'0');
  elsif rising_edge(clk_100MHz) then
    counts<=next_counts;
  end if; --reset
end process count;

---- *************************
---- COMBINATIONAL FOR OUTPUT
---- *************************
--LED Output
led_result<=std_logic_vector(counts);      
----PMOD Output
-- create right Pmod digit
counts_digit_values: process (counts) begin
case counts is
  when X"0" => seven_segment   <="0111111";    -- 0
  when X"1" => seven_segment   <="0000110";    -- 1
  when X"2" => seven_segment   <="1011011";    -- 2
  when X"3" => seven_segment   <="1001111";    -- 3
  when X"4" => seven_segment   <="1100110";    -- 4
  when X"5" => seven_segment   <="1101101";    -- 5
  when X"6" => seven_segment   <="1111101";    -- 6
  when X"7" => seven_segment   <="0000111";    -- 7
  when X"8" => seven_segment   <="1111111";    -- 8
  when X"9" => seven_segment   <="1101111";    -- 9
  when others => seven_segment <="1000000";  
end case;
end process counts_digit_values;
digit_selection_out<=digit_selection_in;
end Behavioral;
