library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all;

entity rf_destreg_decoder_21365768_tb is
end rf_destreg_decoder_21365768_tb;

architecture behavioral of rf_destreg_decoder_21365768_tb is

signal a00, a01, a02, a03, a04: std_logic;

signal d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15, 
        d16, d17, d18, d19,
        d20, d21, d22, d23, 
        d24, d25, d26, d27,
        d28, d29, d30, d31: std_logic;

component rf_destreg_decoder_21365768
    port(
        a00, a01, a02, a03, a04: in std_logic;

        d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15, 
        d16, d17, d18, d19,
        d20, d21, d22, d23, 
        d24, d25, d26, d27,
        d28, d29, d30, d31: out std_logic
        );
end component;

begin
    uut: rf_destreg_decoder_21365768 
        port map(
			a00 => a00,
            a01 => a01,
            a02 => a02,
            a03 => a03,
            a04 => a04,


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
            d15 => d15,

            d16 => d16,
            d17 => d17,
            d18 => d18,
            d19 => d19,

            d20 => d20,
            d21 => d21,
            d22 => d22,
            d23 => d23,

            d24 => d24,
            d25 => d25,
            d26 => d26,
            d27 => d27,

            d28 => d28,
            d29 => d29,
            d30 => d30,
            d31 => d31
            );
    
    stimulus: 
    process begin
        wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
		a04 <= '0';
		

		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		a04 <= '0';
		
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		a04 <= '1';
		
	   wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		a04 <= '0';
		

		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		a04 <= '1';
		
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		a04 <= '1';
	
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '0';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '0';
		a03 <= '1';
		a04 <= '1';
		
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '0';
		a02 <= '1';
		a03 <= '1';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '0';
		a03 <= '1';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '0';
		a04 <= '1';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
		a04 <= '0';
		
		wait for 10ns;
		a00 <= '1';
		a01 <= '1';
		a02 <= '1';
		a03 <= '1';
		a04 <= '1';
	
    end process;
end behavioral;