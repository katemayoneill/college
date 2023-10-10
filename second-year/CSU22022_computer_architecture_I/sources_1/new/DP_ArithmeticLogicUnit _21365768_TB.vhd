library ieee;
use ieee.std_logic_1164.all;
entity dp_arithmeticlogicunit_21365768_tb is
end dp_arithmeticlogicunit_21365768_tb;

architecture behavioral of dp_arithmeticlogicunit_21365768_tb is

signal tb_a, tb_b, tb_g: std_logic_vector(31 downto 0);
signal tb_c_in, tb_s00, tb_s01, tb_s02, tb_c, tb_v: std_logic;
   
component dp_arithmeticlogicunit_21365768
    port(
         a: in std_logic_vector(31 downto 0);
        c_in: in std_logic;
        b: in std_logic_vector(31 downto 0);
        s00, s01, s02: in std_logic;
        
        c, v: out std_logic;
        g: out std_logic_vector(31 downto 0)
        );
end component;


begin

uut: dp_arithmeticlogicunit_21365768
    port map(
        a => tb_a,
        c_in => tb_c_in,
        b => tb_b,
        s00 => tb_s00,
        s01 => tb_s01,
        s02 => tb_s02,
        c => tb_c,
        v => tb_v,
        g => tb_g
        );
    
stimulus: 
process begin
    wait for 100ns;
    tb_a <= "00000001010001100000010000001000";
    tb_b <= "01010101010101010101001001110010";
    

    -- a
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '0';
    tb_s00 <= '0';
    tb_c_in <= '0';
   
    -- a + 1
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '0';
    tb_s00 <= '0';
    tb_c_in <= '1';
    
    -- a + b
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '0';
    tb_s00 <= '1';
    tb_c_in <= '0';
    
    -- a + b + 1
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '0';
    tb_s00 <= '1';
    tb_c_in <= '1';
    
    -- a + 1's complement(b)
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '1';
    tb_s00 <= '0';
    tb_c_in <= '0';
    
    -- a + 1's complement(b) + 1
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '1';
    tb_s00 <= '0';
    tb_c_in <= '1';
    
    -- a - 1
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '1';
    tb_s00 <= '1';
    tb_c_in <= '0';
    
    -- a
    wait for 100ns;
    tb_s02 <= '0';
    tb_s01 <= '1';
    tb_s00 <= '1';
    tb_c_in <= '1';
    
    -- a and b
    wait for 100ns;
    tb_s02 <= '1';
    tb_s01 <= '0';
    tb_s00 <= '0';
    tb_c_in <= '0';
  
    -- a or b
    wait for 100ns;
    tb_s02 <= '1';
    tb_s01 <= '0';
    tb_s00 <= '1';
    tb_c_in <= '0';
    
    -- a xor b
    wait for 100ns;
    tb_s02 <= '1';
    tb_s01 <= '1';
    tb_s00 <= '0';
    tb_c_in <= '0';
    
    -- not a
    wait for 100ns;
    tb_s02 <= '1';
    tb_s01 <= '1';
    tb_s00 <= '1';
    tb_c_in <= '0';
    
end process;

end behavioral;