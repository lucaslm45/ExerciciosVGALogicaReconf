
-- cria quadro em 640*480


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;


ENTITY quadro IS 
	PORT
	(
		coluna :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		linha :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		moveHor :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		moveVer :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		a :  OUT  STD_LOGIC
	);
END quadro;

ARCHITECTURE quadro OF quadro IS 
	signal hor : INTEGER RANGE 0 to 640;
	signal ver : INTEGER RANGE 0 to 640;
	signal col : INTEGER RANGE 0 to 640;
	signal lin : INTEGER RANGE 0 to 640;
begin
process (coluna, linha)
begin
	hor <= to_integer(unsigned(moveHor));
	ver <= to_integer(unsigned(moveVer));
	col <= to_integer(unsigned(coluna)) - hor*2;
	lin <= to_integer(unsigned(linha)) - ver*2;
	
	if ((col > 300 and col < 310) and (lin > 300 and lin < 310)) then a <= '1';
	else  a <= '0';
	end if;

end process;

END quadro;