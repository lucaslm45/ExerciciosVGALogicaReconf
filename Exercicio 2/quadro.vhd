
-- cria quadro em 640*480


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


ENTITY quadro IS 
	PORT
	(
		clock		:	in std_logic;
		linha :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		linhaROM :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		a :  OUT  STD_LOGIC
	);
END quadro;

ARCHITECTURE quadro OF quadro IS 
	signal lin : INTEGER RANGE 0 to 640;
	signal linROM : INTEGER RANGE 0 to 640;
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

END quadro;