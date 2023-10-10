library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_arith.all, ieee.std_logic_unsigned.all;

entity rf_registerfile_32_15_21365768_tb is
end rf_registerfile_32_15_21365768_tb;

architecture behavioral of rf_registerfile_32_15_21365768_tb is

    signal tb_sa, tb_sb: std_logic_vector(4 downto 0);

    signal tb_dr00, tb_dr01, tb_dr02, tb_dr03, tb_dr04,
 tb_rw, tb_clock: std_logic;
    signal tb_d: std_logic_vector(31 downto 0);
    signal tb_tb, tb_ta: std_logic_vector(3 downto 0);
    signal tb_td00, tb_td01, tb_td02, tb_td03: std_logic;

    signal tb_b, tb_a: std_logic_vector(31 downto 0);

    component rf_registerfile_32_15_21365768
        port(
            sa, sb: in std_logic_vector(4 downto 0);

            dr00, dr01, dr02, dr03, dr04,
 rw, clock: in std_logic;
            d: in std_logic_vector(31 downto 0);
            tb, ta: in std_logic_vector(3 downto 0);
            td00, td01, td02, td03: in std_logic;

            b, a: out std_logic_vector(31 downto 0)
        );
    end component;

begin
    uut: rf_registerfile_32_15_21365768
        port map(
            sa => tb_sa,
            sb => tb_sb,

            dr00 => tb_dr00,
            dr01 => tb_dr01,
            dr02 => tb_dr02,
            dr03 => tb_dr03,
            dr04 => tb_dr04,

            rw => tb_rw,
            clock => tb_clock,

            d => tb_d,

            tb => tb_tb,
            ta => tb_tb,

            td00 => tb_td00,
            td01 => tb_td01,
            td02 => tb_td02,
            td03 => tb_td03,

            b => tb_b,
            a => tb_a
        );
    clock:
 process begin
        tb_clock <= '0';
        wait for 5ns;
        tb_clock <= '1';
        wait for 5ns;
    end process;


    stimulus:
 process begin
        wait for 10ns;
        -- select tempreg00
        tb_td00 <= '0';
        tb_td01 <= '0';
        tb_td02 <= '0';
        tb_td03 <= '0';
        
        -- write registers
        tb_rw <= '1';
        -- register00
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000001000";

        -- register01
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000001001";

        -- register02
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000001010";

        -- register03
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000001011";

        -- register04
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000001100";

        -- register05
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000001101";

        -- register06
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000001110";

        -- register07
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000001111";

        -- register08
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000010000";

        -- register09
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000010001";

        -- register10
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000010010";

        -- register11
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000010011";

        -- register12
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000010100";

        -- register13
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000010101";

        -- register14
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000010110";

        -- register15
        wait for 10ns;
        tb_dr00 <= '0';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000010111";

        -- register16
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000011000";

        -- register17
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000011001";

        -- register18
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000011010";

        -- register19
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000011011";

        -- register20
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000011100";

        -- register21
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000011101";

        -- register22
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000011110";

        -- register23
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '0';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000011111";

        -- register24
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000100000";

        -- register25
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000100001";

        -- register26
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000100010";

        -- register27
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '0';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000100011";

        -- register28
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000100100";

        -- register29
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '0';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000100101";

        -- register30
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '0';

        tb_d <= "00000001010001100000010000100110";

        -- register31
        wait for 10ns;
        tb_dr00 <= '1';
        tb_dr01 <= '1';
        tb_dr02 <= '1';
        tb_dr03 <= '1';
        tb_dr04 <= '1';

        tb_d <= "00000001010001100000010000100111";

        -- tempreg01
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '0';
        tb_td02 <= '0';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000101000";

        -- tempreg02
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '0';
        tb_td02 <= '1';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000101001";

        -- tempreg03
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '0';
        tb_td02 <= '1';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000101010";

        -- tempreg04
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '1';
        tb_td02 <= '0';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000101011";

        -- tempreg05
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '1';
        tb_td02 <= '0';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000101100";

        -- tempreg06
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '1';
        tb_td02 <= '1';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000101101";

        -- tempreg07
        wait for 10ns;

        tb_td00 <= '0';
        tb_td01 <= '1';
        tb_td02 <= '1';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000101110";

        -- tempreg08
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '0';
        tb_td02 <= '0';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000101111";

        -- tempreg09
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '0';
        tb_td02 <= '0';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000110000";

        -- tempreg10
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '0';
        tb_td02 <= '1';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000110001";

        -- tempreg11
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '0';
        tb_td02 <= '1';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000110010";

        -- tempreg12
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '1';
        tb_td02 <= '0';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000110011";

        -- tempreg13
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '1';
        tb_td02 <= '0';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000110100";

        -- tempreg14
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '1';
        tb_td02 <= '1';
        tb_td03 <= '0';

        tb_d <= "00000001010001100000010000110101";

        -- tempreg15
        wait for 10ns;

        tb_td00 <= '1';
        tb_td01 <= '1';
        tb_td02 <= '1';
        tb_td03 <= '1';

        tb_d <= "00000001010001100000010000110110";

        -- read registers
        wait for 10ns;
        tb_rw <= '0';
        tb_ta <= "0000";
        tb_tb <= "0000";
        -- register00
        wait for 10ns;
        tb_sa <= "00000";
        tb_sb <= "00000";
        -- register01
        wait for 10ns;
        tb_sa <= "00001";

        -- register02
        wait for 10ns;
        tb_sa <= "00010";

        -- register03
        wait for 10ns;
        tb_sa <= "00011";

        -- register04
        wait for 10ns;
        tb_sa <= "00100";

        -- register05
        wait for 10ns;
        tb_sa <= "00101";

        -- register06
        wait for 10ns;
        tb_sa <= "00110";

        -- register07
        wait for 10ns;
        tb_sa <= "00111";

        -- register08
        wait for 10ns;
        tb_sa <= "01000";

        -- register09
        wait for 10ns;
        tb_sa <= "01001";

        -- register10
        wait for 10ns;
        tb_sa <= "01010";

        -- register11
        wait for 10ns;
        tb_sa <= "01011";

        -- register12
        wait for 10ns;
        tb_sa <= "01100";

        -- register13
        wait for 10ns;
        tb_sa <= "01101";

        -- register14
        wait for 10ns;
        tb_sa <= "01110";

        -- register15
        wait for 10ns;
        tb_sa <= "01111";

        -- register16
        wait for 10ns;
        tb_sa <= "10000";

        -- register17
        wait for 10ns;
        tb_sa <= "10001";

        -- register18
        wait for 10ns;
        tb_sa <= "10010";

        -- register19
        wait for 10ns;
        tb_sa <= "10011";

        -- register20
        wait for 10ns;
        tb_sa <= "10100";

        -- register21
        wait for 10ns;
        tb_sa <= "10101";

        -- register22
        wait for 10ns;
        tb_sa <= "10110";

        -- register23
        wait for 10ns;
        tb_sa <= "10111";

        -- register24
        wait for 10ns;
        tb_sa <= "11000";

        -- register25
        wait for 10ns;
        tb_sa <= "11001";

        -- register26
        wait for 10ns;
        tb_sa <= "11010";

        -- register27
        wait for 10ns;
        tb_sa <= "11011";

        -- register28
        wait for 10ns;
        tb_sa <= "11100";

        -- register29
        wait for 10ns;
        tb_sa <= "11101";

        -- register30
        wait for 10ns;
        tb_sa <= "11110";

        -- register31
        wait for 10ns;
        tb_sa <= "11111";

        -- tempreg01
        wait for 10ns;

        tb_ta <= "0001";

        -- tempreg02
        wait for 10ns;

        tb_ta <= "0010";

        -- tempreg03
        wait for 10ns;

        tb_ta <= "0011";

        -- tempreg04
        wait for 10ns;

        tb_ta <= "0100";

        -- tempreg05
        wait for 10ns;

        tb_ta <= "0101";

        -- tempreg06
        wait for 10ns;

        tb_ta <= "0110";

        -- tempreg07
        wait for 10ns;

        tb_ta <= "0111";

        -- tempreg08
        wait for 10ns;

        tb_ta <= "1000";


        -- tempreg09
        wait for 10ns;

        tb_ta <= "1001";

        -- tempreg10
        wait for 10ns;

        tb_ta <= "1010";

        -- tempreg11
        wait for 10ns;

        tb_ta <= "1011";

        -- tempreg12
        wait for 10ns;

        tb_ta <= "1100";

        -- tempreg13
        wait for 10ns;

        tb_ta <= "1101";

        -- tempreg14
        wait for 10ns;

        tb_ta <= "1110";

        -- tempreg15
        wait for 10ns;

        tb_ta <= "1111";

    end process;
end behavioral;