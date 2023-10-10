library ieee;
use ieee.std_logic_1164.all;
entity dp_fulladder_21365768_tb is
end dp_fulladder_21365768_tb;
architecture behavioral of dp_fulladder_21365768_tb is

 signal tb_in01, tb_in02, tb_c_in, tb_sum, tb_c_out: std_logic;   

component dp_fulladder_21365768
    port(
        in01, in02, c_in:in std_logic;
        sum, c_out:out std_logic
        );
end component;
begin
uut: dp_fulladder_21365768
    port map(
        in01 => tb_in01,
        in02 => tb_in02,
        c_in => tb_c_in,
        sum => tb_sum,
        c_out => tb_c_out
        );
stimulus:
process begin
    -- case a
    wait for 100ns;
    tb_in01 <= '0';
    tb_in02 <= '0';
    tb_c_in <= '0';

    -- case b
    wait for 100ns;
    tb_in01 <= '0';
    tb_in02 <= '0';
    tb_c_in <= '1';

    -- case c
    wait for 100ns;
    tb_in01 <= '0';
    tb_in02 <= '1';
    tb_c_in <= '0';

    -- case d
    wait for 100ns;
    tb_in01 <= '0';
    tb_in02 <= '1';
    tb_c_in <= '1';

    -- case e
    wait for 100ns;
    tb_in01 <= '1';
    tb_in02 <= '0';
    tb_c_in <= '0';

    -- case f
    wait for 100ns;
    tb_in01 <= '1';
    tb_in02 <= '0';
    tb_c_in <= '1';

    -- case g
    wait for 100ns;
    tb_in01 <= '1';
    tb_in02 <= '1';
    tb_c_in <= '0';

    -- case h
    wait for 100ns;
    tb_in01 <= '1';
    tb_in02 <= '1';
    tb_c_in <= '1';
end process;
end behavioral;