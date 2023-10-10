library ieee;
use ieee.std_logic_1164.all;

entity dp_zerodetection_21365768_tb is
end dp_zerodetection_21365768_tb;

architecture behavioral of dp_zerodetection_21365768_tb is

signal tb_muxf_to_f: std_logic_vector(31 downto 0);
signal tb_z: std_logic;

    component dp_zerodetection_21365768
        port(
        muxf_to_f: in std_logic_vector(31 downto 0);
        z: out std_logic
        );
    end component;

begin
    
    uut: dp_zerodetection_21365768
        port map(
            muxf_to_f => tb_muxf_to_f,
            z => tb_z
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_muxf_to_f <= "01111001010111110011001100111110";
        
        wait for 10ns; 
        tb_muxf_to_f <= "00000000000000000000000000000001";
        
        wait for 10ns;
        tb_muxf_to_f <= "00000000000000000000000000000000";

        
       
     end process;

end behavioral;