Library ieee;

use ieee.std_logic_1164.all;

entity nbit_shift_register is
generic(n:integer:=4);
port(
  clk,enable,arsh,alsh,load: in std_logic;
  inputVector: in std_logic_vector(n-1 downto 0);
  outputVector: out std_logic_vector(n-1 downto 0);
  bit_in: in std_logic;
  bit_out: out std_logic;
);
end nbit_shift_register;

architecture primary of nbit_shift_register is

begin

process(clk,enable,arsh,alsh,load,bit_in,inputVector)
variable cdata,ndata: std_logic_vector(n-1 downto 0);
begin

if(clk' event and clk = '1') then
  if (enable = '1') then
    if (load = '1') then
      ndata := inputVector;
    elsif (ashl = '1') then
      for i in 0 to i-2 begin
        ndata(i+1) := cdata(i);
      end for;
      b_out <= cdata(n-1);
    elsif (ashr = '1') then
      for i in 1 to n-1 begin
        ndata(i-1) := cdata(i);
      end for;
      b_out <= cdata(0);
    end if;
  end if;
  outputVector <= ndata;
  cdata <= ndata;
end if;
end process;

end primary; 
