library IEEE; USE IEEE.STD_LOGIC_1164.ALL; USE IEEE.numeric_std.ALL;

entity Counter is
port (
      clk                   : in std_logic;
      reset                 : in std_logic;			            -- Asynchronous reset
      direction             : in std_logic;			            -- Ascending/Descending order of counting
      digit_selection_in    : in std_logic;                     -- Digit Selection IN Pin for PmodSSD
      led_result            : out std_logic_vector(3 downto 0); -- LED Result input
      seven_segment         : out std_logic_vector(6 downto 0); -- 7-segment output MSBit is g, LSBit is a
      digit_selection_out   : out std_logic                     -- Digit Selection OUT Pin for PmodSSD
    );
end entity Counter;


architecture Behavioral of Counter is

    

end Behavioral;
