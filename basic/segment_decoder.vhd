Library ieee;
use ieee.std_logic_1164.all;

entity segment_decoder is
	port(
		hexIn: in std_logic_vector(3 downto 0);
		segmentMux: out std_logic_vector(6 downto 0)
	);
end segment_decoder;

architecture primary of segment_decoder is

begin
process(hexIn) begin
	case hexIn is
		when "0000" => segmentMux <= "0000001";
		when "0001" => segmentMux <= "1111001";
		when "0010" => segmentMux <= "0100100";
		when "0011" => segmentMux <= "0110000";
		when "0100" => segmentMux <= "0011001";
		when "0101" => segmentMux <= "0010010";
		when "0110" => segmentMux <= "0000010";
		when "0111" => segmentMux <= "1111000";
		when "1000" => segmentMux <= "0000000";
		when "1001" => segmentMux <= "0010000";
		when "1010" => segmentMux <= "0001000";
		when "1011" => segmentMux <= "0000011";
		when "1100" => segmentMux <= "1000110";
		when "1101" => segmentMux <= "0100001";
		when "1110" => segmentMux <= "0000110";
		when "1111" => segmentMux <= "0001110";
	end case;
end process;
end primary;