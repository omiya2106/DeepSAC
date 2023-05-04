library ieee;
use ieee.std_logic_1164.all;

entity shift5 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(12 downto 0));
end shift5;

architecture arch of shift5 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(11 downto 5) <= din(6 downto 0);
end if;
end process;
dout(12) <= '0';
dout(4 downto 0) <= "00000"; 
end arch;
