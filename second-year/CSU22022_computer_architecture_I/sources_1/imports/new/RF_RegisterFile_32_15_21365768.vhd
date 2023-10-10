library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_arith.all, ieee.std_logic_unsigned.all;

entity rf_registerfile_32_15_21365768 is
    port( 
        sa, sb: in std_logic_vector(4 downto 0);

        dr00, dr01, dr02, dr03, dr04,
        rw, clock: in std_logic;
        d: in std_logic_vector(31 downto 0);
        tb, ta: in std_logic_vector(3 downto 0);
        td00, td01, td02, td03: std_logic;

        b, a: out std_logic_vector(31 downto 0)
        );
end rf_registerfile_32_15_21365768;

architecture behavioral of rf_registerfile_32_15_21365768 is

signal d_reg00, d_reg01, d_reg02, d_reg03,
       d_reg04, d_reg05, d_reg06, d_reg07, 
       d_reg08, d_reg09, d_reg10, d_reg11, 
       d_reg12, d_reg13, d_reg14, d_reg15, 
       d_reg16, d_reg17, d_reg18, d_reg19,
       d_reg20, d_reg21, d_reg22, d_reg23, 
       d_reg24, d_reg25, d_reg26, d_reg27, 
       d_reg28, d_reg29, d_reg30, d_reg31: std_logic := '0';

signal load_reg00, load_reg01, load_reg02, load_reg03,
       load_reg04, load_reg05, load_reg06, load_reg07, 
       load_reg08, load_reg09, load_reg10, load_reg11, 
       load_reg12, load_reg13, load_reg14, load_reg15, 
       load_reg16, load_reg17, load_reg18, load_reg19,
       load_reg20, load_reg21, load_reg22, load_reg23, 
       load_reg24, load_reg25, load_reg26, load_reg27, 
       load_reg28, load_reg29, load_reg30, load_reg31: std_logic := '0';
       
signal d_tempreg00, d_tempreg01, d_tempreg02, d_tempreg03,
       d_tempreg04, d_tempreg05, d_tempreg06, d_tempreg07,
       d_tempreg08, d_tempreg09, d_tempreg10, d_tempreg11,
       d_tempreg12, d_tempreg13, d_tempreg14, d_tempreg15: std_logic := '0';

signal load_tempreg01, load_tempreg02, load_tempreg03,
       load_tempreg04, load_tempreg05, load_tempreg06, load_tempreg07,
       load_tempreg08, load_tempreg09, load_tempreg10, load_tempreg11,
       load_tempreg12, load_tempreg13, load_tempreg14, load_tempreg15: std_logic;

signal q_reg00, q_reg01, q_reg02, q_reg03, 
       q_reg04, q_reg05, q_reg06, q_reg07, 
       q_reg08, q_reg09, q_reg10, q_reg11, 
       q_reg12, q_reg13, q_reg14, q_reg15, 
       q_reg16, q_reg17, q_reg18, q_reg19, 
       q_reg20, q_reg21, q_reg22, q_reg23,
       q_reg24, q_reg25, q_reg26, q_reg27, 
       q_reg28, q_reg29, q_reg30, q_reg31: std_logic_vector(31 downto 0);

signal q_tempreg01, q_tempreg02, q_tempreg03, 
       q_tempreg04, q_tempreg05, q_tempreg06, q_tempreg07, 
       q_tempreg08, q_tempreg09, q_tempreg10, q_tempreg11, 
       q_tempreg12, q_tempreg13, q_tempreg14, q_tempreg15: std_logic_vector(31 downto 0);

signal in00_mux16a, in00_mux16b: std_logic_vector(31 downto 0);

component rf_destreg_decoder_21365768
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
end component;

component rf_tempdestreg_decoder_21365768
    port(
        a00, a01, a02, a03: in std_logic;

        d00, d01, d02, d03, 
        d04, d05, d06, d07,
        d08, d09, d10, d11,
        d12, d13, d14, d15: out std_logic
        );
end component;

component rf_register32bit_21365768
    port( 
        d : in std_logic_vector(31 downto 0);
        load : in std_logic;
        clk : in std_logic;
        q : out std_logic_vector(31 downto 0)
        );
