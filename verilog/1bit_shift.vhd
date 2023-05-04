library ieee;
use ieee.std_logic_1164.all;

entity shift1 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end shift1;

architecture arch of shift1 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(7 downto 1) <= din(6 downto 0);
end if;
end process;
dout(0) <= '0';
dout(8) <= '0'; 
end arch;
