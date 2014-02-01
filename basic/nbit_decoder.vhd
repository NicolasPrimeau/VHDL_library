Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nbit_decoder is
	generic(
		numInputs: integer:=3
	);
	port(
		inputs: in std_logic_vector(numInputs-1 downto 0);
		output: out std_logic_vector(numInputs**2 -1 downto 0)
		enable: in std_logic;
	);
end entity;

architecture primary of nbit_decoder is
signal bitToSet: integer;
signal tempOutput: std_logic_vector(numInputs**2 -1 downto 0);

begin
process(bitToSet,tempOutput,inputs,output,enable) begin
  if(enable = '1') then
	bitToSet <= to_integer(unsigned(inputs));
	tempOutput(bitToSet) <= '1';
	output <= tempOutput;
  else
	output <= (others => '0');
  end if;
end primary;

