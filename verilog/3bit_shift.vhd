library ieee;
use ieee.std_logic_1164.all;

entity shift3 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(10 downto 0));
end shift3;

architecture arch of shift3 is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout(9 downto 3) <= din(6 downto 0);
end if;
end process;
dout(10) <= '0';
dout(2 downto 0) <= "000"; 
end arch;
