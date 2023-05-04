library ieee;
use ieee.std_logic_1164.all;

entity shift6 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(13 downto 0));
end shift6;

architecture arch of shift6 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(12 downto 6) <= din(6 downto 0);
end if;
end process;
dout(13) <= '0';
dout(5 downto 0) <= "000000"; 
end arch;
