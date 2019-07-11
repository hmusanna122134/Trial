`timescale 1ns/1ps

module vedic_16x16(a, b, clk ,  result);
    input  [15:0] a,b;
    input   clk ; 
    output [31:0] result;

    reg [31:0] result;
    
    wire [15:0] q0, q1, q2, q3,q4;
    wire [23:0] q5,q6;
    wire [15:0] temp1, temp2;
    wire [23:0] temp3,temp4; 

    reg  [15:0] a_in,b_in;


    always @(posedge clk ) begin
  	a_in <= a ; 
  	b_in <= b ; 
    end 


vedic_8x8 V9(a_in[7:0]  , b_in[7:0] , q0[15:0]);
vedic_8x8 V10(a_in[15:8], b_in[7:0] , q1[15:0]);
vedic_8x8 V11(a_in[7:0] , b_in[15:8], q2[15:0]);
vedic_8x8 V12(a_in[15:8], b_in[15:8], q3[15:0]);

assign temp1= {8'b00000000, q0[15:8]};
assign temp2= q1[15:0];
assign temp3= {8'b00000000, q2[15:0]}; 
assign temp4= {q3[15:0], 8'b00000000}; 

adder16 A3(temp1, temp2, q4);
adder24 A4(temp3, temp4, q5);
adder24 A5({8'b00000000,q4}, q5, q6);

 always @(posedge clk) begin
 	result[7:0]  <= q0[7:0];
 	result[31:8] <= q6[23:0];
 end

endmodule
