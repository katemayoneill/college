library ieee;
use ieee.std_logic_1164.all;

entity dp_cflagmux2_1bit_21365768_tb is
end dp_cflagmux2_1bit_21365768_tb;

architecture behavioral of dp_cflagmux2_1bit_21365768_tb is

signal tb_c_alu, tb_c_shift, tb_fs4, tb_c: std_logic;

    component dp_cflagmux2_1bit_21365768
        port(
            c_alu, c_shift, fs4: in std_logic;
            c: out std_logic
            );
    end component;

begin
    
    uut: dp_cflagmux2_1bit_21365768
        port map(
            c_alu => tb_c_alu,
            c_shift => tb_c_shift,
            fs4 => tb_fs4,
            c => tb_c
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_c_alu <= '0';
        tb_c_shift <= '0';
        tb_fs4 <= '0';
        
        wait for 10ns;
        tb_c_alu <= '0';
        tb_c_shift <= '0';
        tb_fs4 <= '1';
        
        wait for 10ns;
        tb_c_alu <= '0';
        tb_c_shift <= '1';
        tb_fs4 <= '0';
        
        wait for 10ns;
        tb_c_alu <= '0';
        tb_c_shift <= '1';
        tb_fs4 <= '1';
        
        wait for 10ns;
        tb_c_alu <= '1';
        tb_c_shift <= '0';
        tb_fs4 <= '0';
        
        wait for 10ns;
        tb_c_alu <= '1';
        tb_c_shift <= '0';
        tb_fs4 <= '1';
        
        wait for 10ns;
        tb_c_alu <= '1';
        tb_c_shift <= '1';
        tb_fs4 <= '0';
        
        wait for 10ns;
        tb_c_alu <= '1';
        tb_c_shift <= '1';
        tb_fs4 <= '1';
     
 
     end process;

end behavioral;