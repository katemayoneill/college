library ieee;
use ieee.std_logic_1164.all;

entity rf_register32bit_21365768_tb is
end rf_register32bit_21365768_tb;

architecture behavioral of rf_register32bit_21365768_tb is

component rf_register32bit_21365768
    port( 
        d : in std_logic_vector (31 downto 0);
        load : in std_logic;
        clk : in std_logic;
        q : out std_logic_vector (31 downto 0)
        );
end component;

--inputs

    signal d_tb : std_logic_vector(31 downto 0):= (others => '0');
    signal clk_tb : std_logic:= '0';
    signal load_tb : std_logic:= '0';
    
--outputs

    signal q_tb : std_logic_vector(31 downto 0):= (others => '0');
    
    constant period : time := 10ns;
   

begin
    uut: rf_register32bit_21365768 
        port map(
            d => d_tb,
            clk => clk_tb,
            load => load_tb,
            q => q_tb
            );
    
   
    clk_tb <= not clk_tb after period/2;
    
   
    stimulus: 
    process begin
    wait for 10ns;
    load_tb <= '1';
    d_tb <= "00000001010001100000010000001000";
  
    wait for 10ns;
    load_tb <= '0';
    
    end process;
   
        

end behavioral;
