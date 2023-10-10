library ieee;
use ieee.std_logic_1164.all;
entity dp_32bit_b_logic_21365768_tb is
end dp_32bit_b_logic_21365768_tb;

architecture behavioral of dp_32bit_b_logic_21365768_tb is

signal tb_s00, tb_s01: std_logic;
signal tb_b, tb_y: std_logic_vector(31 downto 0);

component dp_32bit_b_logic_21365768
    port( 
        s00, s01: in std_logic;
        b: in std_logic_vector(31 downto 0);

        y: out std_logic_vector(31 downto 0)
        );
end component;
begin
uut: dp_32bit_b_logic_21365768
    port map( 
        s00 => tb_s00,
        s01 => tb_s01,
        b => tb_b,

        y => tb_y
        );
        
stimulus: 
process begin
    wait for 10ns;
    tb_b <= "00000001010001100000010000001000";

    tb_s00 <= '0';
    tb_s01 <= '0';

    wait for 10ns;
    tb_s00 <= '0';
    tb_s01 <= '1';

    wait for 10ns;
    tb_s00 <= '1';
    tb_s01 <= '0';

    wait for 10ns;
    tb_s00 <= '1';
    tb_s01 <= '1';

end process;
end behavioral;
