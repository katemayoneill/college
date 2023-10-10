library ieee;
use ieee.std_logic_1164.all;

entity dp_cflagmux2_1bit_21365768 is
    port(
        c_alu, c_shift, fs4: in std_logic;
        c: out std_logic
        );
end dp_cflagmux2_1bit_21365768;

architecture behavioral of dp_cflagmux2_1bit_21365768 is
constant gate_delay: time:= 5ns;
begin
    c <= c_alu   after gate_delay when fs4 = '0' else
         c_shift   after gate_delay when fs4 = '1' else
         '0'   after gate_delay;


end behavioral;