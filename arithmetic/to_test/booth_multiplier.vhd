----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:55 01/25/2014 
-- Design Name:    Nicolas Primeau
-- Module Name:    booth_multiplier - Behavioral 
-- Project Name:   Booth Multiplier
-- Target Devices: Xilinx Spartan 6
-- Tool versions: 
-- Description: A simple hardware implementation of a booth multiplier
--
-- Dependencies: ieee libraries
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_multiplier is
generic(
	n: integer:=4 -- number of bits per vector
);
port(
	multiplicand: in std_logic_vector(n-1 downto 0);
	multiplier: in std_logic_vector(n-1 downto 0);
	result: out std_logic_vector(n*2 -1 downto 0);
	clk,enable,load: in std_logic
);
end booth_multiplier;


architecture Behavioral of booth_multiplier is
signal Q: std_logic_vector(n-1 downto 0) := multiplier;
signal M: std_logic_vector(n-1 downto 0) := multiplicand;
signal notM: std_logic_vector(n-1 downto 0):= not(multiplier);
signal A: std_logic_vector(n-1 downto 0) := (others => '0');
signal Qright: std_logic:='0';

begin

process(clk,enable,load,Q,M,notM,A,Qright) is
variable cRes,nRes: std_logic_vector(n*2 -1 downto 0);


begin
if(clk' event and clk = '1') then
  if(enable = '1') then
    if(load = '1') then
      nRes(n*2 -1 downto n) := A;
      nRes(n-1 downto 0) := Q;
    else
	   for I in n to 1 loop
		  if(cRes(0) = '0' AND Qright = '1') then
		    A <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) + to_integer(unsigned(M))),n));
		  elsif (cRes(0) = '1' AND Qright = '0') then
		    A <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) + to_integer(unsigned(notM))),n));
		  end if;
		    nRes(n*2 -2 downto n-1) := A; -- technically an arith shift right
			 nRes(n-2 downto 0):=cRes(n-1 downto 1); -- ^
			 Qright <= cRes(0);
		end loop;
    end if;
  end if;
    cRes := nRes;
	 result <= nRes; 
end if;
end process;

end Behavioral;

