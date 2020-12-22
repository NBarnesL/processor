library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library full_adder;
use full_adder.all;

entity sixteen_bit_adder is
	port (
	A, B : in std_logic_vector(15 downto 0);   
	i_carry : in std_logic;
	o_sum : out std_logic_vector(15 downto 0);
	o_carry: out std_logic
	);
end sixteen_bit_adder;	  

architecture sixteen_adder_arch of sixteen_bit_adder is

--I'll need to declare the component for the 1-bit full adder.
component full_adder
	   port (i_bit1, i_bit2, cin_bit  : in std_logic; o_sum, o_carry : out std_logic);
	end component; 
	
--I'll also need signals for each adder's outputs.
	signal sumbuffer: std_logic_vector(15 downto 0);
	signal S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, Sout: std_logic :='0';
	signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, Cout: std_logic :='0';
	
begin
--I'll be using a 16-bit Ripple Carry Adder, composed of 16, 1-bit full adders. This is for simplicity.
	F0 : full_adder port map (A(0), B(0), i_carry, S0, C1); --C0 might also be a cin_bit
	sumbuffer(0)<=S0;
	F1 : full_adder port map (A(1), B(1), C1, S1, C2);
	sumbuffer(1)<=S1;
	F2 : full_adder port map (A(2), B(2), C2, S2, C3);
	sumbuffer(2)<=S2;
	F3 : full_adder port map (A(3), B(3), C3, S3, C4);
	sumbuffer(3)<=S3;
	F4 : full_adder port map (A(4), B(4), C4, S4, C5);
	sumbuffer(4)<=S4;
	F5 : full_adder port map (A(5), B(5), C5, S5, C6);
	sumbuffer(5)<=S5;
	F6 : full_adder port map (A(6), B(6), C6, S6, C7);
	sumbuffer(6)<=S6;
	F7 : full_adder port map (A(7), B(7), C7, S7, C8);
	sumbuffer(7)<=S7;
	F8 : full_adder port map (A(8), B(8), C8, S8, C9);
	sumbuffer(8)<=S8;
	F9 : full_adder port map (A(9), B(9), C9, S9, C10);
	sumbuffer(9)<=S9;
	F10 : full_adder port map (A(10), B(10), C10, S10, C11);
	sumbuffer(10)<=S10;
	F11 : full_adder port map (A(11), B(11), C11, S11, C12);
	sumbuffer(11)<=S11;
	F12 : full_adder port map (A(12), B(12), C12, S12, C13);
	sumbuffer(12)<=S12;
	F13 : full_adder port map (A(13), B(13), C13, S13, C14);
	sumbuffer(13)<=S13;
	F14 : full_adder port map (A(14), B(14), C14, S14, C15);
	sumbuffer(14)<=S14;
	F15 : full_adder port map (A(15), B(15), C15, S15, Cout); 
	sumbuffer(15)<=S15;	 
	
	o_sum<=sumbuffer;
	o_carry <= Cout;
	
	



end sixteen_adder_arch;

