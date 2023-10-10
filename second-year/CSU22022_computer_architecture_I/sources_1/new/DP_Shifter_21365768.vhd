library ieee;
use ieee.std_logic_1164.all;

entity dp_shifter_21365768 is
    port(
        b: in std_logic_vector(31 downto 0);
        s01, s02: in std_logic;
        g: out std_logic_vector(31 downto 0);
        c: out std_logic
        );
end dp_shifter_21365768;

architecture behavioral of dp_shifter_21365768 is
component cpu_mux3_1bit_2135768
    port(
        bi, s01, s02, slbi, srbi: in std_logic;
        gi: out std_logic
        );
end component;

component dp_shiftercflagmux2_1bit_21365768
    port(
        lsb, msb, s01, s02: in std_logic;
        c: out std_logic
        );
end component;

begin
bit00: cpu_mux3_1bit_2135768
port map(
    bi => b(0),
    s01 => s01,
    s02 => s02,
    slbi => '0',
    srbi => b(1),
    gi => g(0)
    );
    
bit01: cpu_mux3_1bit_2135768
port map(
    bi => b(1),
    s01 => s01,
    s02 => s02,
    slbi => b(0),
    srbi => b(2),
    gi => g(1)
    );
    
bit02: cpu_mux3_1bit_2135768
port map(
    bi => b(2),
    s01 => s01,
    s02 => s02,
    slbi => b(1),
    srbi => b(3),
    gi => g(2)
    );
    
bit03: cpu_mux3_1bit_2135768
port map(
    bi => b(3),
    s01 => s01,
    s02 => s02,
    slbi => b(2),
    srbi => b(4),
    gi => g(3)
    );
    
 bit04: cpu_mux3_1bit_2135768
port map(
    bi => b(4),
    s01 => s01,
    s02 => s02,
    slbi => b(3),
    srbi => b(5),
    gi => g(4)
    );
    
bit05: cpu_mux3_1bit_2135768
port map(
    bi => b(5),
    s01 => s01,
    s02 => s02,
    slbi => b(4),
    srbi => b(6),
    gi => g(5)
    );
    
bit06: cpu_mux3_1bit_2135768
port map(
    bi => b(6),
    s01 => s01,
    s02 => s02,
    slbi => b(5),
    srbi => b(7),
    gi => g(6)
    );
    
bit07: cpu_mux3_1bit_2135768
port map(
    bi => b(7),
    s01 => s01,
    s02 => s02,
    slbi => b(6),
    srbi => b(8),
    gi => g(7)
    );
    
bit08: cpu_mux3_1bit_2135768
port map(
    bi => b(8),
    s01 => s01,
    s02 => s02,
    slbi => b(7),
    srbi => b(9),
    gi => g(8)
    );
    
bit09: cpu_mux3_1bit_2135768
port map(
    bi => b(9),
    s01 => s01,
    s02 => s02,
    slbi => b(8),
    srbi => b(10),
    gi => g(9)
    );
    
bit10: cpu_mux3_1bit_2135768
port map(
    bi => b(10),
    s01 => s01,
    s02 => s02,
    slbi => b(9),
    srbi => b(11),
    gi => g(10)
    );
    
bit11: cpu_mux3_1bit_2135768
port map(
    bi => b(11),
    s01 => s01,
    s02 => s02,
    slbi => b(10),
    srbi => b(12),
    gi => g(11)
    );
    
bit12: cpu_mux3_1bit_2135768
port map(
    bi => b(12),
    s01 => s01,
    s02 => s02,
    slbi => b(11),
    srbi => b(13),
    gi => g(12)
    );
    
bit13: cpu_mux3_1bit_2135768
port map(
    bi => b(13),
    s01 => s01,
    s02 => s02,
    slbi => b(12),
    srbi => b(14),
    gi => g(13)
    );
    
bit14: cpu_mux3_1bit_2135768
port map(
    bi => b(14),
    s01 => s01,
    s02 => s02,
    slbi => b(13),
    srbi => b(15),
    gi => g(14)
    );
    
