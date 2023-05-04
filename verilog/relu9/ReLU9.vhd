library ieee;
use ieee.std_logic_1164.all;


entity relu9 is
port (x : in std_logic_vector(8 downto 0); y: out std_logic_vector(8 downto 0));
end relu9;

Architecture arch of relu9 is
component compyRe9
port (x: in std_logic_vector(8 downto 0); y: out std_logic_vector(1 downto 0));
end component;
component detrelu9
port (x: in std_logic_vector(8 downto 0); sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end component;
signal sel: std_logic_vector(1 downto 0); 
begin
C1: compyRe9 port map (x, sel);
D1: detrelu9 port map (x, sel, y);
end arch;

