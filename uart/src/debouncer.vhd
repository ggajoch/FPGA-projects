LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity debouncerBit is
port (input: in std_logic; output: out std_logic; clk:in std_logic );
end debouncerBit;
architecture debouncerBitArch of debouncerBit is
signal last_ones : std_logic_vector(0 to 1) := "00";
begin
	process(clk) is
	variable counter : natural := 0;
	begin
		if( clk'event and clk = '1' ) then
			last_ones(0) <= input;
			last_ones(1) <= last_ones(0);
			if( (last_ones(0) xor last_ones(1)) = '1' ) then
				counter := 0;
			else
				if( counter < 5000 ) then -- 5ms
					counter := counter + 1;
				else 
					output <= last_ones(1);
				end if;
			end if;
		end if;
	end process;
end;


------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity debouncerVector is
generic (NBit : positive := 5; ticks : positive := 50);
port (input: in std_logic_vector(0 to NBit-1); output: out std_logic_vector(0 to NBit-1); clk:in std_logic );
end debouncerVector;
architecture debouncerVectorArch of debouncerVector is
signal last1 : std_logic_vector(0 to NBit-1);
signal last2 : std_logic_vector(0 to NBit-1);
begin
	process(clk) is
	variable counter : natural := 0;
	begin
		if( clk'event and clk = '1' ) then
			last1 <= input;
			last2 <= last1;
			if( last1 /= last2 ) then
				counter := 0;
			else
				if( counter < ticks ) then
					counter := counter + 1;
				else 
					output <= input;
				end if;
			end if;
		end if;
	end process;
end;