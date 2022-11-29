
-- cria restrição


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


ENTITY bloqueia IS 
	PORT
	(
		entradaA :  IN  STD_LOGIC;
		coluna :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		saida :  OUT  STD_LOGIC
	);
END bloqueia;

ARCHITECTURE bloqueia OF bloqueia IS 
	signal col : INTEGER RANGE 0 to 639;
begin
process(entradaA)
begin
	col <= to_integer(unsigned(coluna));
	
	if (col < 20 or col >= 620) then saida <= '0';
	else  saida <= entradaA;
	end if;

end process;

END bloqueia;