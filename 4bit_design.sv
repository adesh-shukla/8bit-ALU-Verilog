module ALU1(
  input a,
  input b,
  input cin,
  input [1:0]sel,
  input sub,
  output cout,
  output sum,
  output reg q
);
  wire b_modified, And, Or, XOR;
  
  assign b_modified = b^sub;
  assign And = a&b;
  assign Or = a|b;
  assign XOR = a^b;
  assign sum = a^b_modified^cin;
  assign cout = (a&b_modified)|(a&cin)|(b_modified&cin);
  
  always @(*)begin
    case(sel)
      2'b00:q = And;
      2'b01:q = Or;
      2'b10:q = XOR;
      2'b11:q = sum;
      default:q = 0;
    endcase
  end
endmodule

module ALU4(
  input [3:0]a,b,
  input [1:0]sel,
  input sub,
  output cout,
  output [3:0]q,sum
);
  wire [4:0]c;
  assign c[0] = sub;
  genvar i;
  generate
    for(i=0; i<4; i=i+1)begin:alu
      ALU1 u1(
        .a(a[i]),
        .b(b[i]),
        .cin(c[i]),
        .sel(sel),
        .sub(sub),
        .cout(c[i+1]),
        .sum(sum[i]),
        .q(q[i])
      );
    end
  endgenerate
  assign cout = c[4];
endmodule      