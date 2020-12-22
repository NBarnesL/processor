library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_adder_tb is
end sixteen_bit_adder_tb;

architecture TB_ARCHITECTURE of sixteen_bit_adder_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_adder
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		i_carry : in std_logic;
		o_sum : out STD_LOGIC_VECTOR(15 downto 0);
		o_carry: out std_logic);
		
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal i_carry : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o_sum : STD_LOGIC_VECTOR(15 downto 0); 
	signal o_carry : std_logic;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_adder
		port map (
			A => A,
			B => B,
			i_carry => i_carry,
			o_sum => o_sum,
			o_carry => o_carry
		);

	-- Add your stimulus here ...
	process is
	begin	
	i_carry<='0';	
	A<="0000000000000000"; --(0+0) = 0	 A=B=0
	B<="0000000000000000";
	wait for 100 ns;
	i_carry<='1';	
	A<="0000000000000000"; --(0+0) = 0	 A=B=0
	B<="0000000000000000";
	wait for 100 ns;
	i_carry<='0';	
	A<="0000000000000110"; --(6+3) = 9	 A>B
	B<="0000000000000011";
	wait for 100 ns;
	A<="0000000000000010"; --(2+4) = 6	  B>A
	B<="0000000000000100";
	wait for 100 ns;
	A<="0000000000000001"; --(1+0) = 1	  A+0
	B<="0000000000000000";
	wait for 100 ns;
	A<="1111111111111111"; --((-1)+2) =  1
	B<="0000000000000010";
	wait for 500 ns;
	A<="1111111111111111"; --((-1)+-(-3)) = -4
	B<="1111111111111101";
	wait;
	end process;	
		

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_adder of sixteen_bit_adder_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_adder
			use entity work.sixteen_bit_adder(sixteen_adder_arch);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_adder;

