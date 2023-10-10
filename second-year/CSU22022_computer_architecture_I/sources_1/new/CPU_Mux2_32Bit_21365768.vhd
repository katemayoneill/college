library ieee;
use ieee.std_logic_1164.all;

entity cpu_mux2_32bit_2135768 is
    port(
        sel: in std_logic;
        
        in00, in01: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end cpu_mux2_32bit_2135768;

architecture behavioral of cpu_mux2_32bit_2135768 is
constant gate_delay: time:= 5ns;
begin
    z <= in00 after gate_delay when sel = '0' else
         in01 after gate_delay when sel = '1';

end behavioral;