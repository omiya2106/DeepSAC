library ieee;
use ieee.std_logic_1164.all;

entity deter is
port (x : in std_logic_vector(8 downto 0); y: out std_logic_vector(1 downto 0));
end deter;

Architecture arch of deter is

signal s: std_logic_vector(1 downto 0);

begin
process(x)
begin
if (x = "011000000" or x> "011000000") then s<= "11";
elsif (x < "010000000" and x> "011000000") then s <= "10";
elsif (x= "010000000") then s<= "10";
elsif (x<"000100000" and x> "0010000000") then s<= "01"; 
elsif (x = "001000000") then s <="01";
elsif (x< "001000000" and  x> "000000000") then s <= "00";
else s<="00"; 
end if;
end process;
y <= s;
end arch;