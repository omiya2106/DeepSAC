library ieee;
use ieee.std_logic_1164.all;

entity neural_net_springer is
port (x1, x2: in std_logic_vector (8 downto 0); clk: std_logic; y:out std_logic);
end neural_net_springer;

architecture hidden of neural_net_springer is

component hidden0 is
port (x1, x2: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4, y5, y6, y7, y8:out std_logic_vector(8 downto 0));
end component;

component hidden1 is
port (x1, x2, x3, x4, x5, x6, x7, x8: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4, y5, y6:out std_logic_vector(8 downto 0));
end component;

component hidden2 is
port (x1, x2, x3, x4, x5, x6: in std_logic_vector (8 downto 0); clk: std_logic; y1, y2, y3, y4:out std_logic_vector(8 downto 0));
end component;

component hidden3 is
port (x1, x2, x3, x4: in std_logic_vector (8 downto 0); clk: std_logic; y1:out std_logic_vector(8 downto 0));
end component; 

component shift8_out is
port (din: in std_logic_vector(8 downto 0); clk: in std_logic;
	dout: out std_logic);
end component;


signal h11, h12, h13, h14, h15, h16, h17, h18, h21, h22, h23, h24, h25, h26, h31, h32, h33, h34, yout: std_logic_vector(8 downto 0);

begin

h0: hidden0 port map (x1, x2, clk, h11, h12, h13, h14, h15, h16, h17, h18);
hl: hidden1 port map (h11, h12, h13, h14, h15, h16, h17, h18, clk, h21, h22, h23, h24, h25, h26);
h2: hidden2 port map (h21, h22, h23, h24, h25, h26, clk, h31, h32, h33, h34);
h3: hidden3 port map (h31, h32, h33, h34, clk, yout);
s: shift8_out port map (yout, clk, y);

end hidden;