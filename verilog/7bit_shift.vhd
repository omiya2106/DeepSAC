library ieee;
use ieee.std_logic_1164.all;

entity shift7 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(13 downto 0));
end shift7;

architecture arch of shift7 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(13 downto 7) <= din(6 downto 0);
end if;
end process;
dout(6 downto 0) <= "0000000"; 
end arch;
