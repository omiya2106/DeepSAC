library ieee;
use ieee.std_logic_1164.all;

entity hidden2 is
port (x1, x2, x3, x4, x5, x6: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4:out std_logic_vector(8 downto 0));
end hidden2;

architecture hidden of hidden2 is

component shift1 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component shift2 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(9 downto 0));
end component;

component shift3 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(10 downto 0));
end component;

component shift4 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(11 downto 0));
end component;

component shift5 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(12 downto 0));
end component;

component shift6 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(13 downto 0));
end component;

component shift7 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(13 downto 0));
end component;

component S7 is
port (din: in std_logic_vector(13 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S6 is
port (din: in std_logic_vector(13 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S5 is
port (din: in std_logic_vector(12 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S4 is
port (din: in std_logic_vector(11 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S3 is
port (din: in std_logic_vector(10 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S2 is
port (din: in std_logic_vector(9 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component S1 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
end component;

component add9 is
port (A,B: in std_logic_vector(8 downto 0); Cin: in std_logic; Co: out std_logic; Sum: out std_logic_vector(8 downto 0));
end component;

component relu9 is
port (x : in std_logic_vector(8 downto 0); y: out std_logic_vector(8 downto 0));
end component;

component compliment2s
port (Din: in std_logic_vector (8 downto 0); Co: out std_logic; Do: out std_logic_vector (8 downto 0));
end component;

signal xs11, xs12, xs13, xs14, xs15, xs16,xs21, xs22, xs23, xs24, xs25, xs26, xs31, xs32, xs33, xs34, xs35, xs36, xs41, xs42, xs43, xs44, xs45, xs46 : std_logic_vector(8 downto 0);
signal xs13c, xs14c, xs15c, xs16c, xs24c, xs25c, xs33c, xs44c, xs46c: std_logic_vector(8 downto 0);



signal xs16s, xs31s : std_logic_vector(10 downto 0); --3 shift
signal xs11s, xs14s, xs46s: std_logic_vector (11 downto 0); --4 shift
signal xs12s, xs13s,  xs22s, xs26s, xs32s, xs34s, xs36s: std_logic_vector(12 downto 0); --5 shift
signal xs15s, xs21s, xs25s, xs35s, xs41s, xs42s, xs45s : std_logic_vector(13 downto 0); --6 shift
signal xs23s, xs24s, xs33s, xs43s, xs44s: std_logic_vector(13 downto 0); --7 shift

signal Ca112, Ca134, Ca156, Ca114, Ca116,Ca212, Ca234, Ca256, Ca214, Ca216,Ca312, Ca334, Ca356, Ca314, Ca316,Ca412, Ca434, Ca456, Ca414, Ca416, Cab1, Cab2, Cab3, Cab4 : std_logic;
signal co13, co14, co15, co16, co24, co25, co33, co44, co46  : std_logic; 

signal ABo1, ABo2, ABo3, ABo4, Ao112,Ao134, Ao156, Ao114, Ao116,Ao212,Ao234, Ao256, Ao214, Ao216, Ao312,Ao334, Ao356, Ao314, Ao316, Ao412,Ao434, Ao456, Ao414, Ao416 : std_logic_vector(8 downto 0);

begin
S11: shift4 port map (x1, clk, xs11s);
SS11: S4 port map (xs11s, clk, xs11);
S12: shift5 port map (x2,clk, xs12s);
SS12: S5 port map (xs12s,clk, xs12);
S13: shift5 port map (x3,clk,  xs13s);
SS13: S5 port map (xs13s, clk, xs13c);
C13: compliment2s port map (xs13c, co13, xs13);
S14: shift4 port map (x4,clk,  xs14s);
SS14: S4 port map (xs14s, clk, xs14c);
C14: compliment2s port map (xs14c, co14, xs14);
S15: shift6 port map (x5,clk,  xs15s);
SS15: S6 port map (xs15s, clk, xs15c);
C15: compliment2s port map (xs15c, co15, xs15);
S16: shift3 port map (x6, clk,  xs16s);
SS16: S3 port map (xs16s, clk, xs16c);
C16: compliment2s port map (xs16c, co16, xs16);

A112: add9 port map (xs12, xs11, '0', Ca112, Ao112);
A134: add9 port map (xs13, xs14, '0', Ca134, Ao134);
A156: add9 port map (xs16, xs15, '0', Ca156, Ao156);
A114: add9 port map (Ao112, Ao134, '0', Ca114, Ao114);
A116: add9 port map (Ao114, Ao156, '0', Ca116, Ao116);
AB1: add9 port map (Ao116,"111111100", '0', Cab1, ABo1);

S21: shift6 port map (x1, clk, xs21s);
SS21: S6 port map (xs21s, clk, xs21);
S22: shift5 port map (x2,clk, xs22s);
SS22: S5 port map (xs22s,clk, xs22);
S23: shift7 port map (x3,clk,  xs23s);
SS23: S7 port map (xs23s, clk, xs23);
S24: shift7 port map (x4,clk,  xs24s);
SS24: S7 port map (xs24s, clk, xs24c);
C24: compliment2s port map (xs24c, co24, xs24);
S25: shift6 port map (x5,clk,  xs25s);
SS25: S6 port map (xs25s, clk, xs25c);
C25: compliment2s port map (xs25c, co25, xs25);
S26: shift5 port map (x6, clk,  xs26s);
SS26: S5 port map (xs26s, clk, xs26);

A212: add9 port map (xs22, xs21, '0', Ca212, Ao212);
A234: add9 port map (xs23, xs24, '0', Ca234, Ao234);
A256: add9 port map (xs26, xs25, '0', Ca256, Ao256);
A214: add9 port map (Ao212, Ao234, '0', Ca214, Ao214);
A216: add9 port map (Ao214, Ao256, '0', Ca216, Ao216);
AB2: add9 port map (Ao216, "111111100", '0', Cab2, ABo2);

S31: shift3 port map (x1, clk, xs31s);
SS31: S3 port map (xs31s, clk, xs31);
S32: shift5 port map (x2,clk, xs32s);
SS32: S5 port map (xs32s,clk, xs32);
S33: shift7 port map (x3,clk,  xs33s);
SS33: S7 port map (xs33s, clk, xs33c);
C33: compliment2s port map (xs33c, co33, xs33);
S34: shift5 port map (x4,clk,  xs34s);
SS34: S5 port map (xs34s, clk, xs34);
S35: shift6 port map (x5,clk,  xs35s);
SS35: S6 port map (xs35s, clk, xs35);
S36: shift5 port map (x6, clk,  xs36s);
SS36: S5 port map (xs36s, clk, xs36);


A312: add9 port map (xs32, xs31, '0', Ca312, Ao312);
A334: add9 port map (xs33, xs34, '0', Ca334, Ao334);
A356: add9 port map (xs36, xs35, '0', Ca356, Ao356);
A314: add9 port map (Ao312, Ao334, '0', Ca314, Ao314);
A316: add9 port map (Ao314, Ao356, '0', Ca316, Ao316);
AB3: add9 port map (Ao316, "111111110", '0', Cab3, ABo3);

S41: shift6 port map (x1, clk, xs41s);
SS41: S6 port map (xs41s, clk, xs41);
S42: shift6 port map (x2,clk, xs42s);
SS42: S6 port map (xs42s,clk, xs42);
S43: shift7 port map (x3,clk,  xs43s);
SS43: S7 port map (xs43s, clk, xs43);
S44: shift7 port map (x4,clk,  xs44s);
SS44: S7 port map (xs44s, clk, xs44c);
C44: compliment2s port map (xs44c, co44, xs44);
S45: shift6 port map (x5, clk,  xs45s);
SS45: S6 port map (xs45s, clk, xs45);
S46: shift4 port map (x6, clk,  xs46s);
SS46: S4 port map (xs46s, clk, xs46c);
C46: compliment2s port map (xs46c, co46, xs46);


A412: add9 port map (xs42, xs41, '0', Ca412, Ao412);
A434: add9 port map (xs43, xs44, '0', Ca434, Ao434);
A456: add9 port map (xs46, "000000000", '0', Ca456, Ao456);
A414: add9 port map (Ao412, Ao434, '0', Ca414, Ao414);
A416: add9 port map (Ao414, Ao456, '0', Ca416, Ao416);
AB4: add9 port map (Ao416, "000000101", '0', Cab4, ABo4);


RE1: relu9 port map (ABo1, y1);
RE2: relu9 port map (ABo2, y2);
RE3: relu9 port map (ABo3, y3);
RE4: relu9 port map (ABo4, y4);



end hidden;
