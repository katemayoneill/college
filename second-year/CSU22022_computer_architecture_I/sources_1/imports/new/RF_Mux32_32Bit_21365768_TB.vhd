library ieee;
use ieee.std_logic_1164.all;

entity rf_mux32_32bit_2135768_tb is
end rf_mux32_32bit_2135768_tb;

architecture behavioral of rf_mux32_32bit_2135768_tb is

signal tb_a: std_logic_vector(4 downto 0);
    
signal tb_in00, tb_in01, tb_in02, tb_in03, 
       tb_in04, tb_in05, tb_in06, tb_in07, 
       tb_in08, tb_in09, tb_in10, tb_in11, 
       tb_in12, tb_in13, tb_in14, tb_in15, 
       tb_in16, tb_in17, tb_in18, tb_in19, 
       tb_in20, tb_in21, tb_in22, tb_in23,
       tb_in24, tb_in25, tb_in26, tb_in27, 
       tb_in28, tb_in29, tb_in30, tb_in31: std_logic_vector(31 downto 0);
    
signal tb_z: std_logic_vector(31 downto 0);

    component rf_mux32_32bit_2135768
        port(
            a: in std_logic_vector(4 downto 0);
    
            in00, in01, in02, in03, 
            in04, in05, in06, in07, 
            in08, in09, in10, in11, 
            in12, in13, in14, in15, 
            in16, in17, in18, in19, 
            in20, in21, in22, in23,
            in24, in25, in26, in27, 
            in28, in29, in30, in31: in std_logic_vector(31 downto 0);
    
            z: out std_logic_vector(31 downto 0)
            );
    end component;

begin
    
    uut: rf_mux32_32bit_2135768 
        port map(
            a => tb_a,

            in00 => tb_in00,
            in01 => tb_in01,
            in02 => tb_in02,
            in03 => tb_in03,

            in04 => tb_in04,
            in05 => tb_in05,
            in06 => tb_in06,
            in07 => tb_in07,

            in08 => tb_in08,
            in09 => tb_in09,
            in10 => tb_in10,
            in11 => tb_in11,

            in12 => tb_in12,
            in13 => tb_in13,
            in14 => tb_in14,
            in15 => tb_in15,

            in16 => tb_in16,
            in17 => tb_in17,
            in18 => tb_in18,
            in19 => tb_in19,

            in20 => tb_in21,
            in21 => tb_in22,
            in22 => tb_in23,
            in23 => tb_in24,

            in24 => tb_in24,
            in25 => tb_in25,
            in26 => tb_in26,
            in27 => tb_in27,

            in28 => tb_in28,
            in29 => tb_in29,
            in30 => tb_in30,
            in31 => tb_in31,

            z => tb_z
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_in00 <= "00000001010001100000010000001000";
		tb_in01 <= "00000001010001100000010000001001";
		tb_in02 <= "00000001010001100000010000001010";
        tb_in03 <= "00000001010001100000010000001011";

        tb_in04 <= "00000001010001100000010000001100";
		tb_in05 <= "00000001010001100000010000001101";
		tb_in06 <= "00000001010001100000010000001110";
        tb_in07 <= "00000001010001100000010000001111";

        tb_in08 <= "00000001010001100000010000010000";
		tb_in09 <= "00000001010001100000010000010001";
		tb_in10 <= "00000001010001100000010000010010";
        tb_in11 <= "00000001010001100000010000010011";

        tb_in12 <= "00000001010001100000010000010100";
		tb_in13 <= "00000001010001100000010000010101";
		tb_in14 <= "00000001010001100000010000010110";
        tb_in15 <= "00000001010001100000010000010111";

        tb_in16 <= "00000001010001100000010000011000";
		tb_in17 <= "00000001010001100000010000011001";
		tb_in18 <= "00000001010001100000010000011010";
        tb_in19 <= "00000001010001100000010000011011";

        tb_in20 <= "00000001010001100000010000011100";
		tb_in21 <= "00000001010001100000010000011101";
		tb_in22 <= "00000001010001100000010000011110";
        tb_in23 <= "00000001010001100000010000011111";

        tb_in24 <= "00000001010001100000010000100000";
		tb_in25 <= "00000001010001100000010000100001";
		tb_in26 <= "00000001010001100000010000100010";
        tb_in27 <= "00000001010001100000010000100011";

        tb_in28 <= "00000001010001100000010000100100";
		tb_in29 <= "00000001010001100000010000100101";
		tb_in30 <= "00000001010001100000010000100110";
        tb_in31 <= "00000001010001100000010000100111";
		
		tb_a <= "00000";
		
		wait for 10ns;
		tb_a <= "00001";
		
		wait for 10ns;
		tb_a <= "00010";

        wait for 10ns;
        tb_a <= "00011";


        wait for 10ns;
		tb_a <= "00100";
		
		wait for 10ns;
		tb_a <= "00101";
		
		wait for 10ns;
		tb_a <= "00110";

        wait for 10ns;
        tb_a <= "00111";


        wait for 10ns;
		tb_a <= "01000";
		
		wait for 10ns;
		tb_a <= "01001";
		
		wait for 10ns;
		tb_a <= "01010";

        wait for 10ns;
        tb_a <= "01011";


        wait for 10ns;
		tb_a <= "01100";
		
		wait for 10ns;
		tb_a <= "01101";
		
		wait for 10ns;
		tb_a <= "01110";

        wait for 10ns;
        tb_a <= "01111";


        wait for 10ns;
		tb_a <= "10000";
		
		wait for 10ns;
		tb_a <= "10001";
		
		wait for 10ns;
		tb_a <= "10010";

        wait for 10ns;
        tb_a <= "10011";


        wait for 10ns;
		tb_a <= "10100";
		
		wait for 10ns;
		tb_a <= "10101";
		
		wait for 10ns;
		tb_a <= "10110";

        wait for 10ns;
        tb_a <= "10111";


        wait for 10ns;
		tb_a <= "11000";
		
		wait for 10ns;
		tb_a <= "11001";
		
		wait for 10ns;
		tb_a <= "11010";

        wait for 10ns;
        tb_a <= "11011";


        wait for 10ns;
		tb_a <= "11100";
		
		wait for 10ns;
		tb_a <= "11101";
		
		wait for 10ns;
		tb_a <= "11110";

        wait for 10ns;
        tb_a <= "11111";
     end process;

end behavioral;