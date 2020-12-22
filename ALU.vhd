library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library sixteen_bit_adder;
use sixteen_bit_adder.all;

library sixteen_bit_subtractor;
use sixteen_bit_subtractor.all;

library sixteen_bit_multiplier;
use sixteen_bit_multiplier.all;

library sixteen_bit_mux;
use sixteen_bit_mux.all;

entity ALU is
	port (
	A, B : in std_logic_vector(15 downto 0); 
	R : out std_logic_vector(15 downto 0);
	S0, S1, S2 : in std_logic;
	status : out std_logic_vector(2 downto 0)
	);
end ALU;	  

architecture ALU_ARCH of ALU is

	component sixteen_bit_adder
		port (
		A, B : in std_logic_vector(15 downto 0);   
		i_carry : in std_logic;
		o_sum : out std_logic_vector(15 downto 0);
		o_carry: out std_logic
		);
	end component; 
	
	component sixteen_bit_subtractor
		port (
		A, B : in std_logic_vector(15 downto 0);
		o_diff : out std_logic_vector(15 downto 0);
		o_carry : out std_logic
		);
	end component;
	
	component sixteen_bit_multiplier
		port (
		A, B : in std_logic_vector(15 downto 0);
		o_prod : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component sixteen_bit_mux
		port (
		I0, I1, I2, I3, I4, I5, I6, I7 : in std_logic_vector(15 downto 0);
		S1, S2, S3 : in std_logic;
		Y : out std_logic_vector(15 downto 0)	
		); 
	end component;		



	signal sum, prod, passA, passB, diff : std_logic_vector(15 downto 0);
	signal carryin : std_logic := '0';
	signal carryout : std_logic;
	signal ALU_out : std_logic_vector(15 downto 0);
	signal empty : std_logic_vector(15 downto 0):= "0000000000000000";
	signal overflow :  std_logic_vector(2 downto 0) := "010";
	signal zero :  std_logic_vector(2 downto 0):= "001";
	signal negative : std_logic_vector(2 downto 0):="000";
	signal statuscode : std_logic_vector(2 downto 0):="000";
	signal isoverflow, iszero, isnegative : std_logic:= '0';
	
	
begin
		
--Signed Addition
	signed_addition : sixteen_bit_adder port map (A, B, '0' ,sum, carryout);
	--isoverflow<=carryout;
--Signed Multiplication
	signed_mult : sixteen_bit_multiplier port map( A, B, prod);
	
--Passthrough A; in other words, output A.
	PassA<=A;
	
--Passthrough B; in other words, output B.
	PassB<=B;
	
--Signed Subtraction
	signed_subtraction : sixteen_bit_subtractor port map(A, B, diff, carryout);
	
	
--Finally, assign each of the signals to the multiplexer.
	multiplexer : sixteen_bit_mux port map(sum, prod, passA, passB, diff, empty, empty, empty, S0, S1, S2, ALU_out); 
	
	R<=ALU_out;
	
	isnegative<= ALU_out(15);
	
	iszero<= not(ALU_out(0) or  ALU_out(1) or ALU_out(2) or ALU_out(3) or ALU_out(5) or ALU_out(6) or ALU_out(7) or ALU_out(8) or ALU_out(9) or ALU_out(10) or ALU_out(11) or ALU_out(12) or ALU_out(13) or ALU_out(14) or ALU_out(15));
	
	
	-------statuscode mux---------



	
	statuscode(0)<=isnegative;
	statuscode(1)<=iszero;
	statuscode(2)<=isoverflow;
	--------------------------
	status<=statuscode; 
	
	
	



end ALU_ARCH;

