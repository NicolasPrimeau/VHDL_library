Library ieee;

use ieee.std_logic_1164.all;

entity nbit_basic_alu is
generic (bitsPerVector: integer:=4);
port(
  enable : in std_logic;
  opA : in std_logic_vector(bitsPerVector-1 downto 0);
  opB : in std_logic_vector(bitsPerVector-1 downto 0);
  result: out std_logic_vector(bitsPerVector-1 downto 0);
  selector: in std_logic_vector(1 downto 0);
  c_out: out std_logic;
  c_in: in std_logic 
);
end nbit_basic_alu;

architecture primary of nbit_basic_alu is
signal temp_res: std_logic_vector(bitsPerVector  downto 0);
begin

process(opA,opB,enable,selector,temp_res) 
variable opA_int,opB_int,res_int: integer;
begin

if(enable = '1') then
  opA_int := to_integer(signed(opA));
  opB_int := to_integer(signed(opB));
  if(selector = "00") then
    res_int := opA_int;
  elsif(selector = "01) then
    res_int := opA_int+1;
  elsif(selector = "10") then
    res_int := opA_int - opB_int -1;
  elsif(selector = "11") then
    res_int := opA_int - opB_int;
  end if
  res_int := res_int + to_integer(unsigned(c+in));
  temp_res <= std_logic_vector(to_signed(res_int,bitsPerVector));
  c_out <= temp_res(bitsPerVector);
  result <= temp_res(bitsPerVector-1 downto 0);
else 
  result<= (others => '0');
  c_out <= '0';
end if
end process;
end primary;
