library ieee;
use ieee.std_logic_1164.all;

entity cpu_mux3_1bit_2135768_tb is
end cpu_mux3_1bit_2135768_tb;

architecture behavioral of cpu_mux3_1bit_2135768_tb is

signal tb_bi, tb_s01, tb_s02, tb_slbi, tb_srbi, tb_gi: std_logic;

    component cpu_mux3_1bit_2135768
        port(
            bi, s01, s02, slbi, srbi: in std_logic;
            gi: out std_logic
            );
    end component;

begin
    
    uut: cpu_mux3_1bit_2135768
        port map(
            bi => tb_bi,
            s01 => tb_s01,
            s02 => tb_s02,
            slbi => tb_slbi,
            srbi => tb_srbi,
            gi => tb_gi
            );

    stimulus:
    process begin
        wait for 10ns;
        tb_s01 <= '1';
	    tb_s02 <= '0';
	    tb_slbi <= '1';
	    tb_bi <= '0';
	    tb_srbi <= '0';
	    
	    wait for 10ns;
        tb_s01 <= '0';
	    tb_s02 <= '1';
	    tb_slbi <= '0';
	    tb_bi <= '0';
	    tb_srbi <= '1';
	    
	    wait for 10ns;
        tb_s01 <= '0';
	    tb_s02 <= '0';
	    tb_slbi <= '1';
	    tb_bi <= '0';
	    tb_srbi <= '1';
	    
	    wait for 10ns;
        tb_s01 <= '1';
	    tb_s02 <= '1';
	    tb_slbi <= '1';
	    tb_bi <= '0';
	    tb_srbi <= '1';
	     
	    
     end process;

end behavioral;