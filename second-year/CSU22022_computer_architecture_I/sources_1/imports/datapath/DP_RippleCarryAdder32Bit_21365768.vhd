library ieee;
use ieee.std_logic_1164.all;

entity dp_ripplecarryadder32bit_21365768 is
    port( 
        a: in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        c_in : in std_logic;
        sum : out std_logic_vector(31 downto 0);
        c_out : out std_logic;
        v : out std_logic
        );        
end dp_ripplecarryadder32bit_21365768;

architecture behavioral of dp_ripplecarryadder32bit_21365768 is

component dp_fulladder_21365768    
    port(
         in01: in std_logic;
         in02: in std_logic;
         c_in: in std_logic;
         sum: out std_logic;
         c_out: out std_logic
        );
    end component;
    
signal c00_to_c01, c01_to_c02, c02_to_c03, c03_to_c04, c04_to_c05, 
       c05_to_c06, c06_to_c07, c07_to_c08, c08_to_c09, c09_to_c10,
       c10_to_c11, c11_to_c12, c12_to_c13, c13_to_c14, c14_to_c15,
       c15_to_c16, c16_to_c17, c17_to_c18, c18_to_c19, c19_to_c20,
       c20_to_c21, c21_to_c22, c22_to_c23, c23_to_c24, c24_to_c25,
       c25_to_c26, c26_to_c27, c27_to_c28, c28_to_c29, c29_to_c30, 
       c30_to_c31, c31_to_cout: std_logic;    

