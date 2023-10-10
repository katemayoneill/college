library ieee;
use ieee.std_logic_1164.all;

entity dp_zerodetection_21365768 is
    port(
        muxf_to_f: in std_logic_vector(31 downto 0);
        z: out std_logic
        );
end dp_zerodetection_21365768;

architecture behavioral of dp_zerodetection_21365768 is
    constant gate_delay: time:= 5ns;
begin
      z <= '1'   after gate_delay when muxf_to_f = "00000000000000000000000000000000" else
           '0'   after gate_delay;


end behavioral;