end component;

component rf_mux32_32bit_2135768
    port(
        a: in std_logic_vector(4 downto 0);

        in00, in01, in02, in03, in04, 
        in05, in06, in07, in08, in09, 
        in10, in11, in12, in13, in14, 
        in15, in16, in17, in18, in19, 
        in20, in21, in22, in23, in24,
        in25, in26, in27, in28, in29,
        in30, in31: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end component;

component rf_mux16_32bit_2135768
    port(
        a: in std_logic_vector(3 downto 0);

        in00, in01, in02, in03, 
        in04, in05, in06, in07, 
        in08, in09, in10, in11, 
        in12, in13, in14, in15: in std_logic_vector(31 downto 0);

        z: out std_logic_vector(31 downto 0)
        );
end component;

begin
destreg_decoder: rf_destreg_decoder_21365768
    port map(
			a00 => dr00,
            a01 => dr01,
            a02 => dr02,
            a03 => dr03,
            a04 => dr04,


            d00 => d_reg00,
            d01 => d_reg01,
            d02 => d_reg02,
            d03 => d_reg03,

            d04 => d_reg04,
            d05 => d_reg05,
            d06 => d_reg06,
            d07 => d_reg07,

            d08 => d_reg08,
            d09 => d_reg09,
            d10 => d_reg10,
            d11 => d_reg11,

            d12 => d_reg12,
            d13 => d_reg13,
            d14 => d_reg14,
            d15 => d_reg15,

            d16 => d_reg16,
            d17 => d_reg17,
            d18 => d_reg18,
            d19 => d_reg19,

            d20 => d_reg20,
            d21 => d_reg21,
            d22 => d_reg22,
            d23 => d_reg23,

            d24 => d_reg24,
            d25 => d_reg25,
            d26 => d_reg26,
            d27 => d_reg27,

            d28 => d_reg28,
            d29 => d_reg29,
            d30 => d_reg30,
            d31 => d_reg31
            );

desttempreg_decoder: rf_tempdestreg_decoder_21365768
    port map(
            a00 => td00,
            a01 => td01,
            a02 => td02,
            a03 => td03,


            d00 => d_tempreg00,
            d01 => d_tempreg01,
            d02 => d_tempreg02,
            d03 => d_tempreg03,

            d04 => d_tempreg04,
            d05 => d_tempreg05,
            d06 => d_tempreg06,
            d07 => d_tempreg07,

            d08 => d_tempreg08,
            d09 => d_tempreg09,
            d10 => d_tempreg10,
            d11 => d_tempreg11,

            d12 => d_tempreg12,
            d13 => d_tempreg13,
            d14 => d_tempreg14,
            d15 => d_tempreg15
            );

register00: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg00,
        q => q_reg00
        );

register01: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg01,
        q => q_reg01
        );

register02: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg02,
        q => q_reg02
        );

register03: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg03,
        q => q_reg03
        );

register04: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg04,
        q => q_reg04
        );

register05: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg05,
        q => q_reg05
        );

register06: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg06,
        q => q_reg06
        );

register07: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg07,
        q => q_reg07
        );

register08: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg08,
        q => q_reg08
        );

register09: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg09,
        q => q_reg09
        );

register10: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg10,
        q => q_reg10
        );

register11: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg11,
        q => q_reg11
        );

register12: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg12,
        q => q_reg12
        );

register13: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg13,
        q => q_reg13
        );

register14: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg14,
        q => q_reg14
        );

register15: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg15,
        q => q_reg15
        );

register16: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg16,
        q => q_reg16
        );

register17: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg17,
        q => q_reg17
        );

register18: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg18,
        q => q_reg18
        );

register19: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg19,
        q => q_reg19
        );

register20: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg20,
        q => q_reg20
        );

register21: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg21,
        q => q_reg21
        );

register22: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg22,
        q => q_reg22
        );

register23: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg23,
        q => q_reg23
        );

register24: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg24,
        q => q_reg24
        );

register25: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg25,
        q => q_reg25
        );

register26: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg26,
        q => q_reg26
        );

register27: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg27,
        q => q_reg27
        );

