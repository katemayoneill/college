library ieee;
use ieee.std_logic_1164.all;
entity dp_fulladder_21365768 is
    port(
        in01, in02, c_in:in std_logic;
        sum, c_out:out std_logic
        );
end dp_fulladder_21365768;
architecture behavioral of dp_fulladder_21365768 is
signal s01,s02,s03: std_logic;
constant gate_delay: time := 5 ns;
begin
    s01 <= (in01 xor in02) after gate_delay;
    s02 <= (c_in and s01) after gate_delay;
    s03 <= (in01 and in02) after gate_delay;
    sum <= (s01 xor c_in) after gate_delay;
    c_out <= (s02 or s03) after gate_delay;
end behavioral;