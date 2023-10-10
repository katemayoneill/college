library ieee;
use ieee.std_logic_1164.all;

entity rf_mux32_32bit_2135768 is
    port(
        a: in std_logic_vector(4 downto 0);

        in00, in01, in02, in03, in04, 
        in05, in06, in07, in08, in09, 
        in10, in11, in12, in13, in14, 
        in15, in16, in17, in18, in19, 
        in20, in21, in22, in23, in24,
        in25, in26, in27, in28, in29,
        in30, in31: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end rf_mux32_32bit_2135768;

architecture behavioral of rf_mux32_32bit_2135768 is
    constant gate_delay: time:= 5ns;
begin
    z <= in00 after gate_delay when a = "00000" else
         in01 after gate_delay when a = "00001" else
         in02 after gate_delay when a = "00010" else
         in03 after gate_delay when a = "00011" else

         in04 after gate_delay when a = "00100" else
         in05 after gate_delay when a = "00101" else
         in06 after gate_delay when a = "00110" else
         in07 after gate_delay when a = "00111" else

         in08 after gate_delay when a = "01000" else
         in09 after gate_delay when a = "01001" else
         in10 after gate_delay when a = "01010" else
         in11 after gate_delay when a = "01011" else

         in12 after gate_delay when a = "01100" else
         in13 after gate_delay when a = "01101" else
         in14 after gate_delay when a = "01110" else
         in15 after gate_delay when a = "01111" else

         in16 after gate_delay when a = "10000" else
         in17 after gate_delay when a = "10001" else
         in18 after gate_delay when a = "10010" else
         in19 after gate_delay when a = "10011" else

         in20 after gate_delay when a = "10100" else
         in21 after gate_delay when a = "10101" else
         in22 after gate_delay when a = "10110" else
         in23 after gate_delay when a = "10111" else

         in24 after gate_delay when a = "11000" else
         in25 after gate_delay when a = "11001" else
         in26 after gate_delay when a = "11010" else
         in27 after gate_delay when a = "11011" else
         
         in28 after gate_delay when a = "11100" else
         in29 after gate_delay when a = "11101" else
         in30 after gate_delay when a = "11110" else
         in31 after gate_delay when a = "11111";
end behavioral;