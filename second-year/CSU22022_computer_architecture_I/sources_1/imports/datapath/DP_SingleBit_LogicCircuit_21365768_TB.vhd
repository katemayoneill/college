library ieee;
use ieee.std_logic_1164.all;
entity dp_singlebit_logiccircuit_21365768_tb is
end dp_singlebit_logiccircuit_21365768_tb;

architecture behavioral of dp_singlebit_logiccircuit_21365768_tb is

signal a, b, s00, s01, g: std_logic;

component dp_singlebit_logiccircuit_21365768
    port( 
        a, b, s00, s01: in std_logic;
    
        g: out std_logic
        );
end component;
begin
uut: dp_singlebit_logiccircuit_21365768
    port map( 
                a => a,
                b => b,
                s00 => s00,
                s01 => s01,
                g => g
                );
stimulus: 
process begin
    wait for 10ns;
    s01 <= '0';
    s00 <= '0';
    a <= '0';
    b <= '0';

    wait for 10ns;
    s01 <= '0';
    s00 <= '0';
    a <= '0';
    b <= '1';

    wait for 10ns;
    s01 <= '0';
    s00 <= '0';
    a <= '1';
    b <= '0';

    wait for 10ns;
    s01 <= '0';
    s00 <= '0';
    a <= '1';
    b <= '1';

    wait for 10ns;
    s01 <= '0';
    s00 <= '1';
    a <= '0';
    b <= '0';
    
    wait for 10ns;
    s01 <= '0';
    s00 <= '1';
    a <= '0';
    b <= '1';

    wait for 10ns;
    s01 <= '0';
    s00 <= '1';
    a <= '1';
    b <= '0';

    wait for 10ns;
    s01 <= '0';
    s00 <= '1';
    a <= '1';
    b <= '1';

    wait for 10ns;
    s01 <= '1';
    s00 <= '0';
    a <= '0';
    b <= '0';

    wait for 10ns;
    s01 <= '1';
    s00 <= '0';
    a <= '0';
    b <= '1';

    wait for 10ns;
    s01 <= '1';
    s00 <= '0';
    a <= '1';
    b <= '0';

    wait for 10ns;
    s01 <= '1';
    s00 <= '0';
    a <= '1';
    b <= '1';

    wait for 10ns;
    s01 <= '1';
    s00 <= '1';
    a <= '0';
    b <= '0';

    wait for 10ns;
    s01 <= '1';
    s00 <= '1';
    a <= '0';
    b <= '1';

    wait for 10ns;
    s01 <= '1';
    s00 <= '1';
    a <= '1';
    b <= '0';

    wait for 10ns;
    s01 <= '1';
    s00 <= '1';
    a <= '1';
    b <= '1';

end process;
    
end behavioral;