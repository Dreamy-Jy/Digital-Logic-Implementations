//// this is library dont touch!!
//// you have INV, NAND2, AND2, OR2, NOR2, XOR2, XNOR2
module INV (f, a);
  input a;
  output f;
  assign #0.2 f = ~a;
endmodule

module NAND2 (f, a, b);
  input a, b;
  output f;
  wire t;
  nand (t,a,b);
  assign #0.3 f = t;
endmodule

module AND2 (f, a, b);
  input a, b;
  output f;
  wire t;
  and (t,a,b);
  assign #0.5 f = t;
endmodule

module NOR2 (f, a, b);
  input a, b;
  output f;
  wire t;
  nor (t,a,b);
  assign #0.3 f = t;
endmodule

module OR2 (f, a, b);
  input a, b;
  output f;
  wire t;
  or (t,a,b);
  assign #0.5 f = t;
endmodule

module XOR2 (f, a, b);
  input a, b;
  output f;
  wire t;
  xor (t,a,b);
  assign #0.3 f = t;
endmodule

module XNOR2 (f, a, b);
  input a, b;
  output f;
  wire t;
  xnor (t,a,b);
  assign #0.3 f = t;
endmodule