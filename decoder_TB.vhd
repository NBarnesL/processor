library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity decoder_tb is
end decoder_tb;

architecture TB_ARCHITECTURE of decoder_tb is
	-- Component declaration of the tested unit
	component decoder
	port(
		ifetchTest : out STD_LOGIC_VECTOR(15 downto 0);
		opcodeTest : out STD_LOGIC_VECTOR(2 downto 0);
		rdTest : out STD_LOGIC_VECTOR(2 downto 0);
		rsTest : out STD_LOGIC_VECTOR(2 downto 0);
		rtTest : out STD_LOGIC_VECTOR(2 downto 0);
		immTest : out STD_LOGIC_VECTOR(3 downto 0);
		clk : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ifetchTest : STD_LOGIC_VECTOR(15 downto 0);
	signal opcodeTest : STD_LOGIC_VECTOR(2 downto 0);
	signal rdTest : STD_LOGIC_VECTOR(2 downto 0);
	signal rsTest : STD_LOGIC_VECTOR(2 downto 0);
	signal rtTest : STD_LOGIC_VECTOR(2 downto 0);
	signal immTest : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : decoder
		port map (
			ifetchTest => ifetchTest,
			opcodeTest => opcodeTest,
			rdTest => rdTest,
			rsTest => rsTest,
			rtTest => rtTest,
			immTest => immTest,
			clk => clk
		);

	-- Add your stimulus here ... 
		clock : process
	begin
		
		clk<='0'; wait for 1500 ns;
		clk<='1'; wait for 1500 ns; 

	end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_decoder of decoder_tb is
	for TB_ARCHITECTURE
		for UUT : decoder
			use entity work.decoder(decoder_arch);
		end for;
	end for;
end TESTBENCH_FOR_decoder;