register28: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg28,
        q => q_reg28
        );

register29: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg29,
        q => q_reg29
        );

register30: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg30,
        q => q_reg30
        );

register31: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_reg31,
        q => q_reg31
        );

tempreg01: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg01,
        q => q_tempreg01
        );

tempreg02: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg02,
        q => q_tempreg02
        );

tempreg03: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg03,
        q => q_tempreg03
        );

tempreg04: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg04,
        q => q_tempreg04
        );

tempreg05: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg05,
        q => q_tempreg05
        );

tempreg06: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg06,
        q => q_tempreg06
        );

tempreg07: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg07,
        q => q_tempreg07
        );

tempreg08: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg08,
        q => q_tempreg08
        );

tempreg09: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg09,
        q => q_tempreg09
        );

tempreg10: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg10,
        q => q_tempreg10
        );

tempreg11: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg11,
        q => q_tempreg11
        );

tempreg12: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg12,
        q => q_tempreg12
        );

tempreg13: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg13,
        q => q_tempreg13
        );

tempreg14: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg14,
        q => q_tempreg14
        );

tempreg15: rf_register32bit_21365768
    port map(
        d => d,
        clk => clock,
        load => load_tempreg15,
        q => q_tempreg15
        );

mux32_a: rf_mux32_32bit_2135768
    port map(
        a => sa,

        in00 => q_reg00,
        in01 => q_reg01,
        in02 => q_reg02,
        in03 => q_reg03,

        in04 => q_reg04,
        in05 => q_reg05,
        in06 => q_reg06,
        in07 => q_reg07,

        in08 => q_reg08,
        in09 => q_reg09,
        in10 => q_reg10,
        in11 => q_reg11,

        in12 => q_reg12,
        in13 => q_reg13,
        in14 => q_reg14,
        in15 => q_reg15,

        in16 => q_reg16,
        in17 => q_reg17,
        in18 => q_reg18,
        in19 => q_reg19,

        in20 => q_reg20,
        in21 => q_reg21,
        in22 => q_reg22,
        in23 => q_reg23,

        in24 => q_reg24,
        in25 => q_reg25,
        in26 => q_reg26,
        in27 => q_reg27,

        in28 => q_reg28,
        in29 => q_reg29,
        in30 => q_reg30,
        in31 => q_reg31,

        z => in00_mux16a
        );

mux32_b: rf_mux32_32bit_2135768
    port map(
        a => sb,

        in00 => q_reg00,
        in01 => q_reg01,
        in02 => q_reg02,
        in03 => q_reg03,

        in04 => q_reg04,
        in05 => q_reg05,
        in06 => q_reg06,
        in07 => q_reg07,

        in08 => q_reg08,
        in09 => q_reg09,
        in10 => q_reg10,
        in11 => q_reg11,

        in12 => q_reg12,
        in13 => q_reg13,
        in14 => q_reg14,
        in15 => q_reg15,

        in16 => q_reg16,
        in17 => q_reg17,
        in18 => q_reg18,
        in19 => q_reg19,

        in20 => q_reg20,
        in21 => q_reg21,
        in22 => q_reg22,
        in23 => q_reg23,

        in24 => q_reg24,
        in25 => q_reg25,
        in26 => q_reg26,
        in27 => q_reg27,

        in28 => q_reg28,
        in29 => q_reg29,
        in30 => q_reg30,
        in31 => q_reg31,

        z => in00_mux16b
        );

mux16_a: rf_mux16_32bit_2135768
    port map(
        a => ta,

        in00 => in00_mux16a,
        in01 => q_tempreg01,
        in02 => q_tempreg02,
        in03 => q_tempreg03,

        in04 => q_tempreg04,
        in05 => q_tempreg05,
        in06 => q_tempreg06,
        in07 => q_tempreg07,

        in08 => q_tempreg08,
        in09 => q_tempreg09,
        in10 => q_tempreg10,
        in11 => q_tempreg11,

        in12 => q_tempreg12,
        in13 => q_tempreg13,
        in14 => q_tempreg14,
        in15 => q_tempreg15,

        z => a
        );

