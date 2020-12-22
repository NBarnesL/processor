library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity full_adder_tb is
end full_adder_tb;

architecture TB_ARCHITECTURE of full_adder_tb is
	-- Component declaration of the tested unit
	component full_adder
	port(
		i_bit1 : in STD_LOGIC;
		i_bit2 : in STD_LOGIC;
		cin_bit : in STD_LOGIC;
		o_sum : out STD_LOGIC;
		o_carry : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal i_bit1 : STD_LOGIC;
	signal i_bit2 : STD_LOGIC;
	signal cin_bit : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o_sum : STD_LOGIC;
	signal o_carry : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : full_adder
		port map (
			i_bit1 => i_bit1,
			i_bit2 => i_bit2,
			cin_bit => cin_bit,
			o_sum => o_sum,
			o_carry => o_carry
		);

	-- Add your stimulus here ...
	stim : process
			begin
				i_bit1 <= '0';
				i_bit2 <= '0';
				cin_bit <= '0';
				wait for 100 ns;
				
				i_bit1 <= '0';
				i_bit2 <= '0';
				cin_bit <= '1';
				wait for 100 ns;
				
				i_bit1 <= '0';
				i_bit2 <= '1';
				cin_bit <= '0';
				wait for 100 ns;
				
				i_bit1 <= '0';
				i_bit2 <= '1';
				cin_bit <= '1';
				wait for 100 ns;							 
				
				i_bit1 <= '1';
				i_bit2 <= '0';
				cin_bit <= '0';
				wait for 100 ns;
				
				i_bit1 <= '1';
				i_bit2 <= '0';
				cin_bit <= '1';
				wait for 100 ns;
				
				i_bit1 <= '1';
				i_bit2 <= '1';
				cin_bit <= '0';
				wait for 100 ns;
				
				i_bit1 <= '1';
				i_bit2 <= '1';
				cin_bit <= '1';
				wait for 100 ns;
				
				wait; 
		end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_full_adder of full_adder_tb is
	for TB_ARCHITECTURE
		for UUT : full_adder
			use entity work.full_adder(full_adder_arch);
		end for;
	end for;
end TESTBENCH_FOR_full_adder;

