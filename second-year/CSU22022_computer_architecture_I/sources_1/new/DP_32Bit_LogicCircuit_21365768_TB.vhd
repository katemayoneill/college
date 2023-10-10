library ieee;
use ieee.std_logic_1164.all;
entity dp_32bit_logiccircuit_21365768_tb is
end dp_32bit_logiccircuit_21365768_tb;

architecture behavioral of dp_32bit_logiccircuit_21365768_tb is

signal tb_s00, tb_s01: std_logic;
signal tb_a, tb_b, tb_g: std_logic_vector(31 downto 0);

component dp_32bit_logiccircuit_21365768
    port( 
        s00, s01: in std_logic;
        a, b: in std_logic_vector(31 downto 0);    
        g: out std_logic_vector(31 downto 0)
        );
end component;
begin
uut: dp_32bit_logiccircuit_21365768
    port map( 
                a => tb_a,
                b => tb_b,
                s00 => tb_s00,
                s01 => tb_s01,
                g => tb_g
                );
stimulus: 
process begin
    wait for 100ns;
    tb_a <= x"21365768";
    tb_b <= x"beefdada";
    
-- and 
    tb_s01 <= '0';
    tb_s00 <= '0';
    
    wait for 100ns;
-- or
    tb_s01 <= '0';
    tb_s00 <= '1';
    
    wait for 100ns;
-- xor
    tb_s01 <= '1';
    tb_s00 <= '0';
    
     wait for 100ns;
-- not
    tb_s01 <= '1';
    tb_s00 <= '1';




end process;
    
end behavioral;