library ieee;
use ieee.std_logic_1164.all;
entity dp_arithmeticlogicunit_21365768 is
    port(
        a: in std_logic_vector(31 downto 0);
        c_in: in std_logic;
        b: in std_logic_vector(31 downto 0);
        s00, s01, s02: in std_logic;
        
        c, v: out std_logic;
        g: out std_logic_vector(31 downto 0)
        );
end dp_arithmeticlogicunit_21365768;

architecture behavioral of dp_arithmeticlogicunit_21365768 is

signal adder_b, alumux_in00, alumux_in01: std_logic_vector(31 downto 0);
   
component dp_32bit_b_logic_21365768
        port( 
        s00, s01: in std_logic;
        b: in std_logic_vector(31 downto 0);

        y: out std_logic_vector(31 downto 0)
        );
end component;

component dp_ripplecarryadder32bit_21365768
     port( 
        a: in std_logic_vector(31 downto 0);
        b : in std_logic_vector(31 downto 0);
        c_in : in std_logic;
        sum : out std_logic_vector(31 downto 0);
        c_out : out std_logic;
        v : out std_logic
        ); 
end component;

component dp_32bit_logiccircuit_21365768
    port( 
        s00, s01: in std_logic;

        a, b: in std_logic_vector(31 downto 0);
    
        g: out std_logic_vector(31 downto 0)
        );
end component;

component cpu_mux2_32bit_2135768
    port(
        sel: in std_logic;
        
        in00, in01: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end component;

begin

blogic: dp_32bit_b_logic_21365768
    port map(
        b => b,
        s00 => s00,
        s01 => s01,
        y => adder_b
        );
    
adder: dp_ripplecarryadder32bit_21365768
    port map(
        a => a,
        b => adder_b,
        c_in => c_in,
        c_out => c,
        sum => alumux_in00,
        v => v
        );
    
logiccircuit: dp_32bit_logiccircuit_21365768
    port map(
        a => a,
        b => b,
        s00 => s00,
        s01 => s01,
        g => alumux_in01
        );
    
alumux: cpu_mux2_32bit_2135768
    port map(
        in00 => alumux_in00,
        in01 => alumux_in01,
        sel => s02,
        z => g
        );

end behavioral;