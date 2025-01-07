library IEEE; use IEEE.STD_LOGIC_1164.ALL;

entity CR_AC_tb is
end CR_AC_tb;
architecture Behavioral of CR_AC_tb is

component CR_AC is
Port ( 
  Sensor_1    :in std_logic; 
  Sensor_2    :in std_logic;
  AirCond_1  :out std_logic; 
  AirCond_2  :out std_logic);
end component CR_AC;

-- Internal Signals: One for each port
signal Sensor_1_tb    :std_logic; 
signal Sensor_2_tb    :std_logic;
signal AirCond_1_tb   :std_logic; 
signal AirCond_2_tb   :std_logic;

begin

-- create entity into testbench entity
uut: CR_AC port map (
  Sensor_1=>Sensor_1_tb, 
  Sensor_2=>Sensor_2_tb, 
  AirCond_1=>AirCond_1_tb, 
  AirCond_2=>AirCond_2_tb
);
--uut: CR_AC port map (
  Sensor_1_tb, 
  Sensor_2_tb, 
  AirCond_1_tb, 
  AirCond_2_tb
);  
--uut: CR_AC port map (
  Sensor_2=>Sensor_2_tb, 
  AirCond_1=>AirCond_1_tb, 
  Sensor_1=>Sensor_1_tb, 
  AirCond_2=>AirCond_2_tb
); 

enter_test_values: process is
begin
  Sensor_1_tb<='0'; Sensor_2_tb<='0'; wait for 20 ns;
  Sensor_1_tb<='0'; Sensor_2_tb<='1'; wait for 20 ns;
  Sensor_1_tb<='1'; Sensor_2_tb<='0'; wait for 20 ns;
  Sensor_1_tb<='1'; Sensor_2_tb<='1'; wait for 20 ns;
end process enter_test_values;
end  architecture Behavioral;
