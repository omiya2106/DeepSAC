library ieee;
use ieee.std_logic_1164.all;

entity shift4 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(11 downto 0));
end shift4;

architecture arch of shift4 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(10 downto 4) <= din(6 downto 0);
end if;
end process;
dout(11) <= '0';
dout(3 downto 0) <= "0000"; 
end arch;