begin

    -- instantiate full adder bit00
    bit00: dp_fulladder_21365768 
        port map(
            in01 => a(0),
            in02 => b(0),
            c_in => c_in,
            sum => sum(0),
            c_out => c00_to_c01
            );
    
    -- instantiate full adder bit01
    bit01: dp_fulladder_21365768 
        port map(
            in01 => a(1),
            in02 => b(1),
            c_in => c00_to_c01,
            sum => sum(1),
            c_out => c01_to_c02
            );
    
    -- instantiate full adder bit02
    bit02: dp_fulladder_21365768 
        port map(
            in01 => a(2),
            in02 => b(2),
            c_in => c01_to_c02,
            sum => sum(2),
            c_out => c02_to_c03
            );
    
    -- instantiate full adder bit03
    bit03: dp_fulladder_21365768 
        port map(
            in01 => a(3),
            in02 => b(3),
            c_in => c02_to_c03,
            sum => sum(3),
            c_out => c03_to_c04
            );

    -- instantiate full adder bit04
    bit04: dp_fulladder_21365768 
        port map(
            in01 => a(4),
            in02 => b(4),
            c_in => c03_to_c04,
            sum => sum(4),
            c_out => c04_to_c05
            );

    -- instantiate full adder bit05
    bit05: dp_fulladder_21365768 
        port map(
            in01 => a(5),
            in02 => b(5),
            c_in => c04_to_c05,
            sum => sum(5),
            c_out => c05_to_c06
            );

    -- instantiate full adder bit06
    bit06: dp_fulladder_21365768 
        port map(
            in01 => a(6),
            in02 => b(6),
            c_in => c05_to_c06,
            sum => sum(6),
            c_out => c06_to_c07
            );

    -- instantiate full adder bit07
    bit07: dp_fulladder_21365768 
        port map(
            in01 => a(7),
            in02 => b(7),
            c_in => c06_to_c07,
            sum => sum(7),
            c_out => c07_to_c08
            );

    -- instantiate full adder bit08
    bit08: dp_fulladder_21365768 
        port map(
            in01 => a(8),
            in02 => b(8),
            c_in => c07_to_c08,
            sum => sum(8),
            c_out => c08_to_c09
            );

    -- instantiate full adder bit09
    bit09: dp_fulladder_21365768 
        port map(
            in01 => a(9),
            in02 => b(9),
            c_in => c08_to_c09,
            sum => sum(9),
            c_out => c09_to_c10
            );

    -- instantiate full adder bit10
    bit10: dp_fulladder_21365768 
        port map(
            in01 => a(10),
            in02 => b(10),
            c_in => c09_to_c10,
            sum => sum(10),
            c_out => c10_to_c11
            );

    -- instantiate full adder bit11
    bit11: dp_fulladder_21365768 
        port map(
            in01 => a(11),
            in02 => b(11),
            c_in => c10_to_c11,
            sum => sum(11),
            c_out => c11_to_c12
            );

    -- instantiate full adder bit12
    bit12: dp_fulladder_21365768 
        port map(
            in01 => a(12),
            in02 => b(12),
            c_in => c11_to_c12,
            sum => sum(12),
            c_out => c12_to_c13
            );

    -- instantiate full adder bit13
    bit13: dp_fulladder_21365768 
        port map (
            in01 => a(13),
            in02 => b(13),
            c_in => c12_to_c13,
            sum => sum(13),
            c_out => c13_to_c14
            );

    -- instantiate full adder bit14
    bit14: dp_fulladder_21365768 
        port map(
            in01 => a(14),
            in02 => b(14),
            c_in => c13_to_c14,
            sum => sum(14),
            c_out => c14_to_c15
            );

    -- instantiate full adder bit15
    bit15: dp_fulladder_21365768 
        port map(
            in01 => a(15),
            in02 => b(15),
            c_in => c14_to_c15,
            sum => sum(15),
            c_out => c15_to_c16
            );

    -- instantiate full adder bit16
    bit16: dp_fulladder_21365768 
        port map(
            in01 => a(16),
            in02 => b(16),
            c_in => c15_to_c16,
            sum => sum(16),
            c_out => c16_to_c17
            );

    -- instantiate full adder bit17
    bit17: dp_fulladder_21365768 
        port map(
            in01 => a(17),
            in02 => b(17),
            c_in => c16_to_c17,
            sum => sum(17),
            c_out => c17_to_c18
            );

    -- instantiate full adder bit18
    bit18: dp_fulladder_21365768 
        port map(
            in01 => a(18),
            in02 => b(18),
            c_in => c17_to_c18,
            sum => sum(18),
            c_out => c18_to_c19
            );

    -- instantiate full adder bit19
    bit19: dp_fulladder_21365768 
        port map(
            in01 => a(19),
            in02 => b(19),
            c_in => c18_to_c19,
            sum => sum(19),
            c_out => c19_to_c20
            );

    -- instantiate full adder bit20
    bit20: dp_fulladder_21365768 
        port map(
            in01 => a(20),
            in02 => b(20),
            c_in => c19_to_c20,
            sum => sum(20),
            c_out => c20_to_c21
            );

    -- instantiate full adder bit21
    bit21: dp_fulladder_21365768 
        port map(
            in01 => a(21),
            in02 => b(21),
            c_in => c20_to_c21,
            sum => sum(21),
            c_out => c21_to_c22
            );

    -- instantiate full adder bit22
    bit22: dp_fulladder_21365768 
        port map(
            in01 => a(22),
            in02 => b(22),
            c_in => c21_to_c22,
            sum => sum(22),
            c_out => c22_to_c23
            );

    -- instantiate full adder bit23
    bit23: dp_fulladder_21365768 
        port map(
            in01 => a(23),
            in02 => b(23),
            c_in => c22_to_c23,
            sum => sum(23),
            c_out => c23_to_c24
            );

    -- instantiate full adder bit24
    bit24: dp_fulladder_21365768 
        port map(
            in01 => a(24),
            in02 => b(24),
            c_in => c23_to_c24,
            sum => sum(24),
            c_out => c24_to_c25
            );

    -- instantiate full adder bit25
    bit25: dp_fulladder_21365768 
        port map(
            in01 => a(25),
            in02 => b(25),
            c_in => c24_to_c25,
            sum => sum(25),
            c_out => c25_to_c26
            );

    -- instantiate full adder bit26
    bit26: dp_fulladder_21365768 
        port map(
            in01 => a(26),
            in02 => b(26),
            c_in => c25_to_c26,
            sum => sum(26),
            c_out => c26_to_c27
            );

    -- instantiate full adder bit27
    bit27: dp_fulladder_21365768 
        port map(
            in01 => a(27),
            in02 => b(27),
            c_in => c26_to_c27,
            sum => sum(27),
            c_out => c27_to_c28
            );

    -- instantiate full adder bit28
    bit28: dp_fulladder_21365768 
        port map(
            in01 => a(28),
            in02 => b(28),
            c_in => c27_to_c28,
            sum => sum(28),
            c_out => c28_to_c29
            );

    -- instantiate full adder bit29
    bit29: dp_fulladder_21365768 
        port map(
            in01 => a(29),
            in02 => b(29),
            c_in => c28_to_c29,
            sum => sum(29),
            c_out => c29_to_c30
            );

    -- instantiate full adder bit30
    bit30: dp_fulladder_21365768 
        port map(
            in01 => a(30),
            in02 => b(30),
            c_in => c29_to_c30,
            sum => sum(30),
            c_out => c30_to_c31
            );

    -- instantiate full adder bit31
    bit31: dp_fulladder_21365768 
        port map(
            in01 => a(31),
            in02 => b(31),
            c_in => c30_to_c31,
            sum => sum(31),
            c_out => c31_to_cout
            );

    

    -- carry and overflow 
    
    c_out <= c31_to_cout;
    
    v <= c31_to_cout xor c30_to_c31 after 5ns;  

end behavioral;
