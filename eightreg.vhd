library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--needs to store and retrieve 16 bit values
entity eightreg is
	port (

	rs,rt : in std_logic_vector(2 downto 0); -- registers to get 
	rd, rd_alu, rs_mem : in std_logic_vector(2 downto 0); --register to write to
	ldi : in std_logic;
	in_data,alu_result,in_mem : in std_logic_vector(15 downto 0); -- used to take in data
	alu_write,mem2reg : in std_logic; --flag
	clk : in std_logic; --clock
	rs_out, rt_out,rd_out : out std_logic_vector(15 downto 0); --get register values
	r0,r1,r2,r3,r4,r5,r6,r7 : out std_logic_vector(15 downto 0)
	
	
	);
end eightreg;	 

architecture eightreg_arch of eightreg is



type registerFile is array(7 downto 0) of std_logic_vector(15 downto 0);
    signal r : registerFile ; 

begin
r0<=r(0);
r1<=r(1);
r2<=r(2);
r3<=r(3);
r4<=r(4);
r5<=r(5);
r6<=r(6);
r7<=r(7);

 read: process(clk)
 begin
	if clk = '0' then
	rs_out<=r(to_integer(unsigned(rs)))	 ;
	rt_out<=r(to_integer(unsigned(rt))) ;
	rd_out<=r(to_integer(unsigned(rd))) ;
	end if;								  
	report "r0:" & integer'image(to_integer(unsigned(r(0))));
	report "r1:" & integer'image(to_integer(unsigned(r(1))));
	report "r2:" & integer'image(to_integer(unsigned(r(2))));
	report "r3:" & integer'image(to_integer(unsigned(r(3))));
	report "r4:" & integer'image(to_integer(unsigned(r(4))));
	report "r5:" & integer'image(to_integer(unsigned(r(5))));
	report "r6:" & integer'image(to_integer(unsigned(r(6))));
	report "r7:" & integer'image(to_integer(unsigned(r(7))));
	
	
	end process;
	
	
write_ldi: process(clk,rd)
begin 
	if clk = '1' and ldi = '1' then
		--report "the value going into rd is" & integer'image(to_integer(unsigned(in_data)));
		r(to_integer(unsigned(rd))) <= in_data ;
		--report "the value at rd is" & integer'image(to_integer(unsigned(r(to_integer(unsigned(rd))))));
	end if;
	
	if clk = '1' and alu_write = '1' then
	--report "the value going into rd is" & integer'image(to_integer(unsigned(in_data)));
	r(to_integer(unsigned(rd_alu))) <= alu_result ;
	--report "the value at rd is" & integer'image(to_integer(unsigned(r(to_integer(unsigned(rd))))));
	end if;
	
	if clk = '1' and mem2reg = '1' then
	--report "the value going into rd is" & integer'image(to_integer(unsigned(in_data)));
	r(to_integer(unsigned(rd_alu))) <= in_mem ;
	--report "the value at rd is" & integer'image(to_integer(unsigned(r(to_integer(unsigned(rd))))));
	end if;

report "the value of rd is";	
end process;



		


		
	
	
end eightreg_arch;