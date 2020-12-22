library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity sixteen_bit_mux is
	port (
	I0, I1, I2, I3, I4, I5, I6, I7 : in std_logic_vector(15 downto 0);
	S1, S2, S3 : in std_logic;
	Y : out std_logic_vector(15 downto 0)	
	);
end sixteen_bit_mux;	  

architecture sixteen_mux_arch of sixteen_bit_mux is
	
signal out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_Y : std_logic_vector(15 downto 0);

	
begin
	
	I0_Gen:	 
		for G in 0 to 15 generate
			out_0(G) <=  I0(G) and ( not S1) and ( not S2) and ( not S3);
		end generate I0_Gen;
	
	I1_Gen:	 
		for G in 0 to 15 generate
			out_1(G) <=  I1(G) and ( not S1) and ( not S2) and ( S3);
		end generate I1_Gen;	
	
	I2_Gen:	 
		for G in 0 to 15 generate
			out_2(G) <=  I2(G) and ( not S1) and ( S2) and ( not S3);
		end generate I2_Gen;
		
	I3_Gen:	 
		for G in 0 to 15 generate
			out_3(G) <=  I3(G) and ( not S1) and ( S2) and ( S3);
		end generate I3_Gen;
		
	I4_Gen:	 
		for G in 0 to 15 generate
			out_4(G) <=  I4(G) and ( S1) and ( not S2) and ( not S3);
		end generate I4_Gen;
		
	I5_Gen:	 
		for G in 0 to 15 generate
			out_5(G) <=  I5(G) and ( S1) and ( not S2) and ( S3);
		end generate I5_Gen;
		
	I6_Gen:	 
		for G in 0 to 15 generate
			out_6(G) <=  I6(G) and ( S1) and ( S2) and ( not S3);
		end generate I6_Gen;
		
	I7_Gen:	 
		for G in 0 to 15 generate
			out_7(G) <=  I7(G) and ( S1) and ( S2) and ( S3);
		end generate I7_Gen;									 
		
		
		
	out_Y<= out_0 or out_1 or out_2 or out_3 or out_4 or out_5 or out_6 or out_7 ;
			
		
	Y<= out_Y;
		
	



end sixteen_mux_arch;

