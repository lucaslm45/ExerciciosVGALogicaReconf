library IEEE;
use  IEEE.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;



entity Enderecamento is

   port( 
      clock		:	in std_logic;
		coluna,linha : in std_logic_vector(9 downto 0);
		address: out std_logic_vector(16 downto 0);
		btn_vert, btn_hor: in std_logic
	);
end entity Enderecamento;

architecture comportamento of Enderecamento is	

constant maxcol : integer  := 320;
signal auxadd :  INTEGER RANGE 0 to 80000 ;--
signal auxlinha:	INTEGER RANGE 0 to 1023;--
signal auxcoluna:	INTEGER RANGE 0 to 1023 ;--
begin
		process(clock)
		variable aux :  INTEGER RANGE 0 to 319 := 0;--
		begin
			if (clock'event and clock = '1') then
				auxlinha <= to_integer(unsigned(linha));
				auxcoluna <= to_integer(unsigned(coluna));
				auxadd <=  ((480-auxlinha)/2)*320+auxcoluna/2;
				
				if btn_vert = '1' then
				  auxadd <=  ((auxlinha)/2)*320+auxcoluna/2;
				end if;
				
				if btn_hor = '1' then
				  auxadd <=  ((480-auxlinha)/2)*320-auxcoluna/2;
				end if;
			
--			auxlinha <= 480-auxlinha;
--			auxcoluna <= 320-auxcoluna;
			-- auxadd <=  ((480-auxlinha)/2)*320+auxcoluna/2;
			address <=  std_logic_vector(to_unsigned(auxadd,17));
			end if;
		
		end process;
		--	

end comportamento;
