library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity imem_tb is
end imem_tb;

architecture TB_ARCHITECTURE of imem_tb is
	-- Component declaration of the tested unit
	component imem
	port(
		clk : in STD_LOGIC;
		ifetch : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ifetch : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : imem
		port map (
			clk => clk,
			ifetch => ifetch
		);

clock : process
	begin
		
		clk<='0'; wait for 50 ns;
		clk<='1'; wait for 50 ns; 
		
	end process;
			

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_imem of imem_tb is
	for TB_ARCHITECTURE
		for UUT : imem
			use entity work.imem(imem_arch);
		end for;
	end for;
end TESTBENCH_FOR_imem;