mux16_b: rf_mux16_32bit_2135768
    port map(
        a => tb,

        in00 => in00_mux16b,
        in01 => q_tempreg01,
        in02 => q_tempreg02,
        in03 => q_tempreg03,

        in04 => q_tempreg04,
        in05 => q_tempreg05,
        in06 => q_tempreg06,
        in07 => q_tempreg07,

        in08 => q_tempreg08,
        in09 => q_tempreg09,
        in10 => q_tempreg10,
        in11 => q_tempreg11,

        in12 => q_tempreg12,
        in13 => q_tempreg13,
        in14 => q_tempreg14,
        in15 => q_tempreg15,

        z => b
        );
    load_reg00 <= ((d_reg00 and rw) and d_tempreg00);
    load_reg01 <= ((d_reg01 and rw) and d_tempreg00);
    load_reg02 <= ((d_reg02 and rw) and d_tempreg00);
    load_reg03 <= ((d_reg03 and rw) and d_tempreg00);
    
    load_reg04 <= ((d_reg04 and rw) and d_tempreg00);
    load_reg05 <= ((d_reg05 and rw) and d_tempreg00);
    load_reg06 <= ((d_reg06 and rw) and d_tempreg00);
    load_reg07 <= ((d_reg07 and rw) and d_tempreg00);
    
    load_reg08 <= ((d_reg08 and rw) and d_tempreg00);
    load_reg09 <= ((d_reg09 and rw) and d_tempreg00);
    load_reg10 <= ((d_reg10 and rw) and d_tempreg00);
    load_reg11 <= ((d_reg11 and rw) and d_tempreg00);
    
    load_reg12 <= ((d_reg12 and rw) and d_tempreg00);
    load_reg13 <= ((d_reg13 and rw) and d_tempreg00);
    load_reg14 <= ((d_reg14 and rw) and d_tempreg00);
    load_reg15 <= ((d_reg15 and rw) and d_tempreg00);
    
    load_reg16 <= ((d_reg16 and rw) and d_tempreg00);
    load_reg17 <= ((d_reg17 and rw) and d_tempreg00);
    load_reg18 <= ((d_reg18 and rw) and d_tempreg00);
    load_reg19 <= ((d_reg19 and rw) and d_tempreg00);
    
    load_reg20 <= ((d_reg20 and rw) and d_tempreg00);
    load_reg21 <= ((d_reg21 and rw) and d_tempreg00);
    load_reg22 <= ((d_reg22 and rw) and d_tempreg00);
    load_reg23 <= ((d_reg23 and rw) and d_tempreg00);
    
    load_reg24 <= ((d_reg24 and rw) and d_tempreg00);
    load_reg25 <= ((d_reg25 and rw) and d_tempreg00);
    load_reg26 <= ((d_reg26 and rw) and d_tempreg00);
    load_reg27 <= ((d_reg27 and rw) and d_tempreg00);
    
    load_reg28 <= ((d_reg28 and rw) and d_tempreg00);
    load_reg29 <= ((d_reg29 and rw) and d_tempreg00);
    load_reg30 <= ((d_reg30 and rw) and d_tempreg00);
    load_reg31 <= ((d_reg31 and rw) and d_tempreg00);
    
    load_tempreg01 <= (d_tempreg01 and rw);
    load_tempreg02 <= (d_tempreg02 and rw);
    load_tempreg03 <= (d_tempreg03 and rw);
    load_tempreg04 <= (d_tempreg04 and rw);
    load_tempreg05 <= (d_tempreg05 and rw);
    load_tempreg06 <= (d_tempreg06 and rw);
    load_tempreg07 <= (d_tempreg07 and rw);
    load_tempreg08 <= (d_tempreg08 and rw);
    load_tempreg09 <= (d_tempreg09 and rw);
    load_tempreg10 <= (d_tempreg10 and rw);
    load_tempreg11 <= (d_tempreg11 and rw);
    load_tempreg12 <= (d_tempreg12 and rw);
    load_tempreg13 <= (d_tempreg13 and rw);
    load_tempreg14 <= (d_tempreg14 and rw);
    load_tempreg15 <= (d_tempreg15 and rw);  
end behavioral;