module labM;
reg [31:0] PCin;
reg RegDst, RegWrite, clk, ALUSrc, MemRead, MemWrite, Mem2Reg;
reg [2:0] op;

wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, memOut, wb;
wire [25:0] jTarget;
wire zero;

//Get pointer
yIF myIF(ins, PCp4, PCin, clk);

yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);

yEX myEX(z, zero, rd1, rd2, imm, op, ALUSrc);

yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);

yWB myWB(wb, z, memOut, Mem2Reg);
assign wd = wb;

initial
begin
	PCin = 32'h80;
	repeat(43)
	begin
		//Fetch an instruction
		#1;
		clk = 1'b1;

		//Set Control Signals
		#1;
		op = 3'b010;


		if (ins[31:26] == 0)
		begin
			//R-type
			RegDst = 1; 	
			RegWrite = 1;	
			ALUSrc = 0;		
			MemRead = 0;	
			MemWrite = 0;	
			Mem2Reg = 0;	
			if (ins[5:0] == 6'h24) op = 3'b000;			
			else if (ins[5:0] == 6'h25) op = 3'b001;	
			else if (ins[5:0] == 6'h20) op = 3'b010;	
			else if (ins[5:0] == 6'h22) op = 3'b110;
			else if (ins[5:0] == 6'h2a) op = 3'b111;	
		end
		else if(ins[31:26] == 2)
		begin
			//J-type
			RegDst = 0;
			RegWrite = 0;
			ALUSrc = 1;
			MemRead = 0;
			MemWrite = 0;
			Mem2Reg = 0;
		end
		else
		begin
			//I-type
			if (ins[31:26] == 6'h8)			//addi
			begin
				RegDst = 0;
				RegWrite = 1;
				ALUSrc = 1;
				MemRead = 0;
				MemWrite = 0;
				Mem2Reg = 0;
			end
			else if (ins[31:26] == 6'h23)	//lw
			begin
				RegDst = 0;
				RegWrite = 1;
				ALUSrc = 1;
				MemRead = 1;
				MemWrite = 0;
				Mem2Reg = 1;
			end
			else if (ins[31:26] == 6'h2b)	//sw
			begin
				RegDst = 0;
				RegWrite = 0;
				ALUSrc = 1;
				MemRead = 0;
				MemWrite = 1;
				Mem2Reg = 0;
			end
			else if (ins[31:26] == 6'h4)	//beq
			begin
				RegDst = 0;
				RegWrite = 0;
				ALUSrc = 0;
				MemRead = 0;
				MemWrite = 0;
				Mem2Reg = 0;
			end
		end


		//Execute this insturction
		#1;
		clk = 1'b0;

		//View Results
		#1;
		$display("%h: rd1=%2d rd2=%2d z=%3d zero=%b wb=%2d",
                      ins, rd1, rd2, z, zero, wb);

		//Next
		#1;
		//PCin = PCp4;
		if ((ins[31:26] == 6'h4) && (zero == 1))	//if equal
		begin
			PCin = PCp4 + imm * 4;
		end
		else if (ins[31:26] == 2)					//if "j"
		begin
			PCin = jTarget * 4;
		end
		else										//else normal
		begin
			PCin = PCp4;
		end
	end
end
endmodule