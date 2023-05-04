library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sig9 is
port (x: in std_logic_vector (8 downto 0); clk: std_logic; sig: out std_logic_vector(8 downto 0));
end sig9;

architecture sigmoid of sig9 is
component SISO29
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;
 
component  SISO39
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component deter 
port (x : in std_logic_vector(8 downto 0); y: out std_logic_vector(1 downto 0));
end component;

component SISO59
port (din: in std_logic_vector(8 downto 0); clk: in std_logic; dout: out std_logic_vector(8 downto 0));
end component;

component comp is
port (x1, x2, x3: in std_logic_vector(8 downto 0); sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end component;

component comp2 is
port ( sel: in std_logic_vector(1 downto 0); y: out std_logic_vector(8 downto 0));
end component;

component add9
port (A,B: in std_logic_vector(8 downto 0); Cin: in std_logic; Co: out std_logic; Sum: out std_logic_vector(8 downto 0));
end component;

signal sel: std_logic_vector (1 downto 0);
signal a1, a3: std_logic_vector (8 downto 0);
signal a2: std_logic_vector (8 downto 0);
signal c1, c2: std_logic_vector (8 downto 0);
signal co: std_logic;

begin
D1: deter port map (x, sel);
S1: SISO29 port map (x, clk, a1);
S2: SISO39 port map (x, clk, a2);
S3: SISO59 port map (x, clk, a3);
COMP1: comp port map (a1,a2,a3,sel, c1);
COMP21: comp2 port map (sel, c2);
ADD2: add9 port map (c1, c2,'0', co, sig);
end sigmoid;
