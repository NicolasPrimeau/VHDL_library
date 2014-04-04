library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debounce is
generic(timeOut: integer:=2000000);
port(
	input: in std_logic;
	clk: in std_logic;
	output: out std_logic;
	reset: in std_logic
);
end debounce;

architecture Behavioral of debounce is
signal capture: std_logic;
begin

count: process(input,clk)
variable count: integer range 0 to timeOut*2:=0;
variable inputCapture: std_logic;
begin

if(reset = '1') then
  count := 0;
  inputCapture <= '0';
  output <= '0';
elsif(rising_edge(clk)) then

if(count = 0) then 
  inputCapture := input;  
  capture <= '1';
else
  capture <= '0';
  inputCapture := inputCapture;
end if;


if(capture = '1' AND count = timeOut AND input = inputCapture) then
  output <= inputCapture;
  count := 0;
  capture <= '0';
elsif (capture = '1' and count = timeOut and not(input = inputCapture)) then
  count := 0;
  capture <= '0';
  output <= input;
elsif(capture = '1') then
  capture <= capture;
  count := count+1;
  output <= '0';
else 
  count := count;
  output <= ;
  capture <= '0';
end if;
end if;
end process;
end Behavioral;
