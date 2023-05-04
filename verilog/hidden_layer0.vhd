library ieee;
use ieee.std_logic_1164.all;

entity hidden0 is
port (x1, x2: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4, y5, y6, y7, y8:out std_logic_vector(8 downto 0));
end hidden0;

architecture hidden of hidden0 is

component shift1 is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic_vector(8 downto 0));
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

signal xs11, xs12, xs21, xs22, xs31, xs32, xs41, xs42, xs51, xs52, xs61, xs62, xs71, xs72, xs81, xs82: std_logic_vector(8 downto 0);
signal xs82c,xs42c, xs52c, xs62c, xs72c, xs21c, xs31c, xs71c : std_logic_vector(8 downto 0);

signal xs61s : std_logic_vector(8 downto 0); --1 shift
signal xs21s: std_logic_vector(10 downto 0); --3 shift
signal xs81s, xs82s: std_logic_vector (11 downto 0); --4 shift
signal xs11s, xs12s, xs31s, xs41s, xs42s, xs52s, xs62s, xs72s: std_logic_vector(12 downto 0); --5 shift
signal xs22s, xs32s, xs51s: std_logic_vector(13 downto 0); --6 shift
signal xs71s: std_logic_vector(13 downto 0); --7 shift

signal Ca112, Ca212, Ca312, Ca412, Ca512, Ca612, Ca712, Ca812, Cab1, Cab2, Cab3, Cab4, Cab5, Cab7, Cab8: std_logic;
signal co21, co31, co71, co42, co52, co62, co72, co82: std_logic; 
signal ABo1, ABo2, ABo3, ABo4, ABo5, ABo6, ABo7, ABo8, Ao112, Ao212, Ao312, Ao412, Ao512, Ao712, Ao812: std_logic_vector(8 downto 0);

begin
S11: shift5 port map (x1, clk, xs11s);
SS11: S5 port map (xs11s,clk,  xs11);
S12: shift5 port map (x2,clk,  xs12s);
SS12: S5 port map (xs12s,clk, xs12);

A112: add9 port map (xs12, xs11, '0', Ca112, Ao112);
AB1: add9 port map (Ao112,"111100000", '0', Cab1, ABo1);

S21: shift3 port map (x1,clk, xs21s);
SS21: S3 port map (xs21s,clk,xs21c);
C21: compliment2s port map (xs21c, co21, xs21);
S22: shift6 port map (x2,clk, xs22s);
SS22: S6 port map (xs22s,clk, xs22);

A212: add9 port map (xs22, xs21, '0', Ca212, Ao212);
AB2: add9 port map (Ao212, "111110000", '0', Cab2, ABo2);

S31: shift5 port map (x1,clk, xs31s);
SS31: S5 port map (xs31s,clk, xs31c);
C31: compliment2s port map (xs31c, co31,xs31);
S32: shift6 port map (x2, clk, xs32s);
SS32: S6 port map (xs32s, clk, xs32); 

A312: add9 port map (xs31, xs32, '0', Ca312, Ao312);
AB3: add9 port map (Ao312, "111111100", '0', Cab3, ABo3);

S41: shift5 port map (x1, clk, xs41s);
SS41: S5 port map (xs41s, clk, xs41);
S42: shift5 port map (x2,clk, xs42s);
SS42: S5 port map (xs42s,clk, xs42c);
C42: compliment2s port map (xs42c, co42,xs42);

A412: add9 port map (xs42, xs41, '0', Ca412, Ao412);
AB4: add9 port map (Ao412, "000000100", '0', Cab4, ABo4);

S51: shift6 port map (x1, clk, xs51s);
SS51: S6 port map (xs51s, clk, xs51);
S52: shift5 port map (x2,clk, xs52s);
SS52: S5 port map (xs52s,clk, xs52c);
C53: compliment2s port map (xs52c, co52,xs52);

A512: add9 port map (xs52, xs51, '0', Ca512, Ao512);
AB5: add9 port map (Ao512, "000000001", '0', Cab5, ABo5);

S61: shift1 port map (x1, clk, xs61s);
SS61: S1 port map (xs61s, clk, xs61);
S62: shift5 port map (x2,clk, xs62s);
SS62: S5 port map (xs62s,clk, xs62c);
C61: compliment2s port map (xs62c, co62, xs62);

AB6: add9 port map (xs62, xs61, '0', Ca612, ABo6);

S71: shift7 port map (x1, clk, xs71s);
SS71: S7 port map (xs71s, clk, xs71c);
C71: compliment2s port map (xs71c, co71, xs71);
S72: shift5 port map (x2,clk, xs72s);
SS72: S5 port map (xs72s,clk, xs72c);
C73: compliment2s port map (xs72c, co72, xs72);

A712: add9 port map (xs72, xs71, '0', Ca712, Ao712);
AB7: add9 port map (Ao712,"000100000", '0',Cab7,ABo7);

S81: shift4 port map (x1, clk, xs81s);
SS81: S4 port map (xs81s, clk, xs81);
S82: shift4 port map (x2,clk, xs82s);
SS82: S4 port map (xs82s,clk, xs82c);
C82: compliment2s port map (xs82c, co82, xs82);

A812: add9 port map (xs82, xs81, '0', Ca812, Ao812);
AB8: add9 port map (Ao812,"111111100", '0',Cab8,ABo8);

RE1: relu9 port map (ABo1, y1);
RE2: relu9 port map (ABo2, y2);
RE3: relu9 port map (ABo3, y3);
RE4: relu9 port map (ABo4, y4);
RE5: relu9 port map (ABo5, y5);
RE6: relu9 port map (ABo6, y6);
RE7: relu9 port map (ABo7, y7);
RE8: relu9 port map (ABo8, y8);

end hidden;
