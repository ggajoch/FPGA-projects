LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity keyBoardMatrice is
generic (size : positive := 4);
port ( rows: in std_logic_vector(0 to size-1); 
		 lines: out std_logic_vector(0 to size-1); 
		 values: inout std_logic_vector(0 to 15); 
		 clock : in std_logic);
end;
architecture keyBoardMatrice_arch of keyBoardMatrice is
signal binary : std_logic_vector(0 to 1);
signal coded : std_logic_vector(0 to 3);
signal clock_internal : std_logic := '0';
begin
	counter: entity work.counter(counter_arch)
		generic map (NBit => 2)
		port map (clock_internal, '0', binary);
	decoder: entity work.BinToOneHot(BinToOneHotArch)
		generic map(NBit => 2)
		port map(binary, coded);
	process(clock) is
	variable state : integer := 0;
	--variable actual : unsigned := (others => '0');
	variable actualN : natural := 0;
	begin
		if( clock'event and clock = '1' ) then
			if( state = 0 ) then
				lines <= not coded;
				state := 1;
				clock_internal <= '0';
			else
				--actual := unsigned(binary);
				actualN := to_integer(unsigned(binary));				
				values(actualN*4 to 4*actualN+3) <= not rows;
				state := 0;
				clock_internal <= '1';
			end if;
		end if;
	end process;
end;