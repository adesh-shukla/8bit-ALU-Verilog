module testbench;
  reg [3:0]a,b;
  reg [1:0]sel;
  reg sub;
  wire cout;
  wire [3:0]sum, q;
  
  ALU4 uut(
    .a(a),
    .b(b),
    .sel(sel),
    .sub(sub),
    .cout(cout),
    .sum(sum),
    .q(q)
  );
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,testbench);
      $monitor(" a=%b b=%b sub=%b sel=%b | sum=%b cout=%b q=%b",
               a, b, sub, sel, sum, cout,q);
      sel=2'b00; sub=0; a=4'hA; b=4'h5; #10;
      sel=2'b01; sub=0; a=4'hA; b=4'h5; #10;
      sel=2'b10; sub=0; a=4'hA; b=4'h5; #10;
      sel=2'b11; sub=0; a=4'hA; b=4'h5; #10;
      sel=2'b11; sub=1; a=4'hA; b=4'h5; #10;
      $finish;
    end
endmodule
      