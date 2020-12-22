library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--needs to store and retrieve halfwords.
entity imem is
	port (
	clk : in std_logic;
	ifetch : out std_logic_vector(15 downto 0)

	);
end imem;	 

architecture imem_arch of imem is

--signal memory : std_logic_vector(255 downto 0);
signal i0: std_logic_vector(15 downto 0) := x"500A"	;
signal i1: std_logic_vector(15 downto 0) := x"5105"	;
signal i2: std_logic_vector(15 downto 0) := x"5200"	;
signal i3: std_logic_vector(15 downto 0) := x"5300"	;
signal i4: std_logic_vector(15 downto 0) := x"5400"	;
signal i5: std_logic_vector(15 downto 0) := x"5500"	;
signal i6: std_logic_vector(15 downto 0) := x"5600"	;
signal i7: std_logic_vector(15 downto 0) := x"5700"	;
signal i8: std_logic_vector(15 downto 0) := x"0201"	;
signal i9: std_logic_vector(15 downto 0) := x"1301"	;
signal iA: std_logic_vector(15 downto 0) := x"4401"	;
signal iB: std_logic_vector(15 downto 0) := x"630B"	;
signal iC: std_logic_vector(15 downto 0) := x"640A"	;
signal iD: std_logic_vector(15 downto 0) := x"760A"	;
signal iE: std_logic_vector(15 downto 0) := x"770B"	;






--500A
--5105
--5200
--5300
--5400
--5500
--5600
--5700
--0201
--1301
--4401
--630B
--640A
--760A
--770B


begin		

process (clk)
VARIABLE   cnt         : INTEGER RANGE 0 TO 255;
BEGIN
	IF (clk'EVENT AND clk = '1') THEN
    	
		case cnt is
		  when 0 =>   ifetch <= i0;
		  when 1 =>   ifetch <= i1;
		  when 2 =>   ifetch <= i2;
		  when 3 =>   ifetch <= i3;
		  when 4 =>   ifetch <= i4;
		  when 5 =>   ifetch <= i5;
		  when 6 =>   ifetch <= i6;
		  when 7 =>   ifetch <= i7;
		  when 8 =>   ifetch <= i8;
		  when 9 =>   ifetch <= i9;
		  when 10 =>   ifetch <= iA;
		  when 11 =>   ifetch <= iB;
		  when 12 =>   ifetch <= iC;
		  when 13 =>   ifetch <= iD;
		  when 14 =>   ifetch <= iE;

		  when others => null;
		end case;
        cnt := cnt + 1;	 --increment the counter
        
    END IF;
      

end process;
		
	
	
end imem_arch;