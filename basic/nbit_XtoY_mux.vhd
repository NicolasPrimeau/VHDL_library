Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity nbit_XtoY_mux is
	generic(
		bitPerInput: integer:=2;
		numInputs: integer:=4
	);
	port(
		enable: in std_logic;
		input:in std_logic_vector(bitPerInput*numInputs-1 downto 0);
		output:out std_logic_vector(bitPerInput-1 downto 0);
		selectors: in std_logic_vector(integer(log2(real(numInputs)))-1 downto 0)
	);
end entity;

architecture primary of nbit_XtoY_mux is
type inputArray is array (numInputs-1 downto 0) of std_logic_vector(bitPerInput-1 downto 0);
signal inputs: inputArray;

begin
process(input,enable) begin
  if(enable ='1') then
	for i in 0 to numInputs-1 loop
		inputs(i) <= input(((i+1)*bitPerInput)-1 downto i*bitPerInput);
	end loop;
  else
	inputs <= (others => '0');
  end if;
end process;

	output <= inputs(to_integer(unsigned(selectors)));

end primary;
