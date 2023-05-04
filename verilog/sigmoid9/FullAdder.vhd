library ieee;
use ieee.std_logic_1164.all;

entity FA is
port (A,B, Cin: in std_logic; Co, Sum: out std_logic);
end FA;

architecture behave of FA is
begin
Sum <= A xor B xor Cin ;
Co <= (A and B) or (A and Cin) or (B and Cin) ;

end behave;

