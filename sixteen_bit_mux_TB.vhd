library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sixteen_bit_mux_tb is
end sixteen_bit_mux_tb;

architecture TB_ARCHITECTURE of sixteen_bit_mux_tb is
	-- Component declaration of the tested unit
	component sixteen_bit_mux
	port(
		I0 : in STD_LOGIC_VECTOR(15 downto 0);
		I1 : in STD_LOGIC_VECTOR(15 downto 0);
		I2 : in STD_LOGIC_VECTOR(15 downto 0);
		I3 : in STD_LOGIC_VECTOR(15 downto 0);
		I4 : in STD_LOGIC_VECTOR(15 downto 0);
		I5 : in STD_LOGIC_VECTOR(15 downto 0);
		I6 : in STD_LOGIC_VECTOR(15 downto 0);
		I7 : in STD_LOGIC_VECTOR(15 downto 0);
		S1 : in STD_LOGIC;
		S2 : in STD_LOGIC;
		S3 : in STD_LOGIC;
		Y : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal I0 : STD_LOGIC_VECTOR(15 downto 0);
	signal I1 : STD_LOGIC_VECTOR(15 downto 0);
	signal I2 : STD_LOGIC_VECTOR(15 downto 0);
	signal I3 : STD_LOGIC_VECTOR(15 downto 0);
	signal I4 : STD_LOGIC_VECTOR(15 downto 0);
	signal I5 : STD_LOGIC_VECTOR(15 downto 0);
	signal I6 : STD_LOGIC_VECTOR(15 downto 0);
	signal I7 : STD_LOGIC_VECTOR(15 downto 0);
	signal S1 : STD_LOGIC;
	signal S2 : STD_LOGIC;
	signal S3 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Y : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sixteen_bit_mux
		port map (
			I0 => I0,
			I1 => I1,
			I2 => I2,
			I3 => I3,
			I4 => I4,
			I5 => I5,
			I6 => I6,
			I7 => I7,
			S1 => S1,
			S2 => S2,
			S3 => S3,
			Y => Y
		);

	-- Add your stimulus here ...  
	process
	begin
		
		I0<="0000000000000000";
		I1<="0000000000000001";
		I2<="0000000000000010";
		I3<="0000000000000011";
		I4<="0000000000000100";
		I5<="0000000000000101";
		I6<="0000000000000110";
		I7<="0000000000000111";
		
		
		S1<='0'; S2<='0'; S3<='0';
		wait for 200 ns;
		
		S1<='0'; S2<='0'; S3<='1';
		wait for 200 ns;
		
		S1<='0'; S2<='1'; S3<='0';
		wait for 200 ns;
		
		S1<='0'; S2<='1'; S3<='1';
		wait for 200 ns;
		
		S1<='1'; S2<='0'; S3<='0';
		wait for 200 ns;
		
		S1<='1'; S2<='0'; S3<='1';
		wait for 200 ns;
		
		S1<='1'; S2<='1'; S3<='0';
		wait for 200 ns;
		
		S1<='1'; S2<='1'; S3<='1';
		wait for 200 ns;
		
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sixteen_bit_mux of sixteen_bit_mux_tb is
	for TB_ARCHITECTURE
		for UUT : sixteen_bit_mux
			use entity work.sixteen_bit_mux(sixteen_mux_arch);
		end for;
	end for;
end TESTBENCH_FOR_sixteen_bit_mux;

