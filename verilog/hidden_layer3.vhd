library ieee;
use ieee.std_logic_1164.all;

entity hidden3 is
port (x1, x2, x3, x4: in std_logic_vector (8 downto 0); clk: std_logic; y1:out std_logic_vector(8 downto 0));
end hidden3;

architecture hidden of hidden3 is


component shift7 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(13 downto 0));
end component;

component S7 is
port (din: in std_logic_vector(13 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component add9 is
port (A,B: in std_logic_vector(8 downto 0); Cin: in std_logic; Co: out std_logic; Sum: out std_logic_vector(8 downto 0));
end component;

component sig9 is
port (x: in std_logic_vector (8 downto 0); clk: std_logic; sig: out std_logic_vector(8 downto 0));
end component;

component compliment2s
port (Din: in std_logic_vector (8 downto 0); Co: out std_logic; Do: out std_logic_vector (8 downto 0));
end component;

signal xs11, xs12, xs13, xs14,xs21, xs22, xs23, xs24, xs31, xs32, xs33, xs34, xs41, xs42, xs43, xs44 : std_logic_vector(8 downto 0);
signal xs11c: std_logic_vector(8 downto 0);

signal xs11s, xs12s, xs13s, xs14s: std_logic_vector(13 downto 0); --7 shift

signal Ca112, Ca134, Ca114, Cab1 : std_logic;
signal co11  : std_logic; 

signal ABo1, Ao112, Ao134, Ao114: std_logic_vector(8 downto 0);

begin
S11: shift7 port map (x1, clk, xs11s);
SS11: S7 port map (xs11s, clk, xs11c);
C11: compliment2s port map (xs11c, co11, xs11);
S12: shift7 port map (x2,clk, xs12s);
SS12: S7 port map (xs12s,clk, xs12);
S13: shift7 port map (x3,clk,  xs13s);
SS13: S7 port map (xs13s, clk, xs13);
S14: shift7 port map (x4,clk,  xs14s);
SS14: S7 port map (xs14s, clk, xs14);

A112: add9 port map (xs12, xs11, '0', Ca112, Ao112);
A134: add9 port map (xs13, xs14, '0', Ca134, Ao134);
A114: add9 port map (Ao112, Ao134, '0', Ca114, Ao114);
AB1: add9 port map (Ao114,"111111001", '0', Cab1, ABo1);

RE1: sig9 port map (ABo1,clk, y1);


end hidden;
