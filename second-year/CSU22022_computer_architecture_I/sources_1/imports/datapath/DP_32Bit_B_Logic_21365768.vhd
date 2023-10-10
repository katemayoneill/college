library ieee;
use ieee.std_logic_1164.all;
entity dp_32bit_b_logic_21365768 is
    port( 
        s00, s01: in std_logic;
        b: in std_logic_vector(31 downto 0);

        y: out std_logic_vector(31 downto 0)
        );
end dp_32bit_b_logic_21365768;

architecture behavioral of dp_32bit_b_logic_21365768 is
component dp_singlebit_b_logic_21365768
    port( 
        s00: in std_logic;
        s01: in std_logic;
        b: in std_logic;

        y: out std_logic
        );
end component;
begin
    bit00: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(0),

            y => y(0)
            );
        
    bit01: dp_singlebit_b_logic_21365768
            port map( 
                s00 => s00,
                s01 => s01,
                b => b(1),
    
                y => y(1)
                );

    bit02: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(2),

            y => y(2)
            );

    bit03: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(3),

            y => y(3)
            );

    bit04: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(4),

            y => y(4)
            );

    bit05: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(5),

            y => y(5)
            );

    bit06: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(6),

            y => y(6)
            );

    bit07: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(7),

            y => y(7)
            );

    bit08: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(8),

            y => y(8)
            );

    bit09: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(9),

            y => y(9)
            );

    bit10: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(10),

            y => y(10)
            );

    bit11: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(11),

            y => y(11)
            );

    bit12: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(12),

            y => y(12)
            );

    bit13: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(13),

            y => y(13)
            );

    bit14: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(14),

            y => y(14)
            );

    bit15: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(15),

            y => y(15)
            );

    bit16: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(16),

            y => y(16)
            );

    bit17: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(17),

            y => y(17)
            );

    bit18: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(18),

            y => y(18)
            );

    bit19: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(19),

            y => y(19)
            );

    bit20: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(20),

            y => y(20)
            );

    bit21: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(21),

            y => y(21)
            );

    bit22: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(22),

            y => y(22)
            );

    bit23: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(23),

            y => y(23)
            );

    bit24: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(24),

            y => y(24)
            );

    bit25: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(25),

            y => y(25)
            );

    bit26: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(26),

            y => y(26)
            );

    bit27: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(27),

            y => y(27)
            );

    bit28: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(28),

            y => y(28)
            );

    bit29: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(29),

            y => y(29)
            );

    bit30: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(30),

            y => y(30)
            );

    bit31: dp_singlebit_b_logic_21365768
        port map( 
            s00 => s00,
            s01 => s01,
            b => b(31),

            y => y(31)
            );

end behavioral;
