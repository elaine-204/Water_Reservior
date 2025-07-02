module water_reserv (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
);
    parameter A=3'b000,B=3'b001,C=3'b011,D=3'b111;
    reg [3:1]state; reg [3:1] next; reg [3:1]prev_state;
    always@(posedge clk)
        begin
            if(reset)
                begin
                state<=A;
            prev_state<=A;
                end
            else 
                begin
                prev_state<=state;
                state<=next;
                end
        end
    always@(*)
        begin
            case(s)
                3'b000: next=A;
                3'b001: next=B;
                3'b011: next=C;
                3'b111: next=D;
                default: next=A;
            endcase
        end
                
    always@(*)
        begin
           case(state)
                A: begin fr1=1; fr2=1; fr3=1; dfr=1; end
               B: begin fr1=1; fr2=1; fr3=0; 
                   if(prev_state==3'b000)
                       dfr=0; 
               else
                   dfr=1;
               end
                   //(prev_state==3'b000)?0:1; end
               C: begin fr1=1; fr2=0; fr3=0; 
                   if (prev_state==3'b111)
                       dfr= 1; 
               else
                   dfr=0;
               end
                   //(prev_state==3'b111)?1:0; end
                D: begin fr1=0; fr2=0; fr3=0; dfr=0; end
                default: begin fr1=1; fr2=1; fr3=1; dfr=1; end
            endcase
        end
            
endmodule 