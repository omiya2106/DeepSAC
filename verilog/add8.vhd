library ieee;
use ieee.std_logic_1164.all;

entity add9 is
port (A,B: in std_logic_vector(8 downto 0); Cin: in std_logic; Co: out std_logic; Sum: out std_logic_vector(8 downto 0));
end add9;

architecture struct of add9 is
component FA
port (A,B, Cin: in std_logic; Co, Sum: out std_logic);
end component;

signal C: std_logic_vector(8 downto 1);

begin
F1: FA port map (A(0), B(0), Cin, C(1), Sum(0));
F2: FA port map (A(1), B(1), C(1), C(2), Sum(1));
F3: FA port map (A(2), B(2), C(2), C(3), Sum(2));
F4: FA port map (A(3), B(3), C(3), C(4), Sum(3));
F5: FA port map (A(4), B(4), C(4), C(5), Sum(4));
F6: FA port map (A(5), B(5), C(5), C(6), Sum(5));
F7: FA port map (A(6), B(6), C(6), C(7), Sum(6));
F8: FA port map (A(7), B(7), C(7), C(8), Sum(7));
F9: FA port map (A(8), B(8), C(8), Co, Sum(8));


end struct;

