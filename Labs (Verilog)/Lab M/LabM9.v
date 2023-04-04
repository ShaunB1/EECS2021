module LabM8;

    reg[31:0] PCin;
    reg RegWrite, clk, ALUSrc;
    reg[2:0] op;
    wire[31:0] wd, rd1, rd2, imm, ins, PCp4, z;
    wire[25:0] jTarget;
    wire zero;

    yIF myIF(ins, PCp4, PCin, clk);
    yID myID(rd1, rd2, imm, jTarget, branch, ins, wd, RegWrite, clk);
    yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
    yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
    yWB myWB(wb, z, memOut, Mem2Reg);

    assign wd = wb;

    initial begin

        PCin = 16'h28;

        repeat(43) begin
            
            clk = 1;
            #1;

            RegWrite = 0; 
            ALUSrc = 1; 
            op = 3'b010;
            MemRead = 0;
            MemWrite = 0;
            Mem2Reg = 0;

            if(ins[6:0] == 7'h33) begin // R-type
                RegWrite = 1;
                ALUSrc = 0;
                MemRead = 0;
                MemWrite = 0;
                Mem2Reg = 0;

                op = 3'b010; // add

                if(ins[14:12] == 3'b110) begin
                    op = 3'b001; // or
                end

            end

            else if(ins[6:0] == 7'h3) begin // I-type, lw
                RegWrite = 1;
                ALUSrc = 1;
                MemRead = 1;
                MemWrite = 0;
                Mem2Reg = 1;
            end

            else if(ins[6:0] == 7'h13) begin // I-type, addi
                RegWrite = 1;
                ALUSrc = 1;
                MemRead = 0;
                MemWrite = 0;
                Mem2Reg = 0;
            end

            else if(ins[6:0] == 7'h63) begin // SB-type, beq
                RegWrite = 0;
                ALUSrc = 0;
                op = 3'b110;
                MemRead = 0;
                MemWrite = 0;
            end

            else if(ins[6:0] == 7'h6F) begin // UJ-type, jal
                RegWrite = 1;
                ALUSrc = 1;
                MemRead = 0;
                MemWrite = 0;
            end

            else if(ins[6:0] == 7'h23) begin // S-type, sw
                RegWrite = 0;
                ALUSrc = 1;
                MemRead = 0;
                MemWrite = 1;
            end

            clk = 0;
            #1;

            #4;
            $display("%8h: rd1 = %d rd2 = %d imm = %d jTarget = %d z = %d zero = %b wb = %2d", ins, rd1, rd2, imm, jTarget, z, zero, wb);
            PCin = PCp4;

            if(ins[6:0] == 7'h63 && zero == 1) begin
                PCin = PCin + (imm << 1);
            end

            else if(int[6:0] == 7'h6F) begin
                PCin = PCin + (jTarget << 2);
            end

            else begin
                PCin = PCp4;
            end

        end

        $finish;

    end

endmodule