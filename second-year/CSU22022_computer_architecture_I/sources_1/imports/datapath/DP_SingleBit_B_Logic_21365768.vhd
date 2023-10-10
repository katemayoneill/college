library ieee;
use ieee.std_logic_1164.all;
entity dp_singlebit_b_logic_21365768 is
    port( 
        s00, s01, b: in std_logic;
    
        y: out std_logic
        );
end dp_singlebit_b_logic_21365768;

architecture behavioral of dp_singlebit_b_logic_21365768 is
begin
   y <= ((s00 and b) or (s01 and (not b))) after 5 ns;
end behavioral;
