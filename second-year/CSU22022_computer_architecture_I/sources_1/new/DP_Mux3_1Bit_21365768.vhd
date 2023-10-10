library ieee;
use ieee.std_logic_1164.all;

entity cpu_mux3_1bit_2135768 is
    port(
        bi, s01, s02, slbi, srbi: in std_logic;
        gi: out std_logic
        );
end cpu_mux3_1bit_2135768;

architecture behavioral of cpu_mux3_1bit_2135768 is
constant gate_delay: time:= 5ns;
begin
    gi <= slbi   after gate_delay when s01 = '1' and s02 = '0' else
          srbi   after gate_delay when s01 = '0' and s02 = '1' else
          bi     after gate_delay;

end behavioral;