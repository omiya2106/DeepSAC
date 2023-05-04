library ieee;
use ieee.std_logic_1164.all;

entity comp2 is
port ( sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(7 downto 0));
end comp2;

architecture arch of comp2 is
begin
process(sel)
begin
case sel is
when "00" => y <= "00100000";
when "01" => y <= "00101000";
when "10" => y <= "00110110";
when "11" => y <= "00000000";
when others => y <= "00000000";
end case;
end process;
end arch;
