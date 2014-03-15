Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nbit_multiplier is
	generic(n: integer:=4); 
	port(
		mulA,mulB: in std_logic_vector(n-1 downto 0);
		prod: out std_logic_vector(2*n-1 downto 0)
	);
end nbit_multiplier;

architecture primary of nbit_multiplier is

begin

prod <= std_logic_vector(to_unsigned(to_integer(unsigned(mulA)) * to_integer(unsigned(mulB)),2*n));

end primary;