library ieee;
use ieee.std_logic_1164.all;

entity shift2 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(9 downto 0));
end shift2;

architecture arch of shift2 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(8 downto 2) <= din(6 downto 0);
end if;
end process;
dout(9) <= '0';
dout(1 downto 0) <= "00"; 
end arch;
