library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity eightreg_tb is
end eightreg_tb;

architecture TB_ARCHITECTURE of eightreg_tb is
	-- Component declaration of the tested unit
	component eightreg
	port(
		rs : in STD_LOGIC_VECTOR(2 downto 0);
		rt : in STD_LOGIC_VECTOR(2 downto 0);
		rd : in STD_LOGIC_VECTOR(2 downto 0);
		rd_alu : in STD_LOGIC_VECTOR(2 downto 0);
		rs_mem : in STD_LOGIC_VECTOR(2 downto 0);
		ldi : in STD_LOGIC;
		in_data : in STD_LOGIC_VECTOR(15 downto 0);
		alu_result : in STD_LOGIC_VECTOR(15 downto 0);
		in_mem : in STD_LOGIC_VECTOR(15 downto 0);
		alu_write : in STD_LOGIC;
		mem2reg : in STD_LOGIC;
		clk : in STD_LOGIC;
		rs_out : out STD_LOGIC_VECTOR(15 downto 0);
		rt_out : out STD_LOGIC_VECTOR(15 downto 0);
		rd_out : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal rs : STD_LOGIC_VECTOR(2 downto 0);
	signal rt : STD_LOGIC_VECTOR(2 downto 0);
	signal rd : STD_LOGIC_VECTOR(2 downto 0);
	signal rd_alu : STD_LOGIC_VECTOR(2 downto 0);
	signal rs_mem : STD_LOGIC_VECTOR(2 downto 0);
	signal ldi : STD_LOGIC;
	signal in_data : STD_LOGIC_VECTOR(15 downto 0);
	signal alu_result : STD_LOGIC_VECTOR(15 downto 0);
	signal in_mem : STD_LOGIC_VECTOR(15 downto 0);
	signal alu_write : STD_LOGIC;
	signal mem2reg : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal rs_out : STD_LOGIC_VECTOR(15 downto 0);
	signal rt_out : STD_LOGIC_VECTOR(15 downto 0);
	signal rd_out : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : eightreg
		port map (
			rs => rs,
			rt => rt,
			rd => rd,
			rd_alu => rd_alu,
			rs_mem => rs_mem,
			ldi => ldi,
			in_data => in_data,
			alu_result => alu_result,
			in_mem => in_mem,
			alu_write => alu_write,
			mem2reg => mem2reg,
			clk => clk,
			rs_out => rs_out,
			rt_out => rt_out,
			rd_out => rd_out
		);

	-- Add your stimulus here ... 
			process
begin
	wait for 10 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="000";
	in_data<="0000000000000000"; --set 0
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="001";
	in_data<="0000000000000001";	  --set1
	wait for 20 ns;	
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="010";
	in_data<="0000000000000010";	 --set2
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="011";
	in_data<="0000000000000011";		--set3
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="100";
	in_data<="0000000000000100";	  --set4
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="101";
	in_data<="0000000000000101";		--set5
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="110";
	in_data<="0000000000000110";		 --set6
	wait for 20 ns;
	ldi<='1';
	rs<="000";
	rt<="001";
	rd<="111";
	in_data<="0000000000000111";		 --set7
	wait for 20 ns;
	
	
	ldi<='0';
	rs<="000";
	rt<="001";
	rd<="010";
	in_data<="1111111111111111";
	wait for 20 ns;	  
	ldi<='0';
	rs<="011";
	rt<="100";
	rd<="101";
	in_data<="1111111111111111";
	wait for 20 ns;
	ldi<='0';
	rs<="110";
	rt<="111";
	rd<="111";
	in_data<="1111111111111111";
	wait for 20 ns;
	

end process;

		clock : process
	begin
		
		clk<='0'; wait for 10 ns;
		clk<='1'; wait for 10 ns; 

	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_eightreg of eightreg_tb is
	for TB_ARCHITECTURE
		for UUT : eightreg
			use entity work.eightreg(eightreg_arch);
		end for;
	end for;
end TESTBENCH_FOR_eightreg;

