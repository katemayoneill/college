library ieee;
use ieee.std_logic_1164.all;

entity dp_shifter_21365768_tb is
end dp_shifter_21365768_tb;

architecture behavioral of dp_shifter_21365768_tb is

signal tb_b, tb_g: std_logic_vector(31 downto 0);
signal tb_s01, tb_s02, tb_c: std_logic;
    component dp_shifter_21365768
        port(
            b: in std_logic_vector(31 downto 0);
            s01, s02: in std_logic;
            g: out std_logic_vector(31 downto 0);
            c: out std_logic
            );
    end component;

begin
    
    uut: dp_shifter_21365768
        port map(
            b => tb_b,
            s01 => tb_s01,
            s02 => tb_s02,
            g => tb_g,
            c => tb_c
            );

    stimulus:
    process begin
        wait for 100ns;
        tb_s01 <= '1';
        tb_s02 <= '0';
        tb_b <= "00000001010001100000010000001000";
        
        wait for 100ns;
        tb_s01 <= '0';
        tb_s02 <= '1';
        tb_b <= "00000001010001100000010000001000";
        
        wait for 100ns;
        tb_s01 <= '1';
        tb_s02 <= '1';
        tb_b <= "00000001010001100000010000001000";
        
        wait for 100ns;
        tb_s01 <= '1';
        tb_s02 <= '0';
        tb_b <= "10000000000000000000000000000000";
        
        wait for 100ns;
        tb_s01 <= '0';
        tb_s02 <= '1';
        tb_b <= "10000000000000000000000000000000";
        
        wait for 100ns;
        tb_s01 <= '0';
        tb_s02 <= '1';
        tb_b <= "00000000000000000000000000000001";
        
        
       
     end process;

end behavioral;