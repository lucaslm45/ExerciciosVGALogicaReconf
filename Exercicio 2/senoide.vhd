
-- cria senoide em 640*480


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


ENTITY senoide IS 
	PORT
	(
		clock		:	in std_logic;
		linha :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		linhaROM :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		a :  OUT  STD_LOGIC
	);
END senoide;

ARCHITECTURE senoide OF senoide IS 
	signal lin : INTEGER RANGE 0 to 639;
	signal linROM : INTEGER RANGE 0 to 639;
begin
process(clock)
begin
	if (clock'event and clock = '1') then
	
	linROM <= to_integer(unsigned(linhaROM));
	lin <= to_integer(unsigned(linha));
	
	if (lin = linROM) then a <= '1';
	else  a <= '0';
	end if;
	end if;

end process;

END senoide;