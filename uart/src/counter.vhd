LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter is
generic (NBit : positive := 3);
port (clock, rst: in std_logic; q:out std_logic_vector(0 to NBit-1):= (others => '0'));
end;
architecture counter_arch of counter is
shared variable c:std_logic_vector(0 to NBit-1) := (others => '0');
begin
	process(clock, rst) is
	--variable zeros:std_logic_vector(2**NBit-1 downto 0) := ('1', others => '0');
	begin
		if( rst = '1' ) then
			c := (others => '0');
		elsif( clock'event and clock = '1' ) then
			c := c+1;
		end if;
		--q <= std_logic_vector(unsigned(zeros) srl to_integer(unsigned(c)));
		q <= c;
	end process;
end;