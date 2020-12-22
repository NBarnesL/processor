library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_multiplier_tb is
end sixteen_bit_multiplier_tb;

architecture TB_ARCHITECTURE of sixteen_bit_multiplier_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_multiplier
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		o_prod : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o_prod : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_multiplier
		port map (
			A => A,
			B => B,
			o_prod => o_prod
		);

	-- Add your stimulus here ...	
process
begin
	
	A<="0000000000000001"; 
	B<="0000000000000000"; --(1*0) = 0
	wait for 100 ns;
	
	A<="0000000000000111"; --(7*3) = 21
	B<="0000000000000011";
	wait for 100 ns;
	
	A<="0000000000000111"; 
	B<="1111111111111101"; --(7*-3) = -21
	wait for 100 ns;	
	
	A<="1111111111111101"; 
	B<="1111111111111101"; --(-3*-3) = 9
	wait for 100 ns;
	
	
		
	end process;	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_multiplier of sixteen_bit_multiplier_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_multiplier
			use entity work.sixteen_bit_multiplier(sixteen_mult_arch);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_multiplier;

