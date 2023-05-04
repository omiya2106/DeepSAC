library ieee;
use ieee.std_logic_1164.all;

entity SISO59 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end SISO59;

architecture arch of SISO59 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(3 downto 0) <= din(7 downto 4);
end if;
end process;
dout(8 downto 4) <= "00000";
end arch;
