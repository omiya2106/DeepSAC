library ieee;
use ieee.std_logic_1164.all;

entity shift8_out is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic);
end shift8_out;

architecture arch of shift8_out is

begin
process(clk)
begin 
if(clk'event and clk='1') then dout <= din(8);
end if;
end process;
end arch;
