LIBRARY ieee; USE ieee.std_logic_1164.ALL; USE ieee.numeric_std.ALL;

entity bcd2sevenseg_tb IS
end bcd2sevenseg_tb;

architecture behavior of bcd2sevenseg_tb IS 
    component bcd2sevenseg 
    port (
        digit_selection_in    : in std_logic; 
        bcd                   : in std_logic_vector(3 downto 0);  
        seven_segment         : out std_logic_vector(6 downto 0); 
        digit_selection_out   : out std_logic
    );
    end component;

    signal bcd                     : std_logic_vector(3 downto 0) := (others => 'X');
    signal digit_selection_in      : std_logic;
    signal seven_segment           : std_logic_vector(6 downto 0);
    signal digit_selection_out     : std_logic;

    begin
    uut: bcd2sevenseg PORT MAP (
        digit_selection_in => digit_selection_in,
        bcd => bcd,
        seven_segment => seven_segment,
        digit_selection_out => digit_selection_out 
    );

        test_proc: process is
        begin		
            bcd<="0001"; digit_selection_in<='1';wait for 20ns;
            bcd<="0100";wait for 20ns;
            bcd<="1001"; digit_selection_in<='0';wait for 20ns;
            bcd<="1011";wait for 20ns;
        end process test_proc;
 
end architecture behavior;