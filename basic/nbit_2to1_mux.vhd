Library ieee;
use ieee.std_logic_1164.all;

entity nbit_2to1_mux is
	generic(
		bitsPerVector: integer:=4
	);
	port(
		inputBus0,inputBus1: in std_logic_vector(bitsPerVector -1 downto 0);
		selector: in std_logic;
		enable: in std_logic;
		outputBus: out std_logic_vector(bitsPerVector-1  downto 0)
	);
end nbit_2to1_mux;

architecture primary of nbit_2to1_mux is
begin
process(inputBus0,inputBus1,selector,enable) begin
    if(enable = '1') then
	case selector is
		when '0'=> outputBus <= inputBus0;
		when '1'=> outputBus <= inputBus1;
	end case;
    else
	outputBus <= (others => '0');
    end if;
end process;
end primary;
