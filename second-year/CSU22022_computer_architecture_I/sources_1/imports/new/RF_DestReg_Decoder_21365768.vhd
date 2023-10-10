library ieee, lcdf_vhdl;
use ieee.std_logic_1164.all;

entity rf_destreg_decoder_21365768 is
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
end rf_destreg_decoder_21365768;

architecture behavioral of rf_destreg_decoder_21365768 is

constant gate_delay: time:= 5ns;

begin
    d00<= ((not a00) and (not a01) and (not a02) and (not a03) and (not a04)) after gate_delay; -- 00000
    d01<= ((not a00) and (not a01) and (not a02) and (not a03) and a04) after gate_delay;       -- 00001
    d02<= ((not a00) and (not a01) and (not a02) and a03 and (not a04)) after gate_delay;       -- 00010
    d03<= ((not a00) and (not a01) and (not a02) and a03 and a04) after gate_delay;             -- 00011

    d04<= ((not a00) and (not a01) and a02 and (not a03) and (not a04)) after gate_delay;       -- 00100
    d05<= ((not a00) and (not a01) and a02 and (not a03) and  a04) after gate_delay;            -- 00101
    d06<= ((not a00) and (not a01) and a02 and a03 and (not a04)) after gate_delay;             -- 00110
    d07<= ((not a00) and (not a01) and a02 and a03 and a04) after gate_delay;                   -- 00111

    d08<= ((not a00) and a01 and (not a02) and (not a03) and (not a04)) after gate_delay;       -- 01000
    d09<= ((not a00) and a01 and (not a02) and (not a03) and a04) after gate_delay;             -- 01001
    d10<= ((not a00) and a01 and (not a02) and a03 and (not a04)) after gate_delay;             -- 01010
    d11<= ((not a00) and a01 and (not a02) and a03 and a04) after gate_delay;                   -- 01011

    d12<= ((not a00) and a01 and a02 and (not a03) and (not a04)) after gate_delay;             -- 01100
    d13<= ((not a00) and a01 and a02 and (not a03) and a04) after gate_delay;                   -- 01101
    d14<= ((not a00) and a01 and a02 and a03 and (not a04)) after gate_delay;                   -- 01110
    d15<= ((not a00) and a01 and a02 and a03 and a04) after gate_delay;                         -- 01111

    d16<= (a00 and (not a01) and (not a02) and (not a03) and (not a04)) after gate_delay;       -- 10000
    d17<= (a00 and (not a01) and (not a02) and (not a03) and a04) after gate_delay;             -- 10001
    d18<= (a00 and (not a01) and (not a02) and a03 and (not a04)) after gate_delay;             -- 10010
    d19<= (a00 and (not a01) and (not a02) and a03 and a04) after gate_delay;                   -- 10011

    d20<= (a00 and (not a01) and a02 and (not a03) and (not a04)) after gate_delay;             -- 10100
    d21<= (a00 and (not a01) and a02 and (not a03) and a04) after gate_delay;                   -- 10101
    d22<= (a00 and (not a01) and a02 and a03 and (not a04)) after gate_delay;                   -- 10110
    d23<= (a00 and (not a01) and a02 and a03 and a04) after gate_delay;                         -- 10111

    d24<= (a00 and a01 and (not a02) and (not a03) and (not a04)) after gate_delay;             -- 11000
    d25<= (a00 and a01 and (not a02) and (not a03) and a04) after gate_delay;                   -- 11001
    d26<= (a00 and a01 and (not a02) and a03 and (not a04)) after gate_delay;                   -- 11010
    d27<= (a00 and a01 and (not a02) and a03 and a04) after gate_delay;                         -- 11011

    d28<= (a00 and a01 and a02 and (not a03) and (not a04)) after gate_delay;                   -- 11100
    d29<= (a00 and a01 and a02 and (not a03) and a04) after gate_delay;                         -- 11101
    d30<= (a00 and a01 and a02 and a03 and (not a04)) after gate_delay;                         -- 11110
    d31<= (a00 and a01 and a02 and a03 and a04) after gate_delay;                               -- 11111
end behavioral;