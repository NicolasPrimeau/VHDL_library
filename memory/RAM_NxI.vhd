Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity RAM_NxI is 
	generic(
		numberAddress: integer:=1024;
		entrySize: integer:=8
	);
	port(
		enable,clk,rd0_wr1: in std_logic;
		address: in std_logic_vector((integer(log2(real(numberAddress))))-1 downto 0);
		dataIN: in std_logic_vector(entrySize-1 downto 0);
		dataOUT: out std_logic_vector(entrySize-1 downto 0)
	);
end RAM_NxI;

architecture primary of RAM_NxI is
type RAM is array (numberAddress-1 downto 0) of integer range 0 to (2**entrySize)-1;
begin
process(clk,rd0_wr1,enable,address,dataIN)
variable storage: RAM;
begin
	if(clk' event and clk ='1') then
		if(enable = '1') then			
			if(rd0_wr1 = '0') then
			dataOUT <= std_logic_vector(to_unsigned(storage(to_integer(unsigned(address))),entrySize));	
			elsif(rd0_wr1 = '1') then
			storage(to_integer(unsigned(address))) := to_integer(unsigned(dataIN));
			end if;
		end if;
	end if;

end process;

end primary;
