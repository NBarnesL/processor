library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library half_adder;
use half_adder.all;
 
entity full_adder is
  port (
    i_bit1  : in std_logic;
    i_bit2  : in std_logic;
	cin_bit : in std_logic;
    --
    o_sum   : out std_logic;
    o_carry : out std_logic
    );
end full_adder;
 
architecture full_adder_arch of full_adder is	

	component half_adder
	   port (i_bit1, i_bit2  : in std_logic; o_sum, o_carry : out std_logic);
	end component; 


	signal halfsum, halfcarry, outcarry, outsum: std_logic;
	
begin														

	--o_sum   <= i_bit1 xor i_bit2;	--half sum
	--o_carry <= i_bit1 and i_bit2;	--halfcarry
	halfadder1 : half_adder port map (i_bit1, i_bit2, halfsum, halfcarry);
	halfadder2 : half_adder port map (halfsum, cin_bit, outsum, outcarry);
	
	o_sum <= outsum;
	o_carry <= (halfcarry or outcarry) after 10 ns; 
		
	
end full_adder_arch;

