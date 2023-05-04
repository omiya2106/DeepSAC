library ieee;
use ieee.std_logic_1164.all;

entity comp2 is
port ( sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end comp2;

architecture arch of comp2 is
begin
process(sel)
begin
case sel is
when "00" => y <= "000100000";
when "01" => y <= "000101000";
when "10" => y <= "000110110";
when "11" => y <= "000000000";
when others => y <= "000000000";
end case;
end process;
end arch;
