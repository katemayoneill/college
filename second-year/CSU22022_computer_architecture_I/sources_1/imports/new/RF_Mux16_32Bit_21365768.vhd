library ieee;
use ieee.std_logic_1164.all;

entity rf_mux16_32bit_2135768 is
    port(
        a: in std_logic_vector(3 downto 0);
        
        in00, in01, in02, in03, 
        in04, in05, in06, in07, 
        in08, in09, in10, in11, 
        in12, in13, in14, in15: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end rf_mux16_32bit_2135768;

architecture behavioral of rf_mux16_32bit_2135768 is
constant gate_delay: time:= 5ns;
begin
    z <= in00 after gate_delay when a = "0000" else
         in01 after gate_delay when a = "0001" else
         in02 after gate_delay when a = "0010" else
         in03 after gate_delay when a = "0011" else

         in04 after gate_delay when a = "0100" else
         in05 after gate_delay when a = "0101" else
         in06 after gate_delay when a = "0110" else
         in07 after gate_delay when a = "0111" else

         in08 after gate_delay when a = "1000" else
         in09 after gate_delay when a = "1001" else
         in10 after gate_delay when a = "1010" else
         in11 after gate_delay when a = "1011" else

         in12 after gate_delay when a = "1100" else
         in13 after gate_delay when a = "1101" else
         in14 after gate_delay when a = "1110" else
         in15 after gate_delay when a = "1111";

end behavioral;