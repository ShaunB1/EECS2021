module LabM6;

    reg clk, read, write;
    reg[31:0] address, memIn;
    wire[31:0] memOut;

    mem data(memOut, address, memIn, clk, read, write);

    initial begin
        
        address = 16'h28;
        write = 0;
        read = 1;

        repeat(11) begin

            #1;

            if(memOut[6:0] == 7'h33) begin // R-type
                $display("funct7 = %d rs2 = %b rs1 = %b funct3 = %b rd = %b opcode = %b// R-type", memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
            end

            else if(memOut[6:0] == 7'h6F)  begin // UJ-type
                $display("imm = %b rd = %b opcode = %b // UJ-type", memOut[31:12], memOut[11:7], memOut[6:0]);
            end

            else if(memOut[6:0] == 7'h3 || memOut[6:0] == 7'h13) begin // I-type
                $display("imm = %b rs1 = %b funct3 = %b rd = %b opcode = %b", memOut[31:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
            end

            else if(memOut[6:0] == 7'h23) begin // S-type
                $display("imm = %b rs2 = %b rs1 = %b funct3 = %b imm = %b opcode = %b", memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
            end

            else if(memOut[6:0] == 7'h63) begin // SB-type
                $display("imm = %b rs2 = %b rs1 = %b funct3 = %b imm = %b opcode = %b", memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
            end
  
            address = address + 4;

        end

        $finish;

    end

endmodule