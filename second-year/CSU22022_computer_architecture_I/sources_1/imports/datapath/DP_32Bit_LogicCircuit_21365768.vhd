library ieee;
use ieee.std_logic_1164.all;
entity dp_32bit_logiccircuit_21365768 is
    port( 
        s00, s01: in std_logic;

        a, b: in std_logic_vector(31 downto 0);
    
        g: out std_logic_vector(31 downto 0)
        );
end dp_32bit_logiccircuit_21365768;

architecture behavioral of dp_32bit_logiccircuit_21365768 is
component dp_singlebit_logiccircuit_21365768
    port( 
        a, b, s00, s01: in std_logic;

        g: out std_logic
        );
end component;
begin
bit00: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(0),
        b => b(0),
        g => g(0)
    );

bit01: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(1),
        b => b(1),
        g => g(1)
    );

bit02: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(2),
        b => b(2),
        g => g(2)
    );

    bit03: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(3),
        b => b(3),
        g => g(3)
    );

    bit04: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(4),
        b => b(4),
        g => g(4)
    );

    bit05: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(5),
        b => b(5),
        g => g(5)
    );

    bit06: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(6),
        b => b(6),
        g => g(6)
    );

    bit07: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(7),
        b => b(7),
        g => g(7)
    );

    bit08: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(8),
        b => b(8),
        g => g(8)
    );

    bit09: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(9),
        b => b(9),
        g => g(9)
    );

    bit10: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(10),
        b => b(10),
        g => g(10)
    );

    bit11: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(11),
        b => b(11),
        g => g(11)
    );

    bit12: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(12),
        b => b(12),
        g => g(12)
    );

    bit13: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(13),
        b => b(13),
        g => g(13)
    );

    bit14: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(14),
        b => b(14),
        g => g(14)
    );


    bit15: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(15),
        b => b(15),
        g => g(15)
    );

    bit16: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(16),
        b => b(16),
        g => g(16)
    );

    bit17: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(17),
        b => b(17),
        g => g(17)
    );

    bit18: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(18),
        b => b(18),
        g => g(18)
    );

    bit19: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(19),
        b => b(19),
        g => g(19)
    );

    bit20: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(20),
        b => b(20),
        g => g(20)
    );

    bit21: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(21),
        b => b(21),
        g => g(21)
    );

    bit22: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(22),
        b => b(22),
        g => g(22)
    );

    bit23: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(23),
        b => b(23),
        g => g(23)
    );

    bit24: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(24),
        b => b(24),
        g => g(24)
    );

    bit25: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(25),
        b => b(25),
        g => g(25)
    );

    bit26: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(26),
        b => b(26),
        g => g(26)
    );

    bit27: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(27),
        b => b(27),
        g => g(27)
    );

    bit28: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(28),
        b => b(28),
        g => g(28)
    );

    bit29: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(29),
        b => b(29),
        g => g(29)
    );

    bit30: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(30),
        b => b(30),
        g => g(30)
    );

    bit31: dp_singlebit_logiccircuit_21365768
    port map(
        s00 => s00,
        s01 => s01,
        a => a(31),
        b => b(31),
        g => g(31)
    );

  
end behavioral;