bit15: cpu_mux3_1bit_2135768
port map(
    bi => b(15),
    s01 => s01,
    s02 => s02,
    slbi => b(14),
    srbi => b(16),
    gi => g(15)
    );
    
bit16: cpu_mux3_1bit_2135768
port map(
    bi => b(16),
    s01 => s01,
    s02 => s02,
    slbi => b(15),
    srbi => b(17),
    gi => g(16)
    );
    
bit17: cpu_mux3_1bit_2135768
port map(
    bi => b(17),
    s01 => s01,
    s02 => s02,
    slbi => b(16),
    srbi => b(18),
    gi => g(17)
    );
    
bit18: cpu_mux3_1bit_2135768
port map(
    bi => b(18),
    s01 => s01,
    s02 => s02,
    slbi => b(17),
    srbi => b(19),
    gi => g(18)
    );
    
bit19: cpu_mux3_1bit_2135768
port map(
    bi => b(19),
    s01 => s01,
    s02 => s02,
    slbi => b(18),
    srbi => b(20),
    gi => g(19)
    );
    
bit20: cpu_mux3_1bit_2135768
port map(
    bi => b(20),
    s01 => s01,
    s02 => s02,
    slbi => b(19),
    srbi => b(21),
    gi => g(20)
    );
    
bit21: cpu_mux3_1bit_2135768
port map(
    bi => b(21),
    s01 => s01,
    s02 => s02,
    slbi => b(20),
    srbi => b(22),
    gi => g(21)
    );
    
bit22: cpu_mux3_1bit_2135768
port map(
    bi => b(22),
    s01 => s01,
    s02 => s02,
    slbi => b(21),
    srbi => b(23),
    gi => g(22)
    );
    
bit23: cpu_mux3_1bit_2135768
port map(
    bi => b(23),
    s01 => s01,
    s02 => s02,
    slbi => b(22),
    srbi => b(24),
    gi => g(23)
    );
    
bit24: cpu_mux3_1bit_2135768
port map(
    bi => b(24),
    s01 => s01,
    s02 => s02,
    slbi => b(23),
    srbi => b(25),
    gi => g(24)
    );
    
bit25: cpu_mux3_1bit_2135768
port map(
    bi => b(25),
    s01 => s01,
    s02 => s02,
    slbi => b(24),
    srbi => b(26),
    gi => g(25)
    );
    
bit26: cpu_mux3_1bit_2135768
port map(
    bi => b(26),
    s01 => s01,
    s02 => s02,
    slbi => b(25),
    srbi => b(27),
    gi => g(26)
    );
    
bit27: cpu_mux3_1bit_2135768
port map(
    bi => b(27),
    s01 => s01,
    s02 => s02,
    slbi => b(26),
    srbi => b(28),
    gi => g(27)
    );
    
bit28: cpu_mux3_1bit_2135768
port map(
    bi => b(28),
    s01 => s01,
    s02 => s02,
    slbi => b(27),
    srbi => b(29),
    gi => g(28)
    );
    
bit29: cpu_mux3_1bit_2135768
port map(
    bi => b(29),
    s01 => s01,
    s02 => s02,
    slbi => b(28),
    srbi => b(30),
    gi => g(29)
    );
    
bit30: cpu_mux3_1bit_2135768
port map(
    bi => b(30),
    s01 => s01,
    s02 => s02,
    slbi => b(29),
    srbi => b(31),
    gi => g(30)
    );

bit31: cpu_mux3_1bit_2135768
port map(
    bi => b(31),
    s01 => s01,
    s02 => s02,
    slbi => b(30),
    srbi => '0',
    gi => g(31)
    );
    
cflagmux: dp_shiftercflagmux2_1bit_21365768
port map(
    lsb => b(0),
    msb => b(31),
    s01 => s01,
    s02 => s02,
    c => c
    );
end behavioral;