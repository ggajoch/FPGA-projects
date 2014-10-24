LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TwoDigitBinToBCD is
	port( input: in std_logic_vector(0 to 7); outputTens : out std_logic_vector(0 to 3); outputOnes : out std_logic_vector(0 to 3) );
end TwoDigitBinToBCD;

architecture TwoDigitBinToBCDArch of TwoDigitBinToBCD is
signal valueTens : std_logic_vector(0 to 3);
signal valueOnes : std_logic_vector(0 to 3);
begin
	process(input) is
		variable val : integer := 0;
		variable tens : integer := 0;
		variable ones : integer := 0;
	begin
		val := to_integer(unsigned(input));
		tens :=  val / 10;
		ones :=  val mod 10;
		outputOnes <= std_logic_vector(to_unsigned(ones, outputOnes'length));
		outputTens <= std_logic_vector(to_unsigned(tens, outputTens'length));
	end process;
end architecture;