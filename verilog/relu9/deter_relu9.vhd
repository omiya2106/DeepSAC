library ieee;
use ieee.std_logic_1164.all;

entity detrelu9 is
port (x: in std_logic_vector(8 downto 0); sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end detrelu9;

Architecture arch of detrelu9 is
begin
process(x,sel)
begin
case sel is
when "00" => y <= x;
when "01" => y <= "000000000";
when others => y <= "000000000";
end case;
end process;
end arch;
