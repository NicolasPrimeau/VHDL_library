----------------------------------------------------------------------------------
-- Nicolas Primeau
-- 
-- Create Date:    13:24:12 03/15/2014 
-- Design Name:    Asynchronous Generic Memory
-- Module Name:    Mem_Async - Behavioral 
-- Description: 
--
-- Asynchronous generic memory. CAREFUL, Do not write until the address has been
-- stablized or else you might write to an unpredictable place! This component is
-- much better when you only want to read from it with STABLE address bus. STABLE.
-- ADDRESS. BUS.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mem_Async is
generic(memSize: integer:=8;
        numAdr: integer:=512);
port(
	dataIn: in std_logic_vector(memSize -1 downto 0);
	dataOut: out std_logic_vector(memSize-1 downto 0);
	addr: in std_logic_vector((integer(log2(real(numAdr))))-1 downto 0);
	rd_wr: in std_logic; -- rd low, wr high
	reset: in std_logic
);
end Mem_Async;

architecture Behavioral of Mem_Async is
type RAM is array (numAdr-1 downto 0) of std_logic_vector(memSize -1);
signal memory: RAM;
begin
  if(reset = '1') then
    memory(numAdr-1 downto 0)(memSize -1) => (others =>'0');
	 dataOut <= (others => '0');
  elsif(rd_wr = '0') then
    dataOut <= memory(to_integer(unsigned(addr)));
  elsif(rd_wr = '1') then
    memory(to_integer(unsigned(addr))) <= dataIn;
    dataOut <= (others => '0');
  else
    dataOut <= (others=>'0');  
  end if;
end Behavioral;

