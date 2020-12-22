library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ALU;
use ALU.all;

library eightreg;
use eightreg.all;

library datamem;
use datamem.all;

library imem;
use imem.all;


entity decoder is
	port (
	--opcode : in std_logic_vector(3 downto 0);
	--rs, rd : in std_logic_vector(4 downto 0);
	--imm : in std_logic_vector(3 downto 0);
	ifetchTest : out std_logic_vector(15 downto 0);
	opcodeTest : out std_logic_vector(2 downto 0);
	rdTest,rsTest,rtTest : out std_logic_vector(2 downto 0);
	immTest : out std_logic_vector(3 downto 0);
	clk : in std_logic
	);
end decoder;	  

architecture decoder_arch of decoder is

	component ALU	 --arithmetic logic unit
		port (
			A, B : in std_logic_vector(15 downto 0); 
			R : out std_logic_vector(15 downto 0);
			S0, S1, S2 : in std_logic;
			status : out std_logic_vector(2 downto 0)
		);
	end component;
	
	component imem	 --instruction fetch and memory
		port (
			clk : in std_logic;
			ifetch : out std_logic_vector(15 downto 0)
		);
	end component;
	
	
	component eightreg 	--16x8 register file
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
	end component;
	
	component datamem is
		port (
			in_data : in std_logic_vector(15 downto 0); -- used to take in data
			address : in std_logic_vector(3 downto 0);
			memwrite : in std_logic;
			mem2reg : in std_logic;
			clk : in std_logic;
			data_out : out std_logic_vector(15 downto 0)
		);
	end component;	
		
	
	
	signal ALU_A, ALU_B, ALU_OUT : std_logic_vector(15 downto 0);
	signal ALU_status : std_logic_vector(2 downto 0);
	signal OP_S1, OP_S2, OP_S3 : std_logic;
	signal op_complete : std_logic_vector(2 downto 0);
	signal instruction_raw : std_logic_vector(15 downto 0);
	signal rd, rs, rt,rd_alu,rs_mem :std_logic_vector(2 downto 0);
	signal rsGet,rtGet,rdGet : std_logic_vector(15 downto 0);
	signal imm : std_logic_vector(3 downto 0);
	signal immBuff, alu_result, data_out,in_mem : std_logic_vector(15 downto 0) :=(others=>'0');	
	signal ldi_flag, memwrite,mem2reg : std_logic;
	signal dummy : std_logic_vector(15 downto 0);
	signal itype : std_logic;
	signal alu_write : std_logic;
	
begin 
		--get instruction
		instruction_fetch : imem port map (clk, instruction_raw); --instruction given will increment every clock cycle
		ifetchTest<=instruction_raw;
		
		--get opcode
		OP_S1<=instruction_raw(14);
		OP_S2<=instruction_raw(13);
		OP_S3<=instruction_raw(12);
		op_complete(2)<=instruction_raw(14);
		op_complete(1)<=instruction_raw(13);
		op_complete(0)<=instruction_raw(12);
		opcodeTest<=op_complete;
		
		
		--get rd
		rd(2)<=instruction_raw(10);
		rd(1)<=instruction_raw(9);
		rd(0)<=instruction_raw(8);
		rdTest<=rd;
		
		rs(2)<=instruction_raw(6);
		rs(1)<=instruction_raw(5);
		rs(0)<=instruction_raw(4);
		rsTest<=rs;
		--rsGet<=(others=>'0');
		
		rt(2)<=instruction_raw(2);
		rt(1)<=instruction_raw(1);
		rt(0)<=instruction_raw(0);
		rtTest<=rt;
		--rtGet<=(others=>'0');
		
		imm(3)<= instruction_raw(3);
		imm(2)<= instruction_raw(2);
		imm(1)<= instruction_raw(1);
		imm(0)<= instruction_raw(0);
		immTest<=imm;
		
		--immBuff<="000000000000UUUU"; --initialize for next load
		immBuff(3)<=imm(3);
		immBuff(2)<=imm(2);
		immBuff(1)<=imm(1);
		immBuff(0)<=imm(0);
		
		ldi_flag<=OP_S1 and not OP_S2 and OP_S3;
		

	   	--regfile : eightreg port map(instruction_raw(6 downto 4), instruction_raw(2 downto 0), instruction_raw(10 downto 8),ldi_flag, immBuff , writeReg, clk, rsGet,rtGet);
	   	regfile : eightreg port map(instruction_raw(6 downto 4), instruction_raw(2 downto 0), instruction_raw(10 downto 8),rd_alu, rs_mem, ldi_flag, immbuff ,alu_result,data_out, alu_write, mem2reg, clk, rsGet,rtGet,rdGet); 
		   

		   
	   	alu_write<=	(not OP_S1 and not OP_S2 and not OP_S3) or
					   (not OP_S1 and not OP_S2 and OP_S3) or 
					   (not OP_S1 and OP_S2 and not OP_S3) or 
					   (OP_S1 and not OP_S2 and not OP_S3) or 
					   (not OP_S1 and OP_S2 and OP_S3);
		mem2reg<= OP_S1 AND OP_S2 AND OP_S3;
		memwrite<= OP_S1 AND OP_S2 AND NOT OP_S3;
	
   	   	rd_alu<=rd;
	   	aluop : ALU port map (rsGet, rtGet, alu_result, OP_S1, OP_S2, OP_S3, ALU_status);	  --does not output for op > b'0100'
					   
		datamemory : datamem port map (rdGet, imm, memwrite, mem2reg, clk, data_out); 	

	
		
		   --reset writeReg
		--determine if ldi
		--regfile
			--retrieve register values rs, rt
			--if ldi, then NOT alu and NOT memread
		
		--determine if writeReg
		--alu
			--perform calculation
			--output as alu_sol
		--determine if mem2Reg	(exclusive)
		--determine if memWrite (exclusive)
		--datamem 
			--if memwrite, write register contents to memory
			--if mem2reg, get contents from memory, writeReg = TRUE
		
		   
		

		
		
	

	





	
end decoder_arch;
	
	
