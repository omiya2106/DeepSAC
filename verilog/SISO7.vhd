library ieee;
use ieee.std_logic_1164.all;

entity S7 is
port (din: in std_logic_vector(13 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end S7;

architecture arch of S7 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(6 downto 0) <= din(13 downto 7);
end if;
end process;
dout(8 downto 7) <= "00";
end arch;
