library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- for signed numbers

entity alu_TB is
end alu_TB;

architecture Dataflow of alu_TB is

-- Component declaration
component alu
Port (
S1 : in STD_LOGIC;
S0 : in STD_LOGIC;
Cin : in STD_LOGIC;
A : in STD_LOGIC_VECTOR (7 downto 0);
B : in STD_LOGIC_VECTOR (7 downto 0);
Y : out STD_LOGIC_VECTOR (7 downto 0)
);
end component;

-- Signals for testbench
signal S1_tb    : std_logic := '0';
signal S0_tb    : std_logic := '0';
signal Cin_tb   : std_logic := '0';
signal A_tb     : std_logic_vector(7 downto 0) := (others => '0');
signal B_tb     : std_logic_vector(7 downto 0) := (others => '0');
signal Y_tb     : std_logic_vector(7 downto 0);

begin
-- Instantiate the Adder_Signed component
UUT: alu
Port map (
    S1  => S1_tb,
    S0  => S0_tb,
    Cin => Cin_tb,
    A   => A_tb,
    B   => B_tb,
    Y   => Y_tb
);

process
begin
-- Test 1-1+0=0 
S1_tb <= '0'; S0_tb <= '0';
A_tb <= "00000001"; B_tb <= "00000001";
wait for 10 ns;

-- Test 1-1+1=1
S1_tb <= '0'; S0_tb <= '0'; Cin_tb <= '1';
A_tb <= "00000001"; B_tb <= "00000001";
wait for 10 ns;

-- Test 10-1+1=10
S1_tb <= '0'; S0_tb <= '0'; Cin_tb <= '1';
A_tb <= "00001010"; B_tb <= "00000001";
wait for 10 ns;

-- Test -10-(-4)+0=-6
S1_tb <= '0'; S0_tb <= '0'; Cin_tb <= '0';
A_tb <= "11110110"; B_tb <= "11111100";
wait for 10 ns;

-- Test -10 Righ Shift = -5 Arithmetic A preserve sigh 
S1_tb <= '0'; S0_tb <= '1'; Cin_tb <= '0'; 
A_tb <= "11110110"; B_tb <= "11111110";
wait for 10 ns;

-- Test Y=-5 Shift Logical Right = -10
S1_tb <= '1'; S0_tb <= '0'; Cin_tb <= '1';
A_tb <= "11110110"; B_tb <= "11111110";
wait for 10 ns;

-- Test -10 Shift Logical Left
S1_tb <= '1'; S0_tb <= '0'; Cin_tb <= '1';
A_tb <= "11110110"; B_tb <= "11111110";
wait for 10 ns;

-- Test not (-10 and -1)
S1_tb <= '1'; S0_tb <= '1';
A_tb <= "11110110"; B_tb <= "11111110";
wait for 10 ns;

-- End simulation
wait;
end process;

end Dataflow;
