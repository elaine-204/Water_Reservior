`timescale 1ns/1ps

module water_reservtb;

    reg clk = 0;
    reg reset;
    reg [2:0] s;
    wire fr3, fr2, fr1, dfr;

   
    water_reserv dut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .fr3(fr3),
        .fr2(fr2),
        .fr1(fr1),
        .dfr(dfr)
    );

    
    always #5 clk = ~clk;

    
    initial begin
        $dumpfile("water.vcd");      
        $dumpvars(0, water_reservtb);

        $display("Time | s   | fr1 fr2 fr3 dfr");

       
        reset = 1; s = 3'b000;
        #10;

        reset = 0;

        s = 3'b000; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        s = 3'b001; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        s = 3'b011; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        s = 3'b111; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        s = 3'b011; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        s = 3'b000; #10;
        $display("%4t | %b |  %b   %b   %b   %b", $time, s, fr1, fr2, fr3, dfr);

        $finish;
    end

endmodule
