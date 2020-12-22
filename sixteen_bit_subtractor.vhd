library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith;
use ieee.numeric_std.all;

library sixteen_bit_adder;
use sixteen_bit_adder.all;

entity sixteen_bit_subtractor is
	port (
	A, B : in std_logic_vector(15 downto 0);
	o_diff : out std_logic_vector(15 downto 0);
	o_carry : out std_logic
	);
end sixteen_bit_subtractor;	  

architecture sixteen_sub_arch of sixteen_bit_subtractor is

--I'll need to declare the component for the 16-bit adder.
component sixteen_bit_adder
		port (
	A, B : in std_logic_vector(15 downto 0);   
	i_carry : in std_logic;
	o_sum : out std_logic_vector(15 downto 0);
	o_carry: out std_logic
	);
	end component; 
	
	signal B_inv, diff_out : std_logic_vector(15 downto 0);
	signal carry_out : std_logic := '0';
	
begin
--The subtractor needs to use the 16 bit adder in its implementation

--So what I'm thinking is I need to convert the subtrahend (B) to the Two's complement, then do the operation A + (2c)B

--Convert B to two's complement

	B_inv<= not B after 10 ns;

	D0 : sixteen_bit_adder port map (A, B_inv, '1' ,diff_out, carry_out); 
	  o_diff<=diff_out;

	  o_carry<=carry_out;
	
--Convert the two's complement back? I think thats only necessary if the subtrahend is greater than the minuhend.
	--Converting the difference back if its negative is unnecessary. If the minuhend is greater than the subtruhend, then the difference will be positive with an overflow bit.
	--If the subtruhend is greater, then the resulting negative number needs remain in the two's complement form so it can be used with other operations.
  
end sixteen_sub_arch;

