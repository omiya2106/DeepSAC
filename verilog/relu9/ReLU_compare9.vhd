library ieee;
use ieee.std_logic_1164.all;

entity compyRe9 is
port (x: in std_logic_vector(8 downto 0); y: out std_logic_vector(1 downto 0));
end compyRe9;

Architecture arch of compyRe9 is

begin
process(x)
begin
if (x(8)= '1') then y <= "01";
elsif (x = "011000000") then y <= "01";
elsif (x > "000000001" or x< "011000000") then y <= "00";
elsif (x = "000000000") then y<="00"; 
end if;
end process;
end arch;