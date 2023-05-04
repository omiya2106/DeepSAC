library ieee;
use ieee.std_logic_1164.all;

entity comp is
port (x1, x2, x3: in std_logic_vector(8 downto 0); sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end comp;

architecture arch of comp is
begin
process(x1, x2, x3, sel)
begin
case sel is
when "00" => y <= x1;
when "01" => y <= x2;
when "10" => y <= x3;
when "11" => y <= "001000000";
when others => y <= "000000000";
end case;
end process;
end arch;