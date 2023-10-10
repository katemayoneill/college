library ieee;
use ieee.std_logic_1164.all;

entity dp_functionalunit_21365768_tb is
end dp_functionalunit_21365768_tb;

architecture behavioral of dp_functionalunit_21365768_tb is

signal tb_a, tb_b, tb_f: std_logic_vector(31 downto 0);
signal tb_fs: std_logic_vector(4 downto 0);
signal tb_c, tb_n, tb_z, tb_v: std_logic;
    component dp_functionalunit_21365768
        port(
        a, b: in std_logic_vector(31 downto 0);
        fs: in std_logic_vector(4 downto 0);
        c, n, z, v: out std_logic;
        f: out std_logic_vector(31 downto 0)
        );
    end component;

begin
    
    uut: dp_functionalunit_21365768
        port map(
            a => tb_a,
            b => tb_b,
            fs => tb_fs,
            c => tb_c,
            n => tb_n,
            z => tb_z,
            v => tb_v,
            f => tb_f
            );

    stimulus:
    process begin
        wait for 100ns;
        tb_a <= "00000001010001100000010000001000";
        tb_b <= "00000001010001100000010000100100";
        tb_fs <= "00000";
               
        wait for 100ns;
        tb_fs <= "00001";
        
        wait for 100ns;
        tb_fs <= "00010";
        
        wait for 100ns;
        tb_fs <= "00011";
        
        wait for 100ns;
        tb_fs <= "00100";
        
        wait for 100ns;
        tb_fs <= "00101";
        
        wait for 100ns;
        tb_fs <= "00110";
        
        wait for 100ns;
        tb_fs <= "00111";
        
        wait for 100ns;
        tb_fs <= "01000";
        
        wait for 100ns;
        tb_fs <= "01001";
        
        wait for 100ns;
        tb_fs <= "01010";
        
        wait for 100ns;
        tb_fs <= "01011";
        
        wait for 100ns;
        tb_fs <= "01100";
        
        wait for 100ns;
        tb_fs <= "01101";
        
        wait for 100ns;
        tb_fs <= "01110";
        
        wait for 100ns;
        tb_fs <= "01111";
        
        wait for 100ns;
        tb_fs <= "10000";
        
        wait for 100ns;
        tb_fs <= "10001";
        
        wait for 100ns;
        tb_fs <= "10010";
        
        wait for 100ns;
        tb_fs <= "10011";
        
        wait for 100ns;
        tb_fs <= "10100";
        
        wait for 100ns;
        tb_fs <= "10101";
        
        wait for 100ns;
        tb_fs <= "10110";
        
        wait for 100ns;
        tb_fs <= "10111";
        
        wait for 100ns;
        tb_fs <= "11000";
        
        wait for 100ns;
        tb_fs <= "11001";
        
        wait for 100ns;
        tb_fs <= "11010";
        
        wait for 100ns;
        tb_fs <= "11011";
        
        wait for 100ns;
        tb_fs <= "11100";
        
        wait for 100ns;
        tb_fs <= "11101";
        
        wait for 100ns;
        tb_fs <= "11110";
        
        wait for 100ns;
        tb_fs <= "11111";
       
     end process;

end behavioral;
