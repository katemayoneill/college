library ieee;
use ieee.std_logic_1164.all;

entity dp_ripplecarryadder32bit_21365768_tb is
end dp_ripplecarryadder32bit_21365768_tb;

architecture behavioral of dp_ripplecarryadder32bit_21365768_tb is

component dp_ripplecarryadder32bit_21365768
port ( 
      a: in std_logic_vector(31 downto 0);
      b: in std_logic_vector(31 downto 0);
      c_in: in std_logic;
      sum: out std_logic_vector(31 downto 0);
      c_out: out std_logic;
      v: out std_logic
      );
end component;

--inputs

    signal a_tb: std_logic_vector (31 downto 0) := (others => '0');
    signal b_tb: std_logic_vector (31 downto 0) := (others => '0');
    signal c_in_tb: std_logic := '0';
  
--outputs

    signal sum_tb : std_logic_vector (31 downto 0)  := (others => '0');
    signal c_out_tb : std_logic := '0';
    signal v_tb: std_logic := '0';
    
begin 
uut: dp_ripplecarryadder32bit_21365768 
    port map(
        a => a_tb,
        b => b_tb,
        c_in => c_in_tb,
        sum => sum_tb,
        c_out => c_out_tb,
        v => v_tb
        );

 stimulus: 
 process begin
    wait for 150 ns;
   
   -- test vector a (negative number + negative number with overflow flag)
   		
      a_tb <= "10000000000000000000000000000001";
      b_tb <= "10000000000000000000000000000010";
      c_in_tb <= '0';
      
      wait for 150 ns;	

   -- test vector b (negative number + negative number without overflow flag)
   
      a_tb <= "11111111111111111111111111111110";
      b_tb <= "11111111111111111111111111111111";
      c_in_tb <= '0';     

      wait for 150 ns;
      
   -- test vector c (positive number + positive number with overflow flag)
         	
      a_tb <= "01000000000000000000000000000000";
      b_tb <= "01000000000000000000000000000001";
      c_in_tb <= '0'; 
      
      wait for 150 ns;
      
   -- test vector d (positive number + positive number without overflow flag) 	

      a_tb <= "00000000000000000000000000000001";
      b_tb <= "00000000000000000000000000000010";
      c_in_tb <= '0';
      
      wait for 150 ns;	
      
   -- test vector e (positive number + nagative number without overflow flag)
  
      a_tb <= "00000000000000000000000000000001";
      b_tb <= "10000000000000000000000000000010";
      c_in_tb <= '0';
   
      wait for 150 ns;	

   -- test vector f, worst case propagation delay 
   -- (negative number + positive number without overflow flag (v-flag) worst case propagation delay, c00 is set) 
    
      a_tb <= "00000000000000000000000000000001";
      b_tb <= "10000000000000000000000000000010";
      c_in_tb <= '1';     

   
      	
 
   end process;
   
end behavioral;
