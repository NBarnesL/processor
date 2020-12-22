library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		R : out STD_LOGIC_VECTOR(15 downto 0);
		S0 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		S2 : in STD_LOGIC;
		status : out STD_LOGIC_VECTOR(2 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal S0 : STD_LOGIC;
	signal S1 : STD_LOGIC;
	signal S2 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal R : STD_LOGIC_VECTOR(15 downto 0);
	signal status : STD_LOGIC_VECTOR(2 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			A => A,
			B => B,
			R => R,
			S0 => S0,
			S1 => S1,
			S2 => S2,
			status => status
		);

	-- Add your stimulus here ...
	process
		begin

		S0<='0'; S1<='0'; S2<='0'; --addition
		A<="0000001111101000"; --1000
		B<="0000011111010000"; --2000
		wait for 200ns;			 
		
		S0<='0'; S1<='0'; S2<='1'; --multiplication
		A<="0000000010000000"; --128
		B<="0000000010000000"; --128
		wait for 100ns;  
		
		S0<='0'; S1<='0'; S2<='0'; --addition
		A<="0000000000000010"; --2
		B<="0000000000000010"; --2
		wait for 200ns;
		S0<='0'; S1<='0'; S2<='1'; --multiplication
		A<="0000000000000011"; --3
		B<="0000000000000011"; --3
		wait for 200ns;
		S0<='0'; S1<='1'; S2<='0';	--passA
		A<="0000000000001111"; --15
		B<="0000000000000000"; --0
		wait for 200ns;			  
		S0<='0'; S1<='1'; S2<='1';	---passB
		A<="0000000000001111"; --15
		B<="0000000000000000"; --0
		wait for 200ns;
		S0<='1'; S1<='0'; S2<='0';	---subtraction
		A<="0000000000000011"; --3
		B<="0000000000001111"; --15
		wait for 500ns;
		
			

		
				

		
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu_arch);
		end for;
	end for;
end TESTBENCH_FOR_alu;

