Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM_1024x8 is
  port(
      rd0_wr1,clk,enable:in std_logic;
      address: in std_logic_vector(9 downto 0);
      dataIN: in std_logic_vector( 7 downto 0);
      dataOUT: out std_logic_vector(7 downto 0)
  );
end RAM_1024x8;

architecture primary of RAM_1024x8 is
type RAM is array (1023 downto 0) of integer range 0 to 255;
begin
process(clk,rd0_wr1,enable,address, dataIN)
variable storage: RAM;
begin
	if(clk' event and clk = '1') then
		if(enable = '1') then
			if(rd0_wr1 = '0') then
				dataOUT <= std_logic_vector(to_unsigned(storage(to_integer(unsigned(address))),8));
			elsif(rd0_wr1 = '1') then
				storage(to_integer(unsigned(address))) := to_integer(unsigned(dataIN));
			end if;
		end if;
	end if;
end process;
end;
