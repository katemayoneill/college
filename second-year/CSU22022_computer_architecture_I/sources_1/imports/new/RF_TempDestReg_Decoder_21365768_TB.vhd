library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all;

entity rf_tempdestreg_decoder_21365768_tb is
end rf_tempdestreg_decoder_21365768_tb;

architecture behavioral of rf_tempdestreg_decoder_21365768_tb is

signal a00, a01, a02, a03: std_logic;

signal d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15: std_logic;

component rf_tempdestreg_decoder_21365768 
    port(
        a00, a01, a02, a03: in std_logic;

        d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15: out std_logic
        );
end component;

begin
    uut: rf_tempdestreg_decoder_21365768 
        port map(
            a00 => a00,
            a01 => a01,
            a02 => a02,
            a03 => a03,


            d00 => d00,
            d01 => d01,
            d02 => d02,
            d03 => d03,

            d04 => d04,
            d05 => d05,
            d06 => d06,
            d07 => d07,

            d08 => d08,
            d09 => d09,
            d10 => d10,
            d11 => d11,

            d12 => d12,
            d13 => d13,
            d14 => d14,
            d15 => d15
            );
    
    stimulus: 
    process begin		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
	
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		
	   wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
	
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
	
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
		
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
	
    end process;
end behavioral;