library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--needs to store and retrieve halfwords.
entity datamem is
	port (
	in_data : in std_logic_vector(15 downto 0); -- used to take in data
	address : in std_logic_vector(3 downto 0);
	memwrite : in std_logic;
	mem2reg : in std_logic;
	clk : in std_logic;
	data_out : out std_logic_vector(15 downto 0)
	
	);
end datamem;	 

architecture datamem_arch of datamem is

signal memory : std_logic_vector(255 downto 0);


type memoryarray is array(15 downto 0) of std_logic_vector(15 downto 0);
signal m : memoryarray ; 


begin		

read: process(clk,mem2reg)
begin
	if mem2reg = '1' and clk = '1' then
	data_out<=m(to_integer(unsigned(address)));
	end if;

end process;
		
write: process(clk,memwrite)
begin
	if memwrite = '1' and clk = '1' then
	m(to_integer(unsigned(address)))<=in_data;
	end if;

end process;	
	
end datamem_arch;