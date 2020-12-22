library ieee;
use ieee.NUMERIC_STD.all;	 
use ieee.std_logic_arith;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_subtractor_tb is
end sixteen_bit_subtractor_tb;

architecture TB_ARCHITECTURE of sixteen_bit_subtractor_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_subtractor
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		o_diff : out STD_LOGIC_VECTOR(15 downto 0);
		o_carry : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o_diff : STD_LOGIC_VECTOR(15 downto 0);
	signal o_carry : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_subtractor
		port map (
			A => A,
			B => B,
			o_diff => o_diff,
			o_carry => o_carry
		);

	-- Add your stimulus here ...
	process
	begin
	A<="0000000000000000"; --(0-0) = 0
	B<="0000000000000000";
	wait for 500 ns;
	A<="0000000000000001"; --(1-0) = 1
	B<="0000000000000000";
	wait for 500 ns;
	A<="0000000000000110"; --(6-3) = 3
	B<="0000000000000011";
	wait for 500 ns;
	A<="0000000000000010"; --(2-4) = -2
	B<="0000000000000100";
	wait for 500 ns;
	A<="0000000000000001"; --(1-1) = 0
	B<="0000000000000001";
	wait for 500 ns;
	A<="1111111111111111"; --(-1-(-2)) = 1
	B<="1111111111111110";
	wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_subtractor of sixteen_bit_subtractor_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_subtractor
			use entity work.sixteen_bit_subtractor(sixteen_sub_arch);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_subtractor;

