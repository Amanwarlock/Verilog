module twoN_bitcomparator #(
  parameter N = 2
)(
  input xgtyin,
  input xltyin,
  input [(2*N-1):0]x,
  input [(2*N-1):0]y,
  output xgty,
  output xlty,
  output xety
);
 
  wire [N:0] xgty_w,xlty_w,xety_w;
 
  assign xgty_w[N] = xgtyin;
  assign xlty_w[N] = xltyin;
 
  generate
    genvar i;
    for (i=0;i<=(N-1);i=i+1)
      begin:TWOBITGEN
  twobitcomparator u_1 (
          .xgtyin(xgty_w[i+1]),
          .xltyin(xlty_w[i+1]),
          .x(x[(2*i+1) : (2*i)]),
          .y(y[(2*i+1) : (2*i)]),
          .xgty(xgty_w[i]),
          .xlty(xlty_w[i]),
          .xety(xety_w[i])
  );
      end
  endgenerate
 
  assign xgty = xgty_w[0];
  assign xlty = xlty_w[0];
  assign xety = xety_w[0];
 
endmodule

