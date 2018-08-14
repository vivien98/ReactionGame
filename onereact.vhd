		library ieee;
use ieee.std_logic_1164.all;

entity D_FFn is
  port (D, CLK,rst: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of D_FFn is
begin 
   process (CLK,rst) 
   begin
   	if rst = '1' then
   		Q <= '0';
	elsif CLK'event and (CLK = '0') then
	     Q <= D;
	end if;
   end process;

end WhatDoYouCare;

library ieee;
use ieee.std_logic_1164.all;

entity D_FFp is
  port (D, CLK,rst: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of D_FFp is
begin 
   process (CLK,rst) 
   begin
   	if rst = '1' then
   		Q <= '0';
	elsif CLK'event and (CLK = '1') then
	     Q <= D;
	end if;
   end process;
 end WhatDoYouCare; 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
entity twoCounterp is
  port (CLK,rst: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of twoCounterp is
component D_FFp port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w1, w2:std_logic;
begin 
   x1 : D_FFp port map (D => w1, CLK => CLK, rst => rst, Q => w2);
   w1 <= not w2;
   Q <= w2;
end WhatDoYouCare;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;


entity twoCounter is
  port (CLK,rst: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare1 of twoCounter is
component D_FFn port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w1, w2:std_logic;
begin 
   x1 : D_FFn port map (D => w1, CLK => CLK, rst => rst, Q => w2);
   w1 <= not w2;
   Q <= w2;
end WhatDoYouCare1;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;


entity fiveCounter is
  port (CLK,rst: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of fiveCounter is
component twoCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w1, w2,w3,rrst,irst:std_logic;
begin 
   irst <= rst or rrst;
   x1 : twoCounter port map(CLK => CLK,rst => irst, Q => w1);
   x2 : twoCounter port map(CLK => w1,rst => irst, Q => w2);
   x3 : twoCounter port map(CLK => w2,rst => irst, Q => w3);
   rrst <= w1 and(not w2) and w3;
    Q <= w3;
end WhatDoYouCare;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity mainCounter is
  port (CLK,rst: in std_logic; Q: out std_logic_vector(10 downto 0));
end entity;
architecture moz of mainCounter is
component twoCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10:std_logic;
begin
   x0 : twoCounter port map(CLK => CLK,rst => rst, Q => w0);
   x1 : twoCounter port map(CLK => w0,rst => rst, Q => w1);
   x2 : twoCounter port map(CLK => w1,rst => rst, Q => w2);
   x3 : twoCounter port map(CLK => w2,rst => rst, Q => w3);
   x4 : twoCounter port map(CLK => w3,rst => rst, Q => w4);
   x5 : twoCounter port map(CLK => w4,rst => rst, Q => w5);
   x6 : twoCounter port map(CLK => w5,rst => rst, Q => w6);
   x7 : twoCounter port map(CLK => w6,rst => rst, Q => w7);
   x8 : twoCounter port map(CLK => w7,rst => rst, Q => w8);
   x9 : twoCounter port map(CLK => w8,rst => rst, Q => w9);
   x10 : twoCounter port map(CLK => w9,rst => rst, Q => w10);
   Q(0) <= w0;
   Q(1) <= w1;
   Q(2) <= w2;
   Q(3) <= w3;
   Q(4) <= w4;
   Q(5) <= w5;
   Q(6) <= w6;
   Q(7) <= w7;
   Q(8) <= w8;
   Q(9) <= w9;
   Q(10) <= w10;
   
end moz;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity countDownTimer is
  port (inp:std_logic_vector(11 downto 0);CLK,rst: in std_logic; Qout: out std_logic);
end entity;
architecture moz of countDownTimer is
component twoCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11:std_logic;
signal q:std_logic_vector(11 downto 0);
begin
   x0 : twoCounter port map(CLK => CLK,rst => rst, Q => w0);
   x1 : twoCounter port map(CLK => w0,rst => rst, Q => w1);
   x2 : twoCounter port map(CLK => w1,rst => rst, Q => w2);
   x3 : twoCounter port map(CLK => w2,rst => rst, Q => w3);
   x4 : twoCounter port map(CLK => w3,rst => rst, Q => w4);
   x5 : twoCounter port map(CLK => w4,rst => rst, Q => w5);
   x6 : twoCounter port map(CLK => w5,rst => rst, Q => w6);
   x7 : twoCounter port map(CLK => w6,rst => rst, Q => w7);
   x8 : twoCounter port map(CLK => w7,rst => rst, Q => w8);
   x9 : twoCounter port map(CLK => w8,rst => rst, Q => w9);
   x10 : twoCounter port map(CLK => w9,rst => rst, Q => w10);
   x11 : twoCounter port map(CLK => w10,rst => rst, Q => w11);
   q(0) <= (inp(0) and w0) or ((not inp(0)) and (not w0));
   q(1) <= (inp(1) and w1) or ((not inp(1)) and (not w1));
   q(2) <= (inp(2) and w2) or ((not inp(2)) and (not w2));
   q(3) <= (inp(3) and w3) or ((not inp(3)) and (not w3));
   q(4) <= (inp(4) and w4) or ((not inp(4)) and (not w4));
   q(5) <= (inp(5) and w5) or ((not inp(5)) and (not w5));
   q(6) <= (inp(6) and w6) or ((not inp(6)) and (not w6));
   q(7) <= (inp(7) and w7) or ((not inp(7)) and (not w7));
   q(8) <= (inp(8) and w8) or ((not inp(8)) and (not w8));
   q(9) <= (inp(9) and w9) or ((not inp(9)) and (not w9));
   q(10) <= (inp(10) and w10) or ((not inp(10)) and (not w10));
   q(11) <= (inp(11) and w11) or ((not inp(11)) and (not w11));
   Qout <= q(0) and q(1) and q(2) and q(3) and q(4) and q(5) and q(6) and q(7) and q(8) and q(9) and q(10) and q(11);
end moz;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity randomNumGen is
  port (clk,grab : in std_logic;randomNum : out std_logic_vector(10 downto 0));
end entity;
architecture kahipan of randomNumGen is
component D_FFp is
  port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
component mainCounter is
  port (CLK,rst: in std_logic; Q: out std_logic_vector(10 downto 0));
end component;
signal w1: std_logic_vector(10 downto 0);

begin
x1 : mainCounter port map(CLK => clk,rst => '0',Q => w1);
d0 : D_FFp port map(D => w1(0),CLK => grab,rst => '0',Q => randomNum(0));
d1 : D_FFp port map(D => w1(1),CLK => grab,rst => '0',Q => randomNum(1));
d2 : D_FFp port map(D => w1(2),CLK => grab,rst => '0',Q => randomNum(2));
d3 : D_FFp port map(D => w1(3),CLK => grab,rst => '0',Q => randomNum(3));
d4 : D_FFp port map(D => w1(4),CLK => grab,rst => '0',Q => randomNum(4));
d5 : D_FFp port map(D => w1(5),CLK => grab,rst => '0',Q => randomNum(5));
d6 : D_FFp port map(D => w1(6),CLK => grab,rst => '0',Q => randomNum(6));
d7 : D_FFp port map(D => w1(7),CLK => grab,rst => '0',Q => randomNum(7));
d8 : D_FFp port map(D => w1(8),CLK => grab,rst => '0',Q => randomNum(8));
d9 : D_FFp port map(D => w1(9),CLK => grab,rst => '0',Q => randomNum(9));
d10 : D_FFp port map(D => w1(10),CLK => grab,rst => '0',Q => randomNum(10));
end kahipan;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity oneK is
  port (CLK: in std_logic; Q: out std_logic);
end entity;
architecture ghadyal of oneK is
component twoCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
component fiveCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w1,w2,w3,w4,w5,w6,w7,w8:std_logic;
begin 
   x1 : twoCounter port map(CLK => CLK,rst => '0', Q => w1);
   x2 : twoCounter port map(CLK => w1,rst => '0', Q => w2);
   x3 : twoCounter port map(CLK => w2,rst => '0', Q => w3);
   x4 : twoCounter port map(CLK => w3,rst => '0', Q => w4);
   
   x5 : fiveCounter port map(CLK => w4,rst => '0', Q => w5);
   x6 : fiveCounter port map(CLK => w5,rst => '0', Q => w6);
   x7 : fiveCounter port map(CLK => w6,rst => '0', Q => w7);
   x8 : fiveCounter port map(CLK => w7,rst => '0', Q => w8);
   x9 : fiveCounter port map(CLK => w8,rst => '0', Q => Q); 
end ghadyal;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity eightCounter is
  port (CLK,rst: in std_logic; Qout: out std_logic);
end entity;
architecture moz of eightCounter is
component twoCounter port (CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w0,w1,w2,w3:std_logic;

begin
   x0 : twoCounter port map(CLK => CLK,rst => rst, Q => w0);
   x1 : twoCounter port map(CLK => w0,rst => rst, Q => w1);
   x2 : twoCounter port map(CLK => w1,rst => rst, Q => w2);
   x3 : twoCounter port map(CLK => w2,rst => rst, Q => w3);
   
   Qout <= (not w0) and (not w1) and (not w2) and w3;
   
end moz;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity statecontroller is
  port (react,rst,start,clk: in std_logic; working: out std_logic);
end entity;
architecture attichya of statecontroller is
component D_FFp is
  port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
component eightCounter is
  port (CLK,rst: in std_logic; Qout: out std_logic);
end component;
signal w1,w2,w3,w4,nw1 : std_logic;
begin

w3 <= react and w1;
w4 <= not w1;
x1 : eightCounter port map(CLK =>w3,rst => w4,Qout => w2);
x2 : D_FFp port map (D => nw1,CLK => clk,rst => rst,Q => w1);
nw1 <= ((not w1) and (start)) or (w1 and (not(rst or w2)));
working <= w1;

end attichya;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
  port (CLK,rst,inp: in std_logic; Q: out std_logic);
end entity;
architecture WhatDoYouCare of debouncer is

component D_FFp port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w,q0,q1,nq0,nq1,w1,w4:std_logic;
begin 

w1 <= (q0 and q1)or((not q0) and (not q1));

w4 <= (q1 and (not inp))or((not q1) and (inp));

nq0 <= inp;
nq1 <= (w1 and q1)or((not w1) and inp);

x2 : D_FFp port map (D => nq0,CLK => CLK,rst => rst,Q => q0);
x3 : D_FFp port map (D => nq1,CLK => CLK,rst => rst,Q => q1);

Q <= (q1 and q0) or ((not w1) and inp);
end WhatDoYouCare;



library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity ledcontroller is
  port (reactRaw,bigCLK,rstRaw,startUpRaw,timeOutRaw: in std_logic; led,ledrst,work: out std_logic);
end entity;
architecture diva of ledcontroller is
component D_FFp port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
component randomNumGen is
  port (clk,grab : in std_logic;randomNum : out std_logic_vector(10 downto 0));
end component;
component twoCounterp is
  port (CLK,rst: in std_logic; Q: out std_logic);
end component;
component countDownTimer is
  port (inp:std_logic_vector(11 downto 0);CLK,rst: in std_logic; Qout: out std_logic);
end component;
component oneK is
  port (CLK: in std_logic; Q: out std_logic);
end component;
component statecontroller is
  port (react,rst,start,clk: in std_logic; working: out std_logic);
end component;
component debouncer is
  port (CLK,rst,inp: in std_logic; Q: out std_logic);
end component;
signal input1 : std_logic_vector(11 downto 0);
signal input : std_logic_vector(10 downto 0);
signal ledrst1,led1,w1,smallCLK,working,w2,w3,gameOver,react,rst,startUp,timeOut,earlyReact: std_logic;
begin

deb1 : debouncer port map (CLK => smallCLK,rst => '0',inp => reactRaw,Q => react);
deb2 : debouncer port map (CLK => smallCLK,rst => '0',inp => rstRaw,Q => rst);
deb3 : debouncer port map (CLK => smallCLK,rst => '0',inp => startUpRaw,Q => startUp);
deb4 : debouncer port map (CLK => smallCLK,rst => '0',inp => timeOutRaw,Q => timeOut);

gameOver <= startUp or timeOut;

state : statecontroller port map (react => react,rst => gameOver,start => rst,clk => bigCLK,working => working);

clock : oneK port map (CLK => bigCLK,Q => smallCLK);

w2 <= (react) or rst;

randomNum : randomNumGen port map (clk => bigCLK,grab => w2,randomNum => input(10 downto 0));

input1(11) <= input(10);
input1(10) <= not input(10);
input1(9 downto 0) <= input(9 downto 0);
timer : countDownTimer port map (inp => input1,CLK => smallCLK,rst => led1,Qout => w1);

w3 <= ((react) or rst or (not working)); 
dff1 : twoCounterp port map(CLK => w1,rst => w3,Q => led1);
dff2 : D_FFp port map (D => led1,CLK => bigCLK,rst => '0',Q => ledrst1);

ledrst <= ledrst1;
led <= led1;
work <= working;

end diva;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity timeRegister is
  port (inp: in std_logic_vector(13 downto 0);react,rst : in std_logic; Q: out std_logic_vector(13 downto 0));
end entity;
architecture smruti of timeRegister is
component D_FFp port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
begin
	x0 : D_FFp port map (D => inp(0), CLK => react, rst => rst, Q => Q(0));
	x1 : D_FFp port map (D => inp(1), CLK => react, rst => rst, Q => Q(1));
	x2 : D_FFp port map (D => inp(2), CLK => react, rst => rst, Q => Q(2));
	x3 : D_FFp port map (D => inp(3), CLK => react, rst => rst, Q => Q(3));
	x4 : D_FFp port map (D => inp(4), CLK => react, rst => rst, Q => Q(4));
	x5 : D_FFp port map (D => inp(5), CLK => react, rst => rst, Q => Q(5));
	x6 : D_FFp port map (D => inp(6), CLK => react, rst => rst, Q => Q(6));
	x7 : D_FFp port map (D => inp(7), CLK => react, rst => rst, Q => Q(7));
	x8 : D_FFp port map (D => inp(8), CLK => react, rst => rst, Q => Q(8));
	x9 : D_FFp port map (D => inp(9), CLK => react, rst => rst, Q => Q(9));
	x10 : D_FFp port map (D => inp(10), CLK => react, rst => rst, Q => Q(10));
	x11 : D_FFp port map (D => inp(11), CLK => react, rst => rst, Q => Q(11));
	x12 : D_FFp port map (D => inp(12), CLK => react, rst => rst, Q => Q(12));
	x13 : D_FFp port map (D => inp(13), CLK => react, rst => rst, Q => Q(13));

end smruti;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
   port(x0,y0,c0: in std_logic;
        s0,c1: out std_logic);
end entity;
architecture Struct of FullAdder is
begin
s0 <= c0 xor x0 xor y0;

   c1  <= (y0 and x0) or (y0 and c0) or (x0 and c0);
   
end Struct;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity fourteenbitadder is
port (x,y : in std_logic_vector(13 downto 0);rst:in std_logic;
add : out std_logic_vector(13 downto 0));
end entity;
architecture behave of fourteenbitadder is
signal w,z: std_logic_vector(13 downto 0);
component FullAdder is port(x0, y0, c0: in std_logic;s0, c1: out std_logic);
end component FullAdder;

begin

x1 : FullAdder port map (x0 => x(0) ,y0 => y(0), c0 => '0' , s0 => z(0) ,c1 => w(0));
x2 : FullAdder port map (x0 => x(1) ,y0 => y(1), c0 => w(0) , s0 => z(1),c1 => w(1));
x3 : FullAdder port map (x0 => x(2) ,y0 => y(2), c0 => w(1) , s0 => z(2),c1 => w(2));
x4 : FullAdder port map (x0 => x(3) ,y0 => y(3), c0 => w(2) , s0 => z(3),c1 => w(3));
x5 : FullAdder port map (x0 => x(4) ,y0 => y(4), c0 => w(3) , s0 => z(4),c1 => w(4));
x6 : FullAdder port map (x0 => x(5) ,y0 => y(5), c0 => w(4) , s0 => z(5),c1 => w(5));
x7 : FullAdder port map (x0 => x(6) ,y0 => y(6), c0 => w(5) , s0 => z(6),c1 => w(6));
x8 : FullAdder port map (x0 => x(7) ,y0 => y(7), c0 => w(6) , s0 => z(7),c1 => w(7));
x9 : FullAdder port map (x0 => x(8) ,y0 => y(8), c0 => w(7) , s0 => z(8),c1 => w(8));
x10 : FullAdder port map (x0 => x(9) ,y0 => y(9), c0 => w(8) , s0 => z(9),c1 => w(9));
x11 : FullAdder port map (x0 => x(10) ,y0 => y(10), c0 => w(9) , s0 => z(10),c1 => w(10));
x12 : FullAdder port map (x0 => x(11) ,y0 => y(11), c0 => w(10) , s0 => z(11),c1 => w(11));
x13 : FullAdder port map (x0 => x(12) ,y0 => y(12), c0 => w(11) , s0 => z(12),c1 => w(12));
x14 : FullAdder port map (x0 => x(13) ,y0 => y(13), c0 => w(12) , s0 => z(13),c1 => w(13));

add(0) <= z(0) and (not rst);
add(1) <= z(1) and (not rst);
add(2) <= z(2) and (not rst);
add(3) <= z(3) and (not rst);
add(4) <= z(4) and (not rst);
add(5) <= z(5) and (not rst);
add(6) <= z(6) and (not rst);
add(7) <= z(7) and (not rst);
add(8) <= z(8) and (not rst);
add(9) <= z(9) and (not rst);
add(10) <= z(10) and (not rst);
add(11) <= z(11) and (not rst);
add(12) <= z(12) and (not rst);
add(13) <= z(13) and (not rst);
end behave;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

entity onereact is
port (clk,ledrst,working,reactRaw,rstRaw : in std_logic;output : out std_logic_vector(13 downto 0);gameOver : out std_logic);
end entity;
architecture champak of onereact is
component oneK is
  port (CLK: in std_logic; Q: out std_logic);
end component;
component mainCounter is
  port (CLK,rst: in std_logic; Q: out std_logic_vector(10 downto 0));
end component;
component timeRegister is
  port (inp: in std_logic_vector(13 downto 0);react,rst : in std_logic; Q: out std_logic_vector(13 downto 0));
end component;
component fourteenbitadder is
port (x,y : in std_logic_vector(13 downto 0);rst:in std_logic;
add : out std_logic_vector(13 downto 0));
end component;
component debouncer is
  port (CLK,rst,inp: in std_logic; Q: out std_logic);
end component;
component D_FFp is
  port (D,CLK,rst: in std_logic; Q: out std_logic);
end component;
signal w1,w2,react,rst,gameOver1,timeOut,errorIn,extra1,extra2,extra3 : std_logic;
signal w3,inputToAdder,fromDFF,w4 : std_logic_vector(13 downto 0);
begin

deb1 : debouncer port map (CLK => w1,rst => '0',inp => reactRaw,Q => react);
deb2 : debouncer port map (CLK => w1,rst => '0',inp => rstRaw,Q => rst);

mainCLK : oneK port map (CLK => clk , Q => w1);

w2 <= working and w1 ;

mainCounter1 : mainCounter port map (CLK => w2 , rst => (not working) or (not ledrst),Q => w3(10 downto 0));

w3(13) <= '0';
w3(12) <= '0';
w3(11) <= '0';

extra1 <= react and working;
extra2 <= rst or gameOver1;
extra3 <= (not react) and (working);

reg1 : timeRegister port map (inp => w3,react => react,rst => (not working), Q => inputToAdder); 

adder : fourteenbitadder port map (x => inputToAdder,y => fromDFF,rst => (not working), add => w4);

reg2 : timeRegister port map (inp => w4,react => ledrst,rst => (not working),Q => fromDFF);

outreg : timeRegister port map (inp => w4,react => extra3,rst => extra2,Q => output);

timeOut <= w3(0) and w3(1) and w3(2) and w3(3) and w3(4) and w3(5) and w3(6) and w3(7) and w3(8) and w3(9) and w3(10) ;

gameOverDFF : D_FFp port map ( D => not ledrst,CLK => extra1, rst => (not working), Q => errorIn);

gameOver1 <= timeOut or errorIn;

gameOver <= gameOver1;

end champak;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lcd_controller is
port (clk    : in std_logic;                          
      rst    : in std_logic;                          -- reset
      erase : in std_logic;                  --- clear position
      put_char : in std_logic;
      write_data : in std_logic_vector(7 downto 0) ;
      write_row : in std_logic_vector(0 downto 0);
      write_column : in std_logic_vector(3 downto 0);
      ack : out std_logic;
      lcd_rw : out std_logic;                         --read & write control
      lcd_en : out std_logic;                         --enable control
      lcd_rs : out std_logic;                         --data or command control
      lcd1  : out std_logic_vector(7 downto 0);
      b11 : out std_logic;
      b12 : out std_logic);     --data line
end lcd_controller;


architecture Behavioral of lcd_controller is 

type arr is array (0 to 4) of std_logic_vector(7 downto 0);
 constant lcd_cmd : arr := (x"38",x"01",x"0C",x"80",x"04");  -- cmd for LCD

 
signal lcd : std_logic_vector ( 7 downto 0);
signal count_next_cmd, count_cmd :integer range 0 to 5;
signal count_next_data, count_data :integer range 0 to 6;
signal count_next_data1, count_data1 :integer range 0 to 4;
signal cmd_line, cmd_line_next :integer range 0 to 10;
signal cmd_position : std_logic_vector(7 downto 0);
signal data_dis : std_logic_vector(7 downto 0);


type state_type is ( S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11 );
signal state : state_type := S0;

begin

count_next_cmd <= count_cmd + 1;
count_next_data <= count_data + 1;
count_next_data1 <= count_data1 + 1;
cmd_line_next <= cmd_line + 1;
b11 <= '1';
b12 <= '0';
lcd1 <= lcd;

process(clk)
begin
if rising_edge(clk) then
if (write_row(0) = '0') then          -- first row
   cmd_position <= x"80" + write_column ;
   elsif (write_row(0) = '1') then        -- second row
    cmd_position <= x"C0" + write_column ;
end if;
end if;
end process;


PROCESS(clk)

BEGIN

if rising_edge(clk) then

if (rst='0') then
		state <= S0;
		count_cmd <= 0;
		count_data <= 0;
		count_data1 <= 0;
		cmd_line <= 0;
		ack <= '0';
	else
	
	case state is	
	
		when S0=>		-- S0 to S2: Send LCD commands	
			if (count_cmd < 5) then		
				lcd <= lcd_cmd(count_cmd);
				lcd_rs <= '0';
				lcd_rw <= '0';
				lcd_en <= '0';
				ack <= '0';
				state <= S1;
			else 
				state <= S3;				
			end if;
							
		when S1=>	
			lcd <= lcd_cmd (count_cmd);
			lcd_rs <= '0';
			lcd_rw <= '0';
			lcd_en <= '1';
			ack <= '0';
			state <= S2;		
		
			
		when S2 =>	
			lcd <= lcd_cmd (count_cmd);
			lcd_rs <= '0';
			lcd_rw <= '0';
			lcd_en <= '0';
			ack <= '0';
			state <= S0;
			count_cmd <= count_next_cmd;
		
							
		when S3 =>	            -- S3 to S5: Send LCD command position
			lcd <= cmd_position;
			lcd_rs <= '0';
			lcd_rw <= '0';
			lcd_en <= '0';
			ack <= '0';
			state <= S4;	
			
		when S4 =>
			lcd <= cmd_position;
			lcd_rs <= '0';
			lcd_rw <= '0';
			lcd_en <= '1';
			ack <= '0';
			state <= S5;
		
							
		when S5 =>		
			lcd <= cmd_position;
			lcd_rs <= '0';
			lcd_rw <= '0';
			lcd_en <= '0';	
			ack <= '0';
			state <= S6;
			
	when S6=>                     -- S6 to S8: Send LCD data or clear
		   if (erase = '1' ) then
		      data_dis <= x"20";  -- to clear the data
			   lcd <=  data_dis;
			   lcd_rs <= '1';
			   lcd_rw <= '0';
			   lcd_en <= '0';
			   ack <= '0';
			   state <= S7;
			elsif ( put_char = '1') then
			   data_dis <= write_data;       -- lcd data
				lcd <=  data_dis;
			   lcd_rs <= '1';
			   lcd_rw <= '0';
			   lcd_en <= '0';
			   ack <= '0';
			   state <= S7;				
			elsif ( erase = '0' and put_char = '0') then
			   state <= S3;
			end if; 
			
	when S7=>
			lcd <= data_dis ;
			lcd_rs <= '1';
			lcd_rw <= '0';
			lcd_en <= '1';
			ack <= '0';
			state <= S8;
		   
			
	when S8=>		
			lcd <= data_dis  ;
			lcd_rs <= '1';
			lcd_rw <= '0';
			lcd_en <= '0';
			ack <= '1';     
			state <= S9;

	when S9 =>
		   ack <= '0';
		   state <= s3;
			
	when others =>
			state <= S0;
			count_cmd <= 0;		
							
	end case;
	end if;
   end if;
end process;

end Behavioral;


library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;


entity mergeReact is
port (clk,react,rst,startUp : in std_logic;output : out std_logic_vector(15 downto 0);led,gameOver : out std_logic);
end entity;
architecture pedrubut of mergeReact is
component onereact is
port (clk,ledrst,working,reactRaw,rstRaw : in std_logic;output : out std_logic_vector(13 downto 0);gameOver : out std_logic);
end component;
component ledcontroller is
  port (reactRaw,bigCLK,rstRaw,startUpRaw,timeOutRaw: in std_logic; led,ledrst,work: out std_logic);
end component;

signal ledrst,timeOut,working : std_logic;
begin

x1 : onereact port map (clk => clk,ledrst => ledrst,working => working,reactRaw => not react,rstRaw => not rst,output => output(13 downto 0),gameOver => timeOut);
gameOver <= timeOut;
x2 : ledcontroller port map (reactRaw => not react,bigCLK => clk,rstRaw => not rst,startUpRaw => not startUp,timeOutRaw => timeOut,led => led,ledrst => ledrst,work => working);

output(15) <= '0';
output(14) <= '0';
end pedrubut;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity mergeDisplay is
 port(clk,react,rst : in std_logic;led : out std_logic;
      lcd_rw : out std_logic;                         --read & write control
      lcd_en : out std_logic;                         --enable control
      lcd_rs : out std_logic;                         --data or command control
      lcd1  : out std_logic_vector(7 downto 0);
      b11 : out std_logic;
      b12 : out std_logic;
		output : out std_logic_vector(15 downto 0));
      end entity;
architecture final of mergeDisplay is
component oneK is
  port (CLK: in std_logic; Q: out std_logic);
end component;
component mergeReact is
port (clk,react,rst,startUp : in std_logic;output : out std_logic_vector(15 downto 0);led,gameOver : out std_logic);
end component;
component lcd_controller is
port (clk    : in std_logic;                          
      rst    : in std_logic;                          -- reset
      erase : in std_logic;                  --- clear position
      put_char : in std_logic;
      write_data : in std_logic_vector(7 downto 0) ;
      write_row : in std_logic_vector(0 downto 0);
      write_column : in std_logic_vector(3 downto 0);
      ack : out std_logic;
      lcd_rw : out std_logic;                         --read & write control
      lcd_en : out std_logic;                         --enable control
      lcd_rs : out std_logic;                         --data or command control
      lcd1 : out std_logic_vector(7 downto 0);
      b11 : out std_logic;
      b12 : out std_logic);     --data line
end component;
component D_FFp is
  port (D, CLK,rst: in std_logic; Q: out std_logic);
end component;
signal smallclk1,led1,erase,ack1,gameOver,g1 : std_logic;
signal trans : std_logic_vector(15 downto 0);
--variable outDec : integer range 0 to 65535;
signal put_char,temp3 :  std_logic:='1' ;
signal write_data :  std_logic_vector(7 downto 0) ;
signal write_row :  std_logic_vector(0 downto 0);
signal write_column :  std_logic_vector(3 downto 0) := "0000";
type dataarr1 is array (0 to 17) of std_logic_vector(7 downto 0);
type intarr is array (3 downto 0) of integer range 0 to 9;
constant lcd_data1 : dataarr1 := (x"30",x"31",x"32",x"33",x"34",x"35",x"36",x"37",x"38",x"39",x"41",x"42",x"43",x"44",x"45",x"46",x"4B",x"55");   
signal i, temp: integer := 0;
signal j : integer := 0; 
signal dig : intarr ;
begin
smallCLK: oneK port map(CLK => clk,Q => smallclk1);


led <= led1;
gameBin : mergeReact port map (clk => clk,react => react,rst => rst,startUp => '1',output => trans,led => led1,gameOver => g1);
 
display : lcd_controller port map (clk => smallclk1,rst => rst,erase => erase,put_char => put_char,write_data => lcd_data1(i),write_row => write_row,write_column => write_column,lcd_rw => lcd_rw,lcd_en => lcd_en,lcd_rs => lcd_rs,lcd1 => lcd1,b11 => b11,b12 => b12,ack => ack1);

temp <= to_integer(unsigned(trans));
dig(0) <= to_integer(unsigned(trans(3 downto 0)));
dig(1) <= to_integer(unsigned(trans(7 downto 4))) ;
dig(2) <= to_integer(unsigned(trans(11 downto 8)));--(temp/100) rem 10;
dig(3) <= to_integer(unsigned(trans( 15 downto 12)));--(temp/1000) rem 10;

output <= trans;
dff1 : D_FFp port map (D => '1',CLK => g1,rst => not rst,Q => gameOver);
process (smallclk1,ack1,rst)
 
begin
if (rising_edge(smallclk1)) then
erase <= '0';
if(ack1 = '1')then 
	if (j = 0) then
		write_column <= "0011";
		if (gameOver = '1')then
		i <= 16;
		else
		i <= dig(0);
		end if;
		put_char <= '1';
		write_row <= "0";
	elsif (j = 1)then
		write_column <= "0010";
		if (gameOver = '1')then
		i <= 12;
		else
		i <= dig(1);
		end if;
		put_char <= '1';
		write_row <= "0";
	elsif (j = 2)then
		write_column <= "0001";
		if (gameOver = '1')then
		i <= 17;
		else
		i <= dig(2);
		end if;
		put_char <= '1';
		write_row <= "0";
	elsif (j = 3)then
		write_column <= "0000";
		if (gameOver = '1')then
		i <= 15;
		else
		i <= dig(3);
		end if;
		put_char <= '1';
		write_row <= "0";
	end if;
	
	if(j = 3 )then
		j <= 0;
	else 
		j <= j + 1;	
	end if;
end if;	
end if;

end process;



end final;
-----------working code---------Chain41.svf--vlgr in /output files

----Chain42.svf






