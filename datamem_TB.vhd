library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity datamem_tb is
end datamem_tb;

architecture TB_ARCHITECTURE of datamem_tb is
	-- Component declaration of the tested unit
	component datamem
	port(
		in_data : in STD_LOGIC_VECTOR(15 downto 0);
		address : in STD_LOGIC_VECTOR(3 downto 0);
		memwrite : in STD_LOGIC;
		mem2reg : in STD_LOGIC;
		clk : in STD_LOGIC;
		data_out : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal in_data : STD_LOGIC_VECTOR(15 downto 0);
	signal address : STD_LOGIC_VECTOR(3 downto 0);
	signal memwrite : STD_LOGIC;
	signal mem2reg : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal data_out : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : datamem
		port map (
			in_data => in_data,
			address => address,
			memwrite => memwrite,
			mem2reg => mem2reg,
			clk => clk,
			data_out => data_out
		);

	-- Add your stimulus here ... 
	process
	begin
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000000";  --0
	address<="0000";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000001";  --1
	address<="0001";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000010";  --2
	address<="0010";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000011";  --3
	address<="0011";
	wait for 20ns; 
	
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000100";  --4
	address<="0100";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000101";  --5
	address<="0101";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000110"; --6
	address<="0110";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000000111"; --7
	address<="0111";
	wait for 20ns;
	
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001000";   --8
	address<="1000";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001001";   --9
	address<="1001";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001010";   --10
	address<="1010";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001011";	--11
	address<="1011";
	wait for 20ns; 	
	
		memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001100";	 --12
	address<="1100";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001101";	  --13
	address<="1101";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001110";		--14
	address<="1110";
	wait for 20ns;
	memwrite<='1';
	mem2reg<='0';
	in_data<="0000000000001111";		  --15
	address<="1111";
	wait for 20ns;
	
--------------------------------------------------
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000000";  --0
	address<="0000";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000001";  --1
	address<="0001";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000010";  --2
	address<="0010";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000011";  --3
	address<="0011";
	wait for 20ns; 
	
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000100";  --4
	address<="0100";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000101";  --5
	address<="0101";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';		
	in_data<="0000000000000110"; --6
	address<="0110";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000000111"; --7
	address<="0111";
	wait for 20ns;
	
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001000";   --8
	address<="1000";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001001";   --9
	address<="1001";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001010";   --10
	address<="1010";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001011";	--11
	address<="1011";
	wait for 20ns; 	
	
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001100";	 --12
	address<="1100";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001101";	  --13
	address<="1101";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001110";		--14
	address<="1110";
	wait for 20ns;
	memwrite<='0';
	mem2reg<='1';
	in_data<="0000000000001111";		  --15
	address<="1111";
	wait for 20ns;


	end process;
	
	clock : process
	begin
		
		clk<='1'; wait for 10 ns;
		clk<='0'; wait for 10 ns;
		

	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_datamem of datamem_tb is
	for TB_ARCHITECTURE
		for UUT : datamem
			use entity work.datamem(datamem_arch);
		end for;
	end for;
end TESTBENCH_FOR_datamem;

