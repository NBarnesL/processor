library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library gate_lib;
--use gate_lib.all;			 ;;taken out because i dont want any dependencies on something I'm not going to use

 
entity half_adder is
  port (
    i_bit1  : in std_logic;
    i_bit2  : in std_logic;
    --
    o_sum   : out std_logic;
    o_carry : out std_logic
    );
end half_adder;
 
architecture half_adder_arch of half_adder is		 
	--component AND_GATE
	--   port(A, B: in std_logic; F : out std_logic);
	--end component; 
	
	--component XOR_GATE
--	   port(A, B: in std_logic; F : out std_logic);
	--end component; 	


begin														
	--xorgate : 	XOR_GATE port map (i_bit1, i_bit2, o_sum); --o_sum   <= i_bit1 xor i_bit2;
	--andgate :	AND_GATE port map (i_bit1, i_bit2, o_carry); --o_carry <= i_bit1 and i_bit2;
	o_sum   <= i_bit1 xor i_bit2 after 10 ns;
	o_carry <= i_bit1 and i_bit2 after 10 ns;	
end half_adder_arch;