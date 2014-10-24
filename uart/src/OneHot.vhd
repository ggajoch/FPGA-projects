LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity BinToOneHot is
generic (NBit : positive := 3);
port (input: in std_logic_vector(0 to NBit-1); output : out std_logic_vector(0 to 2**NBit-1));
end;
architecture BinToOneHotArch of BinToOneHot is
begin
	process(input) is
	variable zeros:std_logic_vector(2**NBit-1 downto 0) := ('1', others => '0');
	begin
		output <= std_logic_vector(unsigned(zeros) srl to_integer(unsigned(input)));
	end process;
end;


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity OneHotToBin is
generic (NBit : positive := 4);
port (input: in std_logic_vector(0 to 2**NBit-1); output : out std_logic_vector(0 to NBit));
end;
architecture OneHotToBinArch of OneHotToBin is
begin
	process(input) is
	variable outTmp: std_logic_vector(0 to NBit) := (others => '1');
	begin
		outTmp := (others => '0');
		for i in 0 to 2**NBit-1 loop
			if( input(i) = '1' ) then
				outTmp := (std_logic_vector(to_unsigned(i+1, output'length)));
				exit;
			end if;
		end loop;
		output <= outTmp;
	end process;
end;