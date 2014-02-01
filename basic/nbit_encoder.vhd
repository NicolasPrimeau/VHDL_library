Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity nbit_encoder is
	generic(
		numInputs: integer:=4
	);
	port(
		enable: in std_logic;
		inputVector: in std_logic_vector(numInputs -1 downto 0);
		outputVector: out std_logic_vector(integer(log2(Real(numInputs))) -1 downto 0)
	);
end nbit_encoder;

architecture primary of nbit_encoder is
signal outputTemp: std_logic_vector(integer(log2(Real(numInputs))) -1 downto 0);
begin
process(enable,inputVector,outputTemp)
begin
  if(enable = '1') then
    outputTemp <= (others=>'0');
	for num in 0 to numInputs-1 loop
		if(inputVector(num) = '1') then
			outputTemp <= std_logic_vector((to_unsigned(num, integer(log2(Real(numInputs))))));
		end if;
	end loop;
  else
		outputTemp <= (others=>'0');
  end if
end process;
	outputVector<=outputTemp;

end primary;
