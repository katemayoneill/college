library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all;

entity rf_tempdestreg_decoder_21365768 is
    port(
        a00, a01, a02, a03: in std_logic;

        d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15: out std_logic
        );
end rf_tempdestreg_decoder_21365768;

architecture behavioral of rf_tempdestreg_decoder_21365768 is

constant gate_delay: time:= 5ns;

begin
    d00 <= ((not a00) and (not a01) and (not a02) and (not a03)) after 5 ns; -- 0000
    d01 <= ((not a00) and (not a01) and (not a02) and a03) after 5 ns;       -- 0001
    d02 <= ((not a00) and (not a01) and a02 and (not a03)) after 5 ns;       -- 0010
    d03 <= ((not a00) and (not a01) and a02 and a03) after 5 ns;             -- 0011

    d04 <= ((not a00) and a01 and (not a02) and (not a03)) after 5 ns;       -- 0100
    d05 <= ((not a00) and a01 and (not a02) and  a03) after 5 ns;            -- 0101
    d06 <= ((not a00) and a01 and a02 and (not a03)) after 5 ns;             -- 0110
    d07 <= ((not a00) and a01 and a02 and a03) after 5 ns;                   -- 0111

    d08 <= (a00 and (not a01) and (not a02) and (not a03)) after 5 ns;       -- 1000
    d09 <= (a00 and (not a01) and (not a02) and a03) after 5 ns;             -- 1001
    d10 <= (a00 and (not a01) and a02 and (not a03)) after 5 ns;             -- 1010
    d11 <= (a00 and (not a01) and a02 and a03) after 5 ns;                   -- 1011

    d12 <= (a00 and a01 and (not a02) and (not a03)) after 5 ns;             -- 1100
    d13 <= (a00 and a01 and (not a02) and a03) after 5 ns;                   -- 1101
    d14 <= (a00 and a01 and a02 and (not a03)) after 5 ns;                   -- 1110
    d15 <= (a00 and a01 and a02 and a03) after 5 ns;                         -- 1110
end behavioral;