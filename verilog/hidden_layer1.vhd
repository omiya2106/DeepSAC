library ieee;
use ieee.std_logic_1164.all;

entity hidden1 is
port (x1, x2, x3, x4, x5, x6, x7, x8: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4, y5, y6:out std_logic_vector(8 downto 0));
end hidden1;

architecture hidden of hidden1 is

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

signal xs11, xs12, xs13, xs14, xs15, xs16, xs17, xs18, xs21, xs22, xs23, xs24, xs25, xs26, xs27, xs28, xs31, xs32, xs33, xs34, xs35, xs36, xs37, xs38, xs41, xs42, xs43, xs44, xs45, xs46, xs47, xs48, xs51, xs52, xs53, xs54, xs55, xs56, xs57, xs58, xs61, xs62, xs63, xs64, xs65, xs66, xs67, xs68: std_logic_vector(8 downto 0);
signal xs11c, xs13c, xs15c, xs16c, xs18c, xs24c, xs25c, xs27c, xs28c, xs31c, xs33c, xs34c, xs35c,xs36c, xs38c, xs42c, xs43c, xs46c, xs54c, xs55c, xs56c, xs61c, xs67c, xs68c: std_logic_vector(8 downto 0);


signal xs58s : std_logic_vector(9 downto 0); --2 shift
signal xs16s, xs21s, xs25s, xs31s, xs32s, xs36s, xs37s, xs46s : std_logic_vector(10 downto 0); --3 shift
signal xs12s, xs18s, xs26s, xs28s, xs33s, xs34s, xs38s, xs48s, xs54s: std_logic_vector (11 downto 0); --4 shift
signal xs11s, xs22s, xs35s, xs42s, xs52s, xs56s, xs63s, xs66s, xs67s, xs68s: std_logic_vector(12 downto 0); --5 shift
signal xs14s, xs15s, xs24s, xs27s, xs41s, xs44s, xs53s, xs55s, xs57s, xs62s, xs64s: std_logic_vector(13 downto 0); --6 shift
signal xs13s, xs17s, xs23s, xs43s, xs47s, xs51s, xs61s, xs65s: std_logic_vector(13 downto 0); --7 shift

signal Ca112, Ca134, Ca156, Ca178, Ca114, Ca158, Ca118,Ca212, Ca234, Ca256, Ca278, Ca214, Ca258, Ca218,Ca312, Ca334, Ca356, Ca378, Ca314, Ca358, Ca318,Ca412, Ca434, Ca456, Ca478, Ca414, Ca458, Ca418,Ca512, Ca534, Ca556, Ca578, Ca514, Ca558, Ca518,Ca612, Ca634, Ca656, Ca678, Ca614, Ca658, Ca618,Cab1, Cab2, Cab3, Cab4, Cab5, Cab6: std_logic;
signal co11, co13, co16, co18, co24, co25, co27, co28, co31, co33, co34, co35, co36, co38, co42,co43, co46, co54, co55, co56, co61, co67, co68 : std_logic; 
signal ABo1, ABo2, ABo3, ABo4, ABo5, ABo6, Ao112,Ao134, Ao156, Ao178, Ao114, Ao158, Ao118, Ao212,Ao234, Ao256, Ao278, Ao214, Ao258, Ao218,Ao312,Ao334, Ao356, Ao378, Ao314, Ao358, Ao318,Ao412,Ao434, Ao456, Ao478, Ao414, Ao458, Ao418,Ao512,Ao534, Ao556, Ao578, Ao514, Ao558, Ao518,Ao612,Ao634, Ao656, Ao678, Ao614, Ao658, Ao618 : std_logic_vector(8 downto 0);

begin
S11: shift5 port map (x1, clk, xs11s);
SS11: S5 port map (xs11s, clk, xs11c);
C11: compliment2s port map (xs11c, co11, xs11);
S12: shift4 port map (x2,clk, xs12s);
SS12: S4 port map (xs12s,clk, xs12);
S13: shift7 port map (x3,clk,  xs13s);
SS13: S7 port map (xs13s, clk, xs13c);
C13: compliment2s port map (xs13c, co13, xs13);
S14: shift6 port map (x4,clk,  xs14s);
SS14: S6 port map (xs14s, clk, xs14);
S15: shift6 port map (x5,clk,  xs15s);
SS15: S6 port map (xs15s, clk, xs15);
S16: shift3 port map (x6, clk,  xs16s);
SS16: S3 port map (xs16s, clk, xs16c);
C16: compliment2s port map (xs16c, co16, xs16);
S17: shift7 port map (x7, clk,  xs17s);
SS17: S7 port map (xs17s, clk, xs17);
S18: shift4 port map (x8, clk,  xs18s);
SS18: S4 port map (xs18s, clk, xs18c);
C18: compliment2s port map (xs18c, co18, xs18);

A112: add9 port map (xs12, xs11, '0', Ca112, Ao112);
A134: add9 port map (xs13, xs14, '0', Ca134, Ao134);
A156: add9 port map (xs16, xs15, '0', Ca156, Ao156);
A178: add9 port map (xs18, xs17, '0', Ca178, Ao178);
A114: add9 port map (Ao112, Ao134, '0', Ca114, Ao114);
A158: add9 port map (Ao156, Ao178, '0', Ca158, Ao158);
A118: add9 port map (Ao114, Ao158, '0', Ca118, Ao118);
AB1: add9 port map (Ao118,"000000100", '0', Cab1, ABo1);

S21: shift3 port map (x1, clk, xs21s);
SS21: S3 port map (xs21s, clk, xs21);
S22: shift5 port map (x2,clk, xs22s);
SS22: S5 port map (xs22s,clk, xs22);
S23: shift7 port map (x3,clk,  xs23s);
SS23: S7 port map (xs23s, clk, xs23);
S24: shift6 port map (x4,clk,  xs24s);
SS24: S6 port map (xs24s, clk, xs24c);
C24: compliment2s port map (xs24c, co24, xs24);
S25: shift3 port map (x5,clk,  xs25s);
SS25: S3 port map (xs25s, clk, xs25c);
C25: compliment2s port map (xs25c, co25, xs25);
S26: shift4 port map (x6, clk,  xs26s);
SS26: S4 port map (xs26s, clk, xs26);
S27: shift6 port map (x7, clk,  xs27s);
SS27: S6 port map (xs27s, clk, xs27c);
C27: compliment2s port map (xs27c, co27, xs27);
S28: shift4 port map (x8, clk,  xs28s);
SS28: S4 port map (xs28s, clk, xs28c);
C28: compliment2s port map (xs28c, co28, xs28);

A212: add9 port map (xs22, xs21, '0', Ca212, Ao212);
A234: add9 port map (xs23, xs24, '0', Ca234, Ao234);
A256: add9 port map (xs26, xs25, '0', Ca256, Ao256);
A278: add9 port map (xs28, xs27, '0', Ca278, Ao278);
A214: add9 port map (Ao212, Ao234, '0', Ca214, Ao214);
A258: add9 port map (Ao256, Ao278, '0', Ca258, Ao258);
A218: add9 port map (Ao214, Ao258, '0', Ca218, Ao218);
AB2: add9 port map (Ao218, "000001000", '0', Cab2, ABo2);

S31: shift3 port map (x1, clk, xs31s);
SS31: S3 port map (xs31s, clk, xs31c);
C31: compliment2s port map (xs31c, co31, xs31);
S32: shift3 port map (x2,clk, xs32s);
SS32: S3 port map (xs32s,clk, xs32);
S33: shift4 port map (x3,clk,  xs33s);
SS33: S4 port map (xs33s, clk, xs33c);
C33: compliment2s port map (xs33c, co33, xs33);
S34: shift4 port map (x4,clk,  xs34s);
SS34: S4 port map (xs34s, clk, xs34c);
C34: compliment2s port map (xs34c, co34, xs34);
S35: shift5 port map (x5,clk,  xs35s);
SS35: S5 port map (xs35s, clk, xs35c);
C35: compliment2s port map (xs35c, co35, xs35);
S36: shift3 port map (x6, clk,  xs36s);
SS36: S3 port map (xs36s, clk, xs36c);
C36: compliment2s port map (xs36c, co36, xs36);
S37: shift3 port map (x7, clk,  xs37s);
SS37: S3 port map (xs37s, clk, xs37);
S38: shift4 port map (x8, clk,  xs38s);
SS38: S4 port map (xs38s, clk, xs38c);
C38: compliment2s port map (xs38c, co38, xs38);

A312: add9 port map (xs32, xs31, '0', Ca312, Ao312);
A334: add9 port map (xs33, xs34, '0', Ca334, Ao334);
A356: add9 port map (xs36, xs35, '0', Ca356, Ao356);
A378: add9 port map (xs38, xs37, '0', Ca378, Ao378);
A314: add9 port map (Ao312, Ao334, '0', Ca314, Ao314);
A358: add9 port map (Ao356, Ao378, '0', Ca358, Ao358);
A318: add9 port map (Ao314, Ao358, '0', Ca318, Ao318);
AB3: add9 port map (Ao318, "111111110", '0', Cab3, ABo3);

S41: shift6 port map (x1, clk, xs41s);
SS41: S6 port map (xs41s, clk, xs41);
S42: shift5 port map (x2,clk, xs42s);
SS42: S5 port map (xs42s,clk, xs42c);
C42: compliment2s port map (xs42c, co42, xs42);
S43: shift7 port map (x3,clk,  xs43s);
SS43: S7 port map (xs43s, clk, xs43c);
C43: compliment2s port map (xs43c, co43, xs43);
S44: shift6 port map (x4,clk,  xs44s);
SS44: S6 port map (xs44s, clk, xs44);
S46: shift3 port map (x6, clk,  xs46s);
SS46: S3 port map (xs46s, clk, xs46c);
C46: compliment2s port map (xs46c, co46, xs46);
S47: shift7 port map (x7, clk,  xs47s);
SS47: S7 port map (xs47s, clk, xs47);
S48: shift4 port map (x8, clk,  xs48s);
SS48: S4 port map (xs48s, clk, xs48);

A412: add9 port map (xs42, xs41, '0', Ca412, Ao412);
A434: add9 port map (xs43, xs44, '0', Ca434, Ao434);
A456: add9 port map (xs46, "000000000", '0', Ca456, Ao456);
A478: add9 port map (xs48, xs47, '0', Ca478, Ao478);
A414: add9 port map (Ao412, Ao434, '0', Ca414, Ao414);
A458: add9 port map (Ao456, Ao478, '0', Ca458, Ao458);
A418: add9 port map (Ao414, Ao458, '0', Ca418, Ao418);
AB4: add9 port map (Ao418, "000001000", '0', Cab4, ABo4);

S51: shift7 port map (x1, clk, xs51s);
SS51: S7 port map (xs51s, clk, xs51);
S52: shift5 port map (x2,clk, xs52s);
SS52: S5 port map (xs52s,clk, xs52);
S53: shift6 port map (x3,clk,  xs53s);
SS53: S6 port map (xs53s, clk, xs53);
S54: shift4 port map (x4,clk,  xs54s);
SS54: S4 port map (xs54s, clk, xs54c);
C54: compliment2s port map (xs54c, co54, xs54);
S55: shift6 port map (x4,clk,  xs55s);
SS55: S6 port map (xs55s, clk, xs55c);
C55: compliment2s port map (xs55c, co55, xs55);
S56: shift5 port map (x6, clk,  xs56s);
SS56: S5 port map (xs56s, clk, xs56c);
C56: compliment2s port map (xs56c, co56, xs56);
S57: shift6 port map (x7, clk,  xs57s);
SS57: S6 port map (xs57s, clk, xs57);
S58: shift2 port map (x8, clk,  xs58s);
SS58: S2 port map (xs58s, clk, xs58);

A512: add9 port map (xs52, xs51, '0', Ca512, Ao512);
A534: add9 port map (xs53, xs54, '0', Ca534, Ao534);
A556: add9 port map (xs56, xs55, '0', Ca556, Ao556);
A578: add9 port map (xs58, xs57, '0', Ca578, Ao578);
A514: add9 port map (Ao512, Ao534, '0', Ca514, Ao514);
A558: add9 port map (Ao556, Ao578, '0', Ca558, Ao558);
A518: add9 port map (Ao514, Ao558, '0', Ca518, Ao518);
AB5: add9 port map (Ao518, "000000010", '0', Cab5, ABo5);

S61: shift7 port map (x1, clk, xs61s);
SS61: S7 port map (xs61s, clk, xs61c);
C61: compliment2s port map (xs61c, co61, xs61);
S62: shift6 port map (x2,clk, xs62s);
SS62: S6 port map (xs62s,clk, xs62);
S63: shift5 port map (x3,clk,  xs63s);
SS63: S5 port map (xs63s, clk, xs63);
S64: shift6 port map (x4,clk,  xs64s);
SS64: S6 port map (xs64s, clk, xs64);
S65: shift7 port map (x4,clk,  xs65s);
SS65: S7 port map (xs65s, clk, xs65);
S66: shift5 port map (x6, clk,  xs66s);
SS66: S5 port map (xs66s, clk, xs66);
S67: shift5 port map (x7, clk,  xs67s);
SS67: S5 port map (xs67s, clk, xs67c);
C67: compliment2s port map (xs67c, co67, xs67);
S68: shift5 port map (x8, clk,  xs68s);
SS68: S5 port map (xs68s, clk, xs68c);
C68: compliment2s port map (xs68c, co68, xs68);

A612: add9 port map (xs62, xs61, '0', Ca612, Ao612);
A634: add9 port map (xs63, xs64, '0', Ca634, Ao634);
A656: add9 port map (xs66, xs65, '0', Ca656, Ao656);
A678: add9 port map (xs68, xs67, '0', Ca678, Ao678);
A614: add9 port map (Ao612, Ao634, '0', Ca614, Ao614);
A658: add9 port map (Ao656, Ao678, '0', Ca658, Ao658);
A618: add9 port map (Ao614, Ao658, '0', Ca618, Ao618);
AB6: add9 port map (Ao618, "111111000", '0', Cab6, ABo6);


RE1: relu9 port map (ABo1, y1);
RE2: relu9 port map (ABo2, y2);
RE3: relu9 port map (ABo3, y3);
RE4: relu9 port map (ABo4, y4);
RE5: relu9 port map (ABo5, y5);
RE6: relu9 port map (ABo6, y6);


end hidden;
