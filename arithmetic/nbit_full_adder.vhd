Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nbit_full_adder is
	generic(n: integer:=4);
	port(
		opA,opB: in std_logic_vector(n-1 downto 0);
		carry_in: in std_logic_vector(0 downto 0);
		carry_out: out std_logic;
		sum: out std_logic_vector(n-1 downto 0)
	);
end nbit_full_adder;

architecture primary of nbit_full_adder is
signal tempSum: std_logic_vector(n downto 0);
signal intSum: integer;

begin
	intSum <= to_integer(unsigned(opA)) + to_integer(unsigned(opB)) + to_integer(unsigned(carry_in));
	tempSum <= std_logic_vector(to_unsigned(intSum,n+1));
	carry_out <= tempSum(n);
	sum <= tempSum(n-1 downto 0);

end primary;