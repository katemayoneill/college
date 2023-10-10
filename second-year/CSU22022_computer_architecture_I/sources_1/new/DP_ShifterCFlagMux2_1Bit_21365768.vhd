library ieee;
use ieee.std_logic_1164.all;

entity dp_shiftercflagmux2_1bit_21365768 is
    port(
        lsb, msb, s01, s02: in std_logic;
        c: out std_logic
        );
end dp_shiftercflagmux2_1bit_21365768;

architecture behavioral of dp_shiftercflagmux2_1bit_21365768 is
constant gate_delay: time:= 5ns;
begin
    c <= msb   after gate_delay when s01 = '1' and s02 = '0' else
         lsb   after gate_delay when s01 = '0' and s02 = '1' else
         '0'   after gate_delay;


end behavioral;