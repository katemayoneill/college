library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_arith.all, ieee.std_logic_unsigned.all;
entity dp_singlebit_logiccircuit_21365768 is
    port( 
        a, b, s00, s01: in std_logic;
    
        g: out std_logic
        );
end dp_singlebit_logiccircuit_21365768;

architecture behavioral of dp_singlebit_logiccircuit_21365768 is
begin
    g <= (a and b) after 5ns when s00='0' and s01='0' else
         (a or b) after 5ns when s00 ='1' and s01 = '0' else
         (a xor b) after 5ns when s00 ='0' and s01 = '1' else
         (not a) after 5ns when s00 ='1' and s01 = '1';
end behavioral;