library ieee;
use ieee.std_logic_1164.all;

entity SISO49 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end SISO49;

architecture arch of SISO49 is
begin
process(clk)
begin 
if(clk'event and clk='1') then dout(7 downto 3) <= din(4 downto 0);
end if;
end process;
dout(8) <= '0';
dout(2 downto 0)<= "000"; 
end arch;
