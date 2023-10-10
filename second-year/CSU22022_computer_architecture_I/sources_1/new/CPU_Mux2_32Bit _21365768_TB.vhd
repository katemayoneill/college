library ieee;
use ieee.std_logic_1164.all;

entity cpu_mux2_32bit_2135768_tb is
end cpu_mux2_32bit_2135768_tb;

architecture behavioral of cpu_mux2_32bit_2135768_tb is

signal tb_sel: std_logic;
    
signal tb_in00, tb_in01: std_logic_vector(31 downto 0);
    
signal tb_z: std_logic_vector(31 downto 0);

    component cpu_mux2_32bit_2135768
        port(
            sel: in std_logic;
    
            in00, in01: in std_logic_vector(31 downto 0);
    
            z: out std_logic_vector(31 downto 0)
            );
    end component;

begin
    
    uut: cpu_mux2_32bit_2135768 
        port map(
            sel => tb_sel,

            in00 => tb_in00,
            in01 => tb_in01,
            
            z => tb_z
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_in00 <= "00000001010001100000010000001000";
		tb_in01 <= "00000001010001100000010000001001";
		
		tb_sel <= '0';
		
		wait for 10ns;
		tb_sel <= '1';
     end process;

end behavioral;