library ieee;
use ieee.std_logic_1164.all;

entity dp_shiftercflagmux2_1bit_21365768_tb is
end dp_shiftercflagmux2_1bit_21365768_tb;

architecture behavioral of dp_shiftercflagmux2_1bit_21365768_tb is

signal tb_lsb, tb_msb, tb_s01, tb_s02, tb_c: std_logic;

    component dp_shiftercflagmux2_1bit_21365768
        port(
            lsb, msb, s01, s02: in std_logic;
            c: out std_logic
            );
    end component;

begin
    
    uut: dp_shiftercflagmux2_1bit_21365768
        port map(
            lsb => tb_lsb,
            msb => tb_msb,
            s01 => tb_s01,
            s02 => tb_s02,
            c => tb_c
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_lsb <= '1';
        tb_msb <= '0';
        tb_s01 <= '1';
        tb_s02 <= '0';
        
        wait for 10ns;
        tb_s01 <= '0';
        tb_s02 <= '1';
        
        wait for 10ns;
        tb_s01 <= '1';
        tb_s02 <= '1';
        
        wait for 10ns;
        tb_s01 <= '0';
        tb_s02 <= '0';
     end process;

end behavioral;