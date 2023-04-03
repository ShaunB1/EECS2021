module LabM2;
    
    reg [31:0] d, e, temp;
    reg clk, enable, flag;
    wire [31:0] z;

    register #(32) mine(z, d, clk, enable);
    
    initial begin

        flag = $value$plusargs("enable=%b", enable);
        clk = 0;

        $monitor("%5d: clk=%b,d=%d,z=%d,expect=%d", $time,clk,d,z, e);

        repeat(20) begin
            #2 temp = d;
            d = $random;
        end

        $finish;

    end

    always begin
        #5 clk = ~clk;
    end

    always @(posedge clk) begin
        e = clk ? d : temp;
    end

endmodule