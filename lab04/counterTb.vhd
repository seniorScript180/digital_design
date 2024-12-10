library IEEE; USE IEEE.STD_LOGIC_1164.ALL; USE IEEE.numeric_std.ALL;

entity CounterTb is
end entity CounterTb;


architecture Behavioral of Counter is
    constant ClockFrequency : integer := 100e6; -- 100MHz
    constant OneSecondCount : integer := ClockFrequency;
    signal clk_one_sec      : std_logic := '0';
    signal counter          : integer := '0';

begin    
    process(Clk, reste) 
    begin
        if reset = '1' then
            counter <= 0;
            clk_one_sec <= '0';
        elsif rising_edge(clk) then
            if counter = OneSecondCount - 1 then
                counter <= 0;
                clk_one_sec <= not clk_one_sec;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
