library ieee;
use ieee.std_logic_1164.all;
entity dp_singlebit_b_logic_21365768_tb is
end dp_singlebit_b_logic_21365768_tb;

architecture behavioral of dp_singlebit_b_logic_21365768_tb is

signal tb_s00, tb_s01, tb_b, tb_y: std_logic;

component dp_singlebit_b_logic_21365768
    port( 
        s00: in std_logic;
        s01: in std_logic;
        b: in std_logic;

        y: out std_logic
        );
end component;
begin
uut: dp_singlebit_b_logic_21365768
    port map( 
        s00 => tb_s00,
        s01 => tb_s01,
        b => tb_b,

        y => tb_y
        );

stimulus: 
process begin
    wait for 10ns;
    tb_s01 <= '0';
    tb_s00 <= '0';
    tb_b <= '0';

    wait for 10ns;
    tb_s01 <= '0';
    tb_s00 <= '0';
    tb_b <= '1';

    wait for 10ns;
    tb_s01 <= '0';
    tb_s00 <= '1';
    tb_b <= '0';

    wait for 10ns;
    tb_s01 <= '0';
    tb_s00 <= '1';
    tb_b <= '1';

    wait for 10ns;
    tb_s01 <= '1';
    tb_s00 <= '0';
    tb_b <= '0';

    wait for 10ns;
    tb_s01 <= '1';
    tb_s00 <= '0';
    tb_b <= '1';

    wait for 10ns;
    tb_s01 <= '1';
    tb_s00 <= '1';
    tb_b <= '0';

    wait for 10ns;
    tb_s01 <= '1';
    tb_s00 <= '1';
    tb_b <= '1';

end process;
end behavioral;
