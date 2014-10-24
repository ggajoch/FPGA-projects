LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity EightBitShiftReg is 
	generic (constant fifo_cap : positive := 10);
	port( Din : in std_logic_vector(0 to 7);
			DataFlag : in std_logic;
			Empty: out std_logic;
			Dout : out std_logic_vector(0 to 7);
			PopData : in std_logic;
			clk : in std_logic);
end EightBitShiftReg;
architecture EightBitShiftRegArch of EightBitShiftReg is
signal Memory : std_logic_vector( 0 to fifo_cap*8-1);
signal writePtr : integer range 0 to 790 := 0;
signal lastPop1, lastPop2, lastData1, lastData2 : std_logic;
begin
	process(clk)
	begin
		if( rising_edge(clk) ) then
			lastPop1 <= lastPop2;
			lastPop2 <= PopData;
			lastData1 <= lastData2;
			lastData2 <= DataFlag;
			if( lastData1 /= lastData2 and lastData2 = '1' ) then -- input
				Memory(writePtr to writePtr+7) <= Din;
				writePtr <= writePtr+8;
			end if;
			if( lastPop1 /= lastPop2 and lastPop2 = '1' ) then -- popData
				if( writePtr >= 8 ) then 
					Memory(0 to writePtr-8) <= Memory(8 to writePtr);  --to_stdlogicvector(to_unsigned(Memory) sll 8);
					writePtr <= writePtr-8;
				end if;
			end if;
		end if;
	end process;
	Dout <= Memory(0 to 7);
	Empty <= '0' when writePtr > 0 else
				'1';
end architecture;
