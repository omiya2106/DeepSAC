library ieee;
use ieee.std_logic_1164.all;

entity S2 is
port (din: in std_logic_vector(9 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end S2;

architecture arch of S2 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(7 downto 0) <= din(9 downto 2);
end if;
end process;
dout(8) <= '0';
end arch;
