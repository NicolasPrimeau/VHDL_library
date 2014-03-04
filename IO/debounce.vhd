--Author Nicolas Primeau
--
--Component : Debounce
--
--Description: A component that debounces inputs from physical devices that are 
-- susceptible to debouncing. The generic is a constant that needs to be set.
-- It depends on the clock used. By default it's 2000000 which gives us 20 ms on
-- a 100 MHz clock.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debounce is
generic(timeOut: integer:=2000000);
port(
	input: in std_logic;
	clk: in std_logic;
	output: out std_logic
);
end debounce;

architecture Behavioral of debounce is
begin

count: process(input,clk)
variable count: integer:=0;
variable inputCapture: std_logic;
begin
if(rising_edge(clk)) then

if(count = 0) then 
  inputCapture := input;  
end if;

count := count +1;

if(count = timeOut AND input = inputCapture) then
  output <= input;
  count := 0;
elsif not(input = inputCapture) then
  count := 0;
end if;
end if;
end process;
end Behavioral;
