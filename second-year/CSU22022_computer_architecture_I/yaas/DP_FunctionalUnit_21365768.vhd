library ieee;
use ieee.std_logic_1164.all;

entity dp_functionalunit_21365768 is
    port(
        a, b: in std_logic_vector(31 downto 0);
        fs: in std_logic_vector(4 downto 0);
        c, n, z, v: out std_logic;
        f: out std_logic_vector(31 downto 0)
        );
end dp_functionalunit_21365768;

architecture behavioral of dp_functionalunit_21365768 is

signal c_shift, c_alu, fs4: std_logic;
signal in00, in01, sel, muxf_z: std_logic_vector(31 downto 0);

component dp_shifter_21365768
    port(
        b: in std_logic_vector(31 downto 0);
        s01, s02: in std_logic;
        g: out std_logic_vector(31 downto 0);
        c: out std_logic
        );
end component;

component dp_arithmeticlogicunit_21365768
    port(
        a: in std_logic_vector(31 downto 0);
        c_in: in std_logic;
        b: in std_logic_vector(31 downto 0);
        s00, s01, s02: in std_logic;
        
        c, v: out std_logic;
        g: out std_logic_vector(31 downto 0)
        );
end component;

component cpu_mux2_32bit_21365768
    port(
        sel: in std_logic;
        
        in00, in01: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end component;

component dp_cflagmux2_1bit_21365768
    port(
        c_alu, c_shift, fs4: in std_logic;
        c: out std_logic
        );
end component;

component dp_zerodetection_21365768
    port(
        muxf_to_f: in std_logic_vector(31 downto 0);
        z: out std_logic
        );
end component;

begin

shifter: dp_shifter_21365768
port map(
    b => b,
    s01 => fs(2),
    s02 => fs(3),
    c => c_shift,
    g => in01
    );

alu: dp_arithmeticlogicunit_21365768
port map(
    a => a,
    b => b,
    c_in => fs(0),
    s00 => fs(1),
    s01 => fs(2),
    s02 => fs(3),
    c => c_alu,
    g => in00,
    v => v
    );

muxf: cpu_mux2_32bit_21365768
port map(
    in00 => in00,
    in01 => in01,
    sel => fs(04),
    z => muxf_z
    );

c_flag: dp_cflagmux2_1bit_21365768
port map(
    c_alu => c_alu,
    c_shift => c_shift,
    fs4 => fs(4),
    c => c
    );

z_flag: dp_zerodetection_21365768
port map(
    muxf_to_f => muxf_z,
    z => z
    );

f <= muxf_z;
n <= muxf_z(3);

end behavioral;