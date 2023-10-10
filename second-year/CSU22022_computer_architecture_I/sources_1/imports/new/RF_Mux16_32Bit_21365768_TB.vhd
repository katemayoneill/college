library ieee;
use ieee.std_logic_1164.all;

entity rf_mux16_32bit_2135768_tb is
end rf_mux16_32bit_2135768_tb;

architecture behavioral of rf_mux16_32bit_2135768_tb is

signal a: std_logic_vector(3 downto 0);
signal in00, in01, in02, in03, 
       in04, in05, in06, in07, 
       in08, in09, in10, in11, 
       in12, in13, in14, in15: std_logic_vector(31 downto 0);
signal z: std_logic_vector(31 downto 0);

    component rf_mux16_32bit_2135768
        port(
            a: in std_logic_vector(3 downto 0);

            in00, in01, in02, in03, 
            in04, in05, in06, in07, 
            in08, in09, in10, in11, 
            in12, in13, in14, in15: in std_logic_vector(31 downto 0);

            z: out std_logic_vector(31 downto 0)
            );
    end component;

begin
    
    uut: rf_mux16_32bit_2135768 
        port map(
            a => a,

            in00 => in00,
            in01 => in01,
            in02 => in02,
            in03 => in03,

            in04 => in04,
            in05 => in05,
            in06 => in06,
            in07 => in07,

            in08 => in08,
            in09 => in09,
            in10 => in10,
            in11 => in11,

            in12 => in12,
            in13 => in13,
            in14 => in14,
            in15 => in15,

            z => z
            );

    stimulus:
    process begin
        wait for 10ns;
        in00 <= "00000001010001100000010000001000";
		in01 <= "00000001010001100000010000001001";
		in02 <= "00000001010001100000010000001010";
        in03 <= "00000001010001100000010000001011";

        in04 <= "00000001010001100000010000001100";
		in05 <= "00000001010001100000010000001101";
		in06 <= "00000001010001100000010000001110";
        in07 <= "00000001010001100000010000001111";

        in08 <= "00000001010001100000010000010000";
		in09 <= "00000001010001100000010000010001";
		in10 <= "00000001010001100000010000010010";
        in11 <= "00000001010001100000010000010011";

        in12 <= "00000001010001100000010000010100";
		in13 <= "00000001010001100000010000010101";
		in14 <= "00000001010001100000010000010110";
        in15 <= "00000001010001100000010000010111";


		a <= "0000";
		
		wait for 10ns;
		a <= "0001";
		
		wait for 10ns;
		a <= "0010";

        wait for 10ns;
        a <= "0011";


        wait for 10ns;
		a <= "0100";
		
		wait for 10ns;
		a <= "0101";
		
		wait for 10ns;
		a <= "0110";

        wait for 10ns;
        a <= "0111";


        wait for 10ns;
		a <= "1000";
		
		wait for 10ns;
		a <= "1001";
		
		wait for 10ns;
		a <= "1010";

        wait for 10ns;
        a <= "1011";


        wait for 10ns;
		a <= "1100";
		
		wait for 10ns;
		a <= "1101";
		
		wait for 10ns;
		a <= "1110";

        wait for 10ns;
        a <= "1111";
        
     end process;

end behavioral;