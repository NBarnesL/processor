library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library sixteen_bit_adder;
use sixteen_bit_adder.all;

entity sixteen_bit_multiplier is
	port (
	A, B : in std_logic_vector(15 downto 0);
	o_prod : out std_logic_vector(15 downto 0)
	);
end sixteen_bit_multiplier;	  

architecture sixteen_mult_arch of sixteen_bit_multiplier is

component sixteen_bit_adder
	port (
	A, B : in std_logic_vector(15 downto 0);   
	i_carry : in std_logic;
	o_sum : out std_logic_vector(15 downto 0);
	o_carry: out std_logic
	);
	end component; 
	
signal product : std_logic_vector(31 downto 0);
signal signbit : std_logic;
begin
	

	
	product <= std_logic_vector(signed(A)*signed(B));
	signbit<= product(31);
	product(15)<=signbit;
	o_prod<=product(15 downto 0);
	



end sixteen_mult_arch;

