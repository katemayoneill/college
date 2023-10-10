library ieee;
use ieee.std_logic_1164.all;

entity rf_register32bit_21365768 is
    port( 
        d : in std_logic_vector (31 downto 0);
        load : in std_logic;
        clk : in std_logic;
        q : out std_logic_vector (31 downto 0)
        );
end rf_register32bit_21365768;

architecture behavioral of rf_register32bit_21365768 is

begin

process(clk)
begin
   if clk'event and clk='1' then
     if load='1' then
       q <= d after 3ns;
     end if;
   end if;
end process;

end behavioral